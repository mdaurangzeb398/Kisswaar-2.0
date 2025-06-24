// 📄 lib/widgets/product_card_with_copy.dart

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../utils/auto_tag_sorter.dart';

class ProductCardWithCopy extends StatelessWidget {
  final ProductItem product;

  const ProductCardWithCopy({super.key, required this.product});

  void copyProduct(BuildContext context) {
    final content =
        '${product.name}\n${product.description}\nTags: ${product.tags.join(', ')}';
    Clipboard.setData(ClipboardData(text: content));
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('✅ Product copied to clipboard!')),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(product.name, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            const SizedBox(height: 4),
            Text(product.description, style: const TextStyle(fontSize: 14)),
            const SizedBox(height: 6),
            Text('Tags: ${product.tags.join(', ')}', style: const TextStyle(fontSize: 12, color: Colors.grey)),
            Align(
              alignment: Alignment.centerRight,
              child: IconButton(
                icon: const Icon(Icons.copy, color: Colors.deepPurple),
                onPressed: () => copyProduct(context),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
