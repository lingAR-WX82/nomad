import 'package:flutter/material.dart';
import 'package:google_mlkit_translation/google_mlkit_translation.dart';
import 'package:nomad/language_recognition/painters/camera_mask_painter.dart';
import 'package:nomad/language_recognition/widgets/camera_widget.dart';

class DetectorWidget extends StatefulWidget {
  const DetectorWidget({
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
  State<DetectorWidget> createState() => _DetectorWidgetState();
}

class _DetectorWidgetState extends State<DetectorWidget> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          constraints: const BoxConstraints.expand(),
          child: Camera(
            customPaint: widget.customPaint,
            onImage: widget.onImage,
            onCameraFeedReady: widget.onCameraFeedReady,
          ),
        ),
        CustomPaint(
          painter: CameraMaskPainter(),
          child: Container(),
        )
      ],
    );
  }
}