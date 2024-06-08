import 'package:google_mlkit_translation/google_mlkit_translation.dart';

class LanguageTranslationService {
  Future<String> translate(String text, String from, String to) async {

    final TranslateLanguage sourceLanguage = BCP47Code.fromRawValue(from)!;
    final TranslateLanguage targetLanguage = BCP47Code.fromRawValue(to)!;

    final onDeviceTranslator = OnDeviceTranslator(
        sourceLanguage: sourceLanguage,
        targetLanguage: targetLanguage
    );

    try {
      final String response = await onDeviceTranslator.translateText(text);
      return response;
    }
    catch (e) {
      return 'Error: $e';
    }
    finally {
      onDeviceTranslator.close();
    }
  }
}