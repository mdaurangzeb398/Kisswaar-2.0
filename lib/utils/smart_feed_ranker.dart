final tagWeights = {
  'romantic': 8,
  'festive': 5,
  'formal': 2,
  // dynamic values based on user interaction
};

final ranker = SmartFeedRanker(tagWeights);
final rankedList = ranker.rank(productList);
