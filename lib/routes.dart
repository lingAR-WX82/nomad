import 'package:flutter/cupertino.dart';
import 'package:nomad/screens/camera_screen.dart';

Map<String, Widget Function(BuildContext)> routes = {
  '/camera': (context) => const CameraScreen()
};