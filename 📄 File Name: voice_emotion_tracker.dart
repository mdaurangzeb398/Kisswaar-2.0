// voice_emotion_tracker.dart
import 'package:speech_to_text/speech_to_text.dart' as stt;

class VoiceEmotionTracker {
  final stt.SpeechToText _speech = stt.SpeechToText();
  bool isListening = false;
  String lastCommand = '';
  double lastConfidence = 0.0;

  Future<void> startListening(Function(String moodLabel) onEmotionDetected) async {
    bool available = await _speech.initialize(
      onStatus: (status) => {},
      onError: (error) => {},
    );

    if (available) {
      isListening = true;
      _speech.listen(
        onResult: (result) {
          lastCommand = result.recognizedWords;
          lastConfidence = result.confidence;

          String inferredMood = _analyzeTextForMood(lastCommand, lastConfidence);
          onEmotionDetected(inferredMood);
        },
        localeId: 'en_US',
        listenMode: stt.ListenMode.confirmation,
      );
    }
  }

  void stopListening() {
    _speech.stop();
    isListening = false;
  }

  String _analyzeTextForMood(String input, double confidence) {
    final text = input.toLowerCase();

    if (confidence < 0.4) return 'uncertain';

    if (text.contains('happy') || text.contains('excited') || text.contains('awesome')) {
      return 'happy';
    } else if (text.contains('sad') || text.contains('tired') || text.contains('lonely')) {
      return 'sad';
    } else if (text.contains('bored') || text.contains('meh')) {
      return 'bored';
    } else if (text.contains('angry') || text.contains('frustrated')) {
      return 'angry';
    } else if (text.contains('love') || text.contains('romantic')) {
      return 'romantic';
    }

    return 'neutral';
  }
}
