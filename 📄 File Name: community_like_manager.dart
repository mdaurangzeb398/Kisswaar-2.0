// community_like_manager.dart
class CommunityLikeManager {
  final Map<String, int> _likeMap = {};

  void likeProduct(String productId) {
    _likeMap[productId] = (_likeMap[productId] ?? 0) + 1;
  }

  int getLikes(String productId) {
    return _likeMap[productId] ?? 0;
  }

  Map<String, int> getAllLikes() => Map.from(_likeMap);
}
