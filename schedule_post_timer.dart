// 📄 lib/scheduler/schedule_post_timer.dart

import 'dart:async';

class SchedulePostTimer {
  static void schedulePost(Duration delay, Function callback) {
    Timer(delay, () {
      callback();
    });
  }
}
