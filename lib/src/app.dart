import 'package:flutter/material.dart';
import 'package:flutter_coffee_menu/src/theme/theme.dart';
import 'package:flutter_coffee_menu/src/view/menu_screen.dart';

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