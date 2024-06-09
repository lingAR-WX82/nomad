import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'package:nomad/language_recognition/screens/camera_screen.dart';
import 'package:nomad/shared/screens/home_screen.dart';

final router = GoRouter(initialLocation: '/', routes: [
  GoRoute(
      name: 'root', path: '/', builder: (context, state) => const HomeScreen()),
  GoRoute(
      name: 'translate',
      path: '/translate',
      builder: (context, state) => const CameraScreen())
]);
