// loyalty_rewards_manager.dart
class LoyaltyRewardsManager {
  int _points = 0;

  void addPoints(int amountSpent) {
    _points += (amountSpent ~/ 10); // 1 point for every ₹10 spent
  }

  int getPoints() => _points;

  String getTier() {
    if (_points >= 1000) return 'Platinum';
    if (_points >= 500) return 'Gold';
    if (_points >= 200) return 'Silver';
    return 'Bronze';
  }

  void redeemPoints(int pointsToRedeem) {
    if (pointsToRedeem <= _points) {
      _points -= pointsToRedeem;
    } else {
      throw Exception("Not enough points to redeem.");
    }
  }
}
