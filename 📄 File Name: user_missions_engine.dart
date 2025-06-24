// user_missions_engine.dart
class UserMission {
  final String id;
  final String title;
  final String condition; // Ex: "Add 3 items to cart"
  final int progress;
  final int target;
  final String reward; // Ex: "50 Coins"

  UserMission({
    required this.id,
    required this.title,
    required this.condition,
    required this.progress,
    required this.target,
    required this.reward,
  });

  bool isCompleted() => progress >= target;

  UserMission copyWith({int? newProgress}) {
    return UserMission(
      id: id,
      title: title,
      condition: condition,
      progress: newProgress ?? progress,
      target: target,
      reward: reward,
    );
  }
}

class MissionEngine {
  final Map<String, UserMission> _missions = {};

  void addMission(UserMission mission) {
    _missions[mission.id] = mission;
  }

  void updateProgress(String missionId, int step) {
    if (_missions.containsKey(missionId)) {
      final m = _missions[missionId]!;
      _missions[missionId] = m.copyWith(newProgress: m.progress + step);
    }
  }

  List<UserMission> getActiveMissions() {
    return _missions.values.where((m) => !m.isCompleted()).toList();
  }

  List<UserMission> getCompletedMissions() {
    return _missions.values.where((m) => m.isCompleted()).toList();
  }
}
