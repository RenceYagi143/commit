import 'package:flutter/material.dart';
import '../main.dart'; // Import Routes if you need to navigate from here

class CartScreen extends StatelessWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cart'),
      ),
      body: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Cart Screen Content'),
            // You can add more widgets here to display cart items.
          ],
        ),
      ),
    );
  }
}
