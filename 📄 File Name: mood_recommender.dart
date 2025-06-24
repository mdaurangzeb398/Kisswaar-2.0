// mood_recommender.dart
class MoodRecommender {
  static Map<String, List<String>> moodMap = {
    'happy': ['party wear', 'gadgets', 'travel kits'],
    'sad': ['comfort food', 'motivational books', 'self-care'],
    'excited': ['new arrivals', 'gaming gear', 'sneakers'],
    'bored': ['puzzles', 'DIY kits', 'movies'],
    'romantic': ['gifts', 'perfume', 'decor'],
  };

  static List<String> getRecommendations(String mood) {
    return moodMap[mood.toLowerCase()] ?? ['bestsellers', 'trending'];
  }
}
