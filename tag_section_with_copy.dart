// 📄 lib/widgets/tag_section_with_copy.dart

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../utils/auto_tag_sorter.dart';

class TagSectionWithCopy extends StatelessWidget {
  final Map<String, List<ProductItem>> groupedTags;

  const TagSectionWithCopy({super.key, required this.groupedTags});

  void copyTagSection(BuildContext context, String tag, List<ProductItem> items) {
    final content = 'Tag: $tag\nProducts:\n${items.map((e) => '- ${e.name}').join('\n')}';
    Clipboard.setData(ClipboardData(text: content));

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Copied "$tag" section to clipboard')),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: groupedTags.entries.map((entry) {
        final tag = entry.key;
        final products = entry.value;

        return Card(
          margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(tag.toUpperCase(), style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                    IconButton(
                      icon: const Icon(Icons.copy),
                      onPressed: () => copyTagSection(context, tag, products),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                ...products.map((p) => Text('• ${p.name}')).toList(),
              ],
            ),
          ),
        );
      }).toList(),
    );
  }
}
