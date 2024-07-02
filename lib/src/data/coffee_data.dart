List<Map<String, String>> getCoffeeItemsForCategory(String category) {
    final List<Map<String, String>> items = [
      {'name': 'Эспрессо', 'price': '99 руб', 'imageUrl': 'assets/images/coffee.png', 'category': 'Черный кофе'},
      {'name': 'Американо', 'price': '99 руб', 'imageUrl': 'assets/images/coffee2.png', 'category': 'Черный кофе'},
      {'name': 'Ристретто', 'price': '129 руб', 'imageUrl': 'assets/images/coffee.png', 'category': 'Черный кофе'},
      {'name': 'Лунго', 'price': '129 руб', 'imageUrl': 'assets/images/coffee2.png', 'category': 'Черный кофе'},
      {'name': 'Капучино', 'price': '149 руб', 'imageUrl': 'assets/images/coffee.png', 'category': 'Кофе с молоком'},
      {'name': 'Латте', 'price': '149 руб', 'imageUrl': 'assets/images/coffee2.png', 'category': 'Кофе с молоком'},
      {'name': 'Флэт Уайт', 'price': '189 руб', 'imageUrl': 'assets/images/coffee.png', 'category': 'Кофе с молоком'},
      {'name': 'Макиато', 'price': '199 руб', 'imageUrl': 'assets/images/coffee2.png', 'category': 'Кофе с молоком'},
      {'name': 'Зеленый чай', 'price': '99 руб', 'imageUrl': 'assets/images/coffee.png', 'category': 'Чай'},
      {'name': 'Черный чай', 'price': '99 руб', 'imageUrl': 'assets/images/coffee2.png', 'category': 'Чай'},
      {'name': 'Улун', 'price': '119 руб', 'imageUrl': 'assets/images/coffee.png', 'category': 'Чай'},
      {'name': 'Чай с жасмином', 'price': '129 руб', 'imageUrl': 'assets/images/coffee2.png', 'category': 'Чай'},
      {'name': 'Мокка', 'price': '219 руб', 'imageUrl': 'assets/images/coffee.png', 'category': 'Авторские напитки'},
      {'name': 'Фраппучино', 'price': '229 руб', 'imageUrl': 'assets/images/coffee2.png', 'category': 'Авторские напитки'},
      {'name': 'Карамельный латте', 'price': '239 руб', 'imageUrl': 'assets/images/coffee.png', 'category': 'Авторские напитки'},
      {'name': 'Мятный мокка', 'price': '249 руб', 'imageUrl': 'assets/images/coffee2.png', 'category': 'Авторские напитки'},
    ];

    return items.where((item) => item['category'] == category).toList();
  }