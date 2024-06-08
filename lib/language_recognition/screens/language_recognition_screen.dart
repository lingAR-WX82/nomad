import 'package:flutter/material.dart';
import 'package:google_mlkit_translation/google_mlkit_translation.dart';
import 'package:nomad/language_recognition/widgets/camera_widget.dart';

class LanguageRecognitionScreen extends StatefulWidget {
  const LanguageRecognitionScreen({
    super.key,
    required this.title,
    required this.onImage,
    this.onCameraFeedReady,
    this.customPaint,
    this.text,
  });

  final String title;
  final CustomPaint? customPaint;
  final String? text;
  final Function(InputImage inputImage) onImage;
  final Function()? onCameraFeedReady;

  @override
  State<LanguageRecognitionScreen> createState() => _LanguageRecognitionScreenState();
}

class _LanguageRecognitionScreenState extends State<LanguageRecognitionScreen> {
  @override
  Widget build(BuildContext context) {
    return Camera(
      customPaint: widget.customPaint,
      onImage: widget.onImage,
      onCameraFeedReady: widget.onCameraFeedReady,
    );
  }
}