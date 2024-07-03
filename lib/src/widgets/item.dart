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
    return SizedBox(
      width: 180,
      child: Card(
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(2),
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
                      backgroundColor: WidgetStateProperty.all<Color>(const Color(0xFF85C3DE)), 
                    ),
                  )
                : Container(
                    height: 36,
                    decoration: BoxDecoration(
                      border: Border.all(color: const Color(0xFF85C3DE)),
                      borderRadius: BorderRadius.circular(30.0)
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.min, 
                        children: [
                          IconButton(
                            icon: const Icon(Icons.remove),
                            onPressed: _decrementQuantity,
                            padding: const EdgeInsets.symmetric(horizontal: 5.0), 
                          ),
                          Text('$_quantity'),
                          IconButton(
                            icon: const Icon(Icons.add),
                            onPressed: _incrementQuantity,
                            padding: const EdgeInsets.symmetric(horizontal: 5.0), 
                          ),
                        ],
                      ),
                    ),
                  ),
          ],
        ),
      ),
      )
    );
  }
}  