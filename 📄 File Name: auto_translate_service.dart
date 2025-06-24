// auto_translate_service.dart
import 'package:translator/translator.dart';

class AutoTranslateService {
  final translator = GoogleTranslator();

  Future<String> translateText(String input, {String targetLang = 'hi'}) async {
    try {
      final result = await translator.translate(input, to: targetLang);
      return result.text;
    } catch (e) {
      return input; // fallback to original if error
    }
  }

  Future<List<String>> translateList(List<String> texts, {String targetLang = 'hi'}) async {
    List<String> translated = [];
    for (final text in texts) {
      translated.add(await translateText(text, targetLang: targetLang));
    }
    return translated;
  }
}
