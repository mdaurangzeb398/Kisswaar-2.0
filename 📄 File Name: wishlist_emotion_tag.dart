// wishlist_emotion_tag.dart
class WishlistItem {
  final String productId;
  final String productName;
  final String moodTag; // e.g., "happy", "sad", "romantic", etc.
  final DateTime savedOn;

  WishlistItem({
    required this.productId,
    required this.productName,
    required this.moodTag,
    required this.savedOn,
  });
}

class WishlistEmotionManager {
  final Map<String, WishlistItem> _wishlist = {};

  void addItem(WishlistItem item) {
    _wishlist[item.productId] = item;
  }

  void removeItem(String productId) {
    _wishlist.remove(productId);
  }

  List<WishlistItem> getAllItems() => _wishlist.values.toList();

  List<WishlistItem> getByMood(String mood) {
    return _wishlist.values
        .where((item) => item.moodTag.toLowerCase() == mood.toLowerCase())
        .toList();
  }
}
