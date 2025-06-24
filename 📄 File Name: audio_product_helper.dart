// audio_product_helper.dart
import 'package:flutter_tts/flutter_tts.dart';

class AudioProductHelper {
  final FlutterTts _tts = FlutterTts();

  Future<void> speakProductDetails({
    required String name,
    required String description,
    required double price,
    String currency = '₹',
  }) async {
    final text = '''
You are viewing: $name.
Price: $currency$price.
Details: $description
    ''';

    await _tts.setLanguage("en-IN");
    await _tts.setPitch(1.0);
    await _tts.setSpeechRate(0.48);
    await _tts.speak(text);
  }

  void stopSpeaking() {
    _tts.stop();
  }
}
