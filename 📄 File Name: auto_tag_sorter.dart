// auto_tag_sorter.dart
class ProductItem {
  final String id;
  final String name;
  final String description;
  final List<String> tags;

  ProductItem({
    required this.id,
    required this.name,
    required this.description,
    required this.tags,
  });
}

class AutoTagSorter {
  final List<ProductItem> allProducts;

  AutoTagSorter(this.allProducts);

  Map<String, List<ProductItem>> groupByTags() {
    final Map<String, List<ProductItem>> tagMap = {};

    for (var product in allProducts) {
      for (var tag in product.tags) {
        tagMap.putIfAbsent(tag, () => []);
        tagMap[tag]!.add(product);
      }
    }

    return tagMap;
  }

  List<ProductItem> searchByDescription(String keyword) {
    final lower = keyword.toLowerCase();
    return allProducts
        .where((p) => p.description.toLowerCase().contains(lower))
        .toList();
  }
}
