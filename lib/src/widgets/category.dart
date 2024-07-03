import 'package:flutter/material.dart';
import 'package:flutter_coffee_menu/src/widgets/item.dart';
import 'package:flutter_coffee_menu/src/data/coffee_data.dart';


class CategorySection extends StatelessWidget {
  final String title;

  const CategorySection({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> coffeeItems = getCoffeeItemsForCategory(title);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 8),
        GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 8,
            mainAxisSpacing: 8,
            childAspectRatio: 0.55,
          ),
          itemCount: coffeeItems.length,
          itemBuilder: (context, index) => CoffeeItem(
            name: coffeeItems[index]['name']!,
            price: coffeeItems[index]['price']!,
            imageUrl: coffeeItems[index]['imageUrl']!,
          ),
        ),
        const SizedBox(height: 32),
      ],
    );
  }
}