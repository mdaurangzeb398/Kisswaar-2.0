// offline_cache_layer.dart
import 'package:hive/hive.dart';

class OfflineCacheLayer {
  static const String boxName = 'offlineCacheBox';

  Future<void> init() async {
    await Hive.openBox(boxName);
  }

  Future<void> saveData(String key, dynamic value) async {
    final box = Hive.box(boxName);
    await box.put(key, value);
  }

  dynamic getData(String key) {
    final box = Hive.box(boxName);
    return box.get(key);
  }

  Future<void> clearData(String key) async {
    final box = Hive.box(boxName);
    await box.delete(key);
  }

  Future<void> clearAll() async {
    final box = Hive.box(boxName);
    await box.clear();
  }
}
