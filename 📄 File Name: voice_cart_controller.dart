// voice_cart_controller.dart
import 'package:speech_to_text/speech_to_text.dart' as stt;

class VoiceCartController {
  final stt.SpeechToText _speech = stt.SpeechToText();
  bool isListening = false;
  String lastCommand = '';

  Future<void> startListening(Function(String) onCommandDetected) async {
    bool available = await _speech.initialize();
    if (available) {
      isListening = true;
      _speech.listen(
        onResult: (result) {
          lastCommand = result.recognizedWords;
          if (lastCommand.isNotEmpty) {
            onCommandDetected(lastCommand);
          }
        },
        listenFor: Duration(seconds: 5),
        pauseFor: Duration(seconds: 2),
        localeId: 'en_US',
      );
    }
  }

  void stopListening() {
    _speech.stop();
    isListening = false;
  }
}
