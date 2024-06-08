import 'package:camera/camera.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CameraScreen extends StatefulWidget {
  const CameraScreen({super.key});
  @override
  State<CameraScreen> createState() => _CameraScreenState();
}

class _CameraScreenState extends State<CameraScreen> {
  late List<CameraDescription> _cameras;
  late CameraController _controller;
  var _isReady = false;
  bool _usePredefinedImage = true;
  final String _predefinedImagePath = 'assets/images/sample.jpeg';
  
  @override
  void initState() {
    super.initState();
    _initializeCamera();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
  
  @override
  Widget build(BuildContext context) {
    return Center(
      child: _isReady
          ? _usePredefinedImage
            ? Image.asset(_predefinedImagePath)
            : CameraPreview(_controller)
          : const CircularProgressIndicator()
    );
  }
  
  void _initializeCamera() async {
    try {
      _cameras = await availableCameras();
      _controller = CameraController(_cameras[0], ResolutionPreset.medium);

      await _controller.initialize();
    } on CameraException catch (e) {
      print(e);
    }

    if (mounted) setState(() => _isReady = true);
  }
}