// 📄 lib/widgets/tag_filter_bar.dart
import 'package:flutter/material.dart';

class TagFilterBar extends StatelessWidget {
  final List<String> tags;
  final String selectedTag;
  final void Function(String tag) onSelected;

  const TagFilterBar({
    super.key,
    required this.tags,
    required this.selectedTag,
    required this.onSelected,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 44,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 12),
        itemCount: tags.length,
        separatorBuilder: (context, index) => const SizedBox(width: 8),
        itemBuilder: (context, index) {
          final tag = tags[index];
          final isActive = tag == selectedTag;

          return ChoiceChip(
            label: Text(tag),
            selected: isActive,
            onSelected: (_) => onSelected(tag),
            selectedColor: Colors.deepPurple.shade100,
            labelStyle: TextStyle(color: isActive ? Colors.deepPurple : Colors.black),
          );
        },
      ),
    );
  }
}
