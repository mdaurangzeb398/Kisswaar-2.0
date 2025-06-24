// cart_page.dart
import 'package:flutter/material.dart';

class CartPage extends StatelessWidget {
  final List<Map<String, dynamic>> cartItems;
  final void Function(int index) onRemove;

  const CartPage({super.key, required this.cartItems, required this.onRemove});

  double getTotal() {
    return cartItems.fold(0, (sum, item) => sum + (item['price'] as double));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Your Cart')),
      body: cartItems.isEmpty
          ? const Center(child: Text('🛒 Cart is empty'))
          : ListView.builder(
              itemCount: cartItems.length,
              itemBuilder: (context, index) {
                final item = cartItems[index];
                return ListTile(
                  title: Text(item['title']),
                  subtitle: Text('₹${item['price']}'),
                  trailing: IconButton(
                    icon: const Icon(Icons.delete),
                    onPressed: () => onRemove(index),
                  ),
                );
              },
            ),
      bottomNavigationBar: Container(
        color: Colors.white,
        padding: const EdgeInsets.all(16),
        child: ElevatedButton(
          onPressed: () {
            // TODO: Add checkout flow
            debugPrint('🧾 Proceeding to checkout');
          },
          child: Text('Checkout • ₹${getTotal().toStringAsFixed(2)}'),
        ),
      ),
    );
  }
}
