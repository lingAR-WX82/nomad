import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:google_mlkit_text_recognition/google_mlkit_text_recognition.dart';
import 'package:google_mlkit_translation/google_mlkit_translation.dart';
import 'package:nomad/language_recognition/widgets/detector_widget.dart';

import '../painters/text_recognizer_painter.dart';
import '../services/language_translation_service.dart';

class CameraScreen extends StatefulWidget {
  const CameraScreen({super.key});

  @override
  State<CameraScreen> createState() => _CameraScreenState();
}

class _CameraScreenState extends State<CameraScreen> {
  final _script = TextRecognitionScript.latin;
  final _textRecognizer = TextRecognizer(script: TextRecognitionScript.latin);
  bool _canProcess = true;
  bool _isBusy = false;
  CustomPaint? _customPaint;
  String? _text;

  @override
  void dispose() async {
    _canProcess = false;
    _textRecognizer.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return DetectorWidget(
      title: 'Text Detector',
      customPaint: _customPaint,
      text: _text,
      onImage: _processImage,
    );
  }

  Future<void> _processImage(InputImage inputImage) async {
    if (!_canProcess) return;
    if (_isBusy) return;
    _isBusy = true;
    setState(() {
      _text = '';
    });
    final recognizedText = await _textRecognizer.processImage(inputImage);

    final LanguageTranslationService translationService =
        LanguageTranslationService();
    final modelManager = OnDeviceTranslatorModelManager();

    // await modelManager.deleteModel(TranslateLanguage.english.bcpCode);
    // await modelManager.deleteModel(TranslateLanguage.spanish.bcpCode);

    modelManager
        .isModelDownloaded(TranslateLanguage.spanish.bcpCode)
        .then((value) async {
      if (!value) {
        await modelManager.downloadModel(TranslateLanguage.spanish.bcpCode);
      }
    });

    var translatedBlocks =
        await Future.wait(recognizedText.blocks.map((textBlock) async {
      var text = await translationService.translate(textBlock.text, 'en', 'es');
      return text;
    }));

    if (inputImage.metadata?.size != null &&
        inputImage.metadata?.rotation != null) {
      final painter = TextRecognizerPainter(
        translatedBlocks,
        recognizedText,
        inputImage.metadata!.size,
        inputImage.metadata!.rotation,
        CameraLensDirection.back,
      );
      _customPaint = CustomPaint(painter: painter);
    } else {
      _text = 'Recognized text:\n\n${recognizedText.text}';
      // TODO: set _customPaint to draw boundingRect on top of image
      _customPaint = null;
    }
    _isBusy = false;
    if (mounted) {
      setState(() {});
    }
  }
}
