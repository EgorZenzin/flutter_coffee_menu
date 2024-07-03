import 'package:flutter/material.dart';

class CoffeeItem extends StatefulWidget {
  final String name;
  final String price;
  final String imageUrl;

  const CoffeeItem({super.key, required this.name, required this.price, required this.imageUrl});

  @override
  _CoffeeItemState createState() => _CoffeeItemState();
}

class _CoffeeItemState extends State<CoffeeItem> {
  int _quantity = 0;

  void _incrementQuantity() {
    if (_quantity < 10) {
      setState(() {
        _quantity++;
      });
    }
  }

  void _decrementQuantity() {
    if (_quantity > 0) {
      setState(() {
        _quantity--;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Image.asset(
              widget.imageUrl,
              height: 100,
              width: double.infinity,
              fit: BoxFit.contain,
            ),
            const SizedBox(height: 8),
            Text(widget.name, style: const TextStyle(fontSize: 18)),
            const SizedBox(height: 16),
            _quantity == 0
                ? ElevatedButton(
                    onPressed: _incrementQuantity,
                    child: Text(
                      widget.price, 
                      style: TextStyle(color: Colors.white) 
                    ),
                    style: ButtonStyle(
                      backgroundColor: WidgetStateProperty.all<Color>(Color(0xFF85C3DE)), 
                    ),
                  )
                : Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: Color(0xFF85C3DE)), 
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        IconButton(
                          icon: const Icon(Icons.remove),
                          onPressed: _decrementQuantity,
                        ),
                        Text('$_quantity'),
                        IconButton(
                          icon: const Icon(Icons.add),
                          onPressed: _incrementQuantity,
                        ),
                      ],
                    ),
                  ),
          ],
        ),
      ),
    );
  }
}