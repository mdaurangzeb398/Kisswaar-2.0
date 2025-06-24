// smart_search_engine.dart
class SmartSearchEngine {
  final List<String> allProducts;
  final List<String> recentSearches = [];
  final int maxHistory = 5;

  SmartSearchEngine({required this.allProducts});

  List<String> suggest(String query) {
    final lower = query.toLowerCase();
    return allProducts
        .where((p) => p.toLowerCase().contains(lower))
        .take(10)
        .toList();
  }

  void addToHistory(String term) {
    recentSearches.remove(term);
    recentSearches.insert(0, term);
    if (recentSearches.length > maxHistory) {
      recentSearches.removeLast();
    }
  }

  List<String> getRecentSearches() => List.from(recentSearches);
}
