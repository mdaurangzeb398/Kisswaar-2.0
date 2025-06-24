// 📄 lib/widgets/tag_section_export_card.dart

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../utils/auto_tag_sorter.dart';

class TagSectionExportCard extends StatelessWidget {
  final String tagName;
  final List<ProductItem> products;

  const TagSectionExportCard({
    super.key,
    required this.tagName,
    required this.products,
  });

  void exportSection(BuildContext context) {
    final text = '🛍️ Mood: $tagName\n\n' +
        products.map((p) => '• ${p.name} — ${p.description}').join('\n');

    Clipboard.setData(ClipboardData(text: text));
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Copied "$tagName" section with details')),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      child: Padding(
        padding: const EdgeInsets.all(14),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(tagName.toUpperCase(),
                    style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
                IconButton(
                  icon: const Icon(Icons.copy_all, color: Colors.deepPurple),
                  onPressed: () => exportSection(context),
                ),
              ],
            ),
            const SizedBox(height: 6),
            ...products.map((p) => Text('• ${p.name}', style: const TextStyle(fontSize: 14))),
          ],
        ),
      ),
    );
  }
}
