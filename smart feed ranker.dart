// 📄 lib/utils/smart_feed_ranker.dart

import 'auto_tag_sorter.dart';

class SmartFeedRanker {
  final Map<String, int> tagWeights;

  SmartFeedRanker(this.tagWeights);

  /// Ranks products based on tag weights (more tap = more visibility)
  List<ProductItem> rank(List<ProductItem> products) {
    final List<ProductItem> ranked = List.from(products);

    ranked.sort((a, b) {
      final aScore = _getScore(a);
      final bScore = _getScore(b);
      return bScore.compareTo(aScore);
    });

    return ranked;
  }

  int _getScore(ProductItem p) {
    return p.tags.fold(0, (score, tag) => score + (tagWeights[tag] ?? 0));
  }
}
