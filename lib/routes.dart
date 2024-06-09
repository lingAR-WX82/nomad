import 'package:go_router/go_router.dart';
import 'package:nomad/language_recognition/screens/camera_screen.dart';
import 'package:nomad/shared/screens/dashboard_screen.dart';

final router = GoRouter(initialLocation: '/', routes: [
  GoRoute(
      name: 'root',
      path: '/',
      builder: (context, state) => const DashboardScreen()),
  GoRoute(
      name: 'translate',
      path: '/translate',
      builder: (context, state) => const CameraScreen())
]);
