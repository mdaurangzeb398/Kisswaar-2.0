// 📄 lib/widgets/product_card_copy_share.dart

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../utils/auto_tag_sorter.dart'; // for ProductItem
import 'package:share_plus/share_plus.dart'; // Add share_plus in pubspec.yaml

class ProductCardCopyShare extends StatelessWidget {
  final ProductItem product;

  const ProductCardCopyShare({super.key, required this.product});

  void copyToClipboard(BuildContext context) {
    final data =
        '${product.name}\n${product.description}\nTags: ${product.tags.join(', ')}';
    Clipboard.setData(ClipboardData(text: data));
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('📋 Copied to clipboard')),
    );
  }

  void shareNow() {
    final text =
        '${product.name}\n${product.description}\nTags: ${product.tags.join(', ')}';
    Share.share(text);
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(product.name, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
            const SizedBox(height: 4),
            Text(product.description),
            const SizedBox(height: 6),
            Text('Tags: ${product.tags.join(', ')}', style: const TextStyle(fontSize: 12, color: Colors.grey)),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                IconButton(onPressed: () => copyToClipboard(context), icon: const Icon(Icons.copy, color: Colors.deepPurple)),
                IconButton(onPressed: shareNow, icon: const Icon(Icons.share, color: Colors.green)),
              ],
            )
          ],
        ),
      ),
    );
  }
}
