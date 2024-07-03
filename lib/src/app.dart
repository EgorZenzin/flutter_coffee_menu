import 'package:flutter/material.dart';
import 'package:visibility_detector/visibility_detector.dart';
import 'package:flutter_coffee_menu/src/theme/theme.dart';
import 'package:flutter_coffee_menu/src/theme/app_colors.dart';
import 'package:flutter_coffee_menu/src/widgets/category.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: coffeeAppTheme,
      debugShowCheckedModeBanner: false,
      home: const CoffeeShopPage(),
    );
  }
}

class CoffeeShopPage extends StatefulWidget {
  const CoffeeShopPage({super.key});

  @override
  _CoffeeShopPageState createState() => _CoffeeShopPageState();
}

class _CoffeeShopPageState extends State<CoffeeShopPage> with SingleTickerProviderStateMixin {
  final List<String> categories = ['Черный кофе', 'Кофе с молоком', 'Чай', 'Авторские напитки'];
  final ScrollController _scrollController = ScrollController();
  final ScrollController _tabScrollController = ScrollController();
  final Map<String, GlobalKey> _categoryKeys = {};
  late TabController _tabController;
  int _selectedCategoryIndex = 0;
  bool _isTabClick = false;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: categories.length, vsync: this);
    for (var category in categories) {
      _categoryKeys[category] = GlobalKey();
    }
    _scrollController.addListener(_onScroll);
  }

  @override
  void dispose() {
    _scrollController.removeListener(_onScroll);
    _scrollController.dispose();
    _tabScrollController.dispose();
    _tabController.dispose();
    super.dispose();
  }

  void _onScroll() {
    if (_isTabClick) return;

    for (int i = 0; i < categories.length; i++) {
      final category = categories[i];
      final key = _categoryKeys[category];
      if (key != null) {
        final context = key.currentContext;
        if (context != null) {
          final box = context.findRenderObject() as RenderBox;
          final position = box.localToGlobal(Offset.zero).dy;
          if (position >= 0 && position <= MediaQuery.of(context).size.height / 2) {
            setState(() {
              _selectedCategoryIndex = i;
              _tabController.index = i;
            });
            break;
          }
        }
      }
    }
  }

  void _scrollToCategory(int index) {
    final category = categories[index];
    final key = _categoryKeys[category];
    if (key != null) {
      setState(() {
        _isTabClick = true;
        _selectedCategoryIndex = index;
        _tabController.index = index;
      });
      Scrollable.ensureVisible(
        key.currentContext!,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      ).then((_) {
        setState(() {
          _isTabClick = false;
        });
      });
      _scrollTabBarToIndex(index);
    }
  }

  void _scrollTabBarToIndex(int index) {
    const tabWidth = 100.0;
    final offset = index * tabWidth;
    _tabScrollController.animateTo(
      offset,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  void _onVisibilityChanged(String category, bool visible) {
    if (_isTabClick) return;

    final index = categories.indexOf(category);
    if (index != -1 && visible) {
      setState(() {
        _selectedCategoryIndex = index;
        _tabController.index = index;
      });
      _scrollTabBarToIndex(index);
    }
  }

   @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 32.0, top: 32.0),
            child: PreferredSize(
              preferredSize: const Size.fromHeight(48.0),
              child: SingleChildScrollView(
                controller: _tabScrollController,
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: categories.map((category) {
                    final isSelected = _selectedCategoryIndex == categories.indexOf(category);
                    return Padding(
                      padding: const EdgeInsets.only(right: 8.0),
                      child: ChoiceChip(
                        label: Text(category),
                        selected: isSelected,
                        onSelected: (selected) {
                          if (selected) {
                            _scrollToCategory(categories.indexOf(category));
                          }
                        },
                        selectedColor: CoffeeAppColors.activeCategoryBackground,
                        backgroundColor: CoffeeAppColors.categoryBackground,
                        labelStyle: TextStyle(
                          color: isSelected ? CoffeeAppColors.activeCategoryTextColor : CoffeeAppColors.categoryTextColor,
                        ),
                      ),
                    );
                  }).toList(),
                ),
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 32.0),
              child: CustomScrollView(
                controller: _scrollController,
                slivers: categories.map((category) {
                  return SliverToBoxAdapter(
                    key: _categoryKeys[category],
                    child: VisibilityDetector(
                      key: Key(category),
                      onVisibilityChanged: (visibilityInfo) {
                        if (visibilityInfo.visibleFraction > 0.8) {
                          _onVisibilityChanged(category, true);
                        }
                      },
                      child: CategorySection(title: category),
                    ),
                  );
                }).toList(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}