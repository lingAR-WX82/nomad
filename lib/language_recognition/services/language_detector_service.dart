import 'package:google_mlkit_language_id/google_mlkit_language_id.dart';

class LanguageDetectorService {
  Future<String> detectLanguage(String text) async {
    final languageIdentifier = LanguageIdentifier(confidenceThreshold: 0.5);

    try {
      final String response = await languageIdentifier.identifyLanguage(text);

      return response;
    }
    catch (e) {
      return 'error';
    }
    finally {
      languageIdentifier.close();
    }
  }
}