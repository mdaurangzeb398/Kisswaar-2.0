// 📄 lib/widgets/product_tag_feedback.dart

import 'package:flutter/material.dart';

class ProductTagFeedback extends StatelessWidget {
  final String productId;
  final void Function(String tag) onTagSelected;

  const ProductTagFeedback({
    super.key,
    required this.productId,
    required this.onTagSelected,
  });

  final List<String> tagOptions = const [
    'romantic',
    'trending',
    'minimal',
    'formal',
    'festive',
    'daily',
  ];

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Which mood fits best?'),
      content: Wrap(
        spacing: 8,
        children: tagOptions.map((tag) {
          return ChoiceChip(
            label: Text(tag),
            selected: false,
            onSelected: (_) => onTagSelected(tag),
          );
        }).toList(),
      ),
    );
  }
}
