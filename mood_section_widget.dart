// 📄 lib/widgets/mood_section_widget.dart
import 'package:flutter/material.dart';
import '../utils/auto_tag_sorter.dart';

class MoodSectionWidget extends StatelessWidget {
  final List<ProductItem> products;

  const MoodSectionWidget({super.key, required this.products});

  @override
  Widget build(BuildContext context) {
    final grouped = AutoTagSorter(products).groupByTags();

    return ListView(
      children: grouped.entries.map((entry) {
        final tag = entry.key;
        final taggedItems = entry.value;

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              child: Text(tag.toUpperCase(), style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            ),
            SizedBox(
              height: 260,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: taggedItems.length,
                itemBuilder: (context, index) {
                  final item = taggedItems[index];
                  return Container(
                    width: 180,
                    margin: const EdgeInsets.only(left: 16),
                    child: Card(
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                      child: Column(
                        children: [
                          const SizedBox(height: 8),
                          Text(item.name, style: const TextStyle(fontWeight: FontWeight.bold)),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(item.description, maxLines: 3, overflow: TextOverflow.ellipsis),
                          ),
                          Text("Tags: ${item.tags.join(', ')}", style: const TextStyle(fontSize: 11, color: Colors.grey)),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        );
      }).toList(),
    );
  }
}
