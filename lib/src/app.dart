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
  int _selectedCategoryIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 32.0, top: 16.0),
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