import 'package:flutter/material.dart';
import 'package:nomad/shared/widgets/home.dart';
import 'profile_management/my_profile_screen.dart';
import 'profile_management/screens/settings_screen.dart';

void main() {
  runApp(const Application());
}

class Application extends StatelessWidget {
  const Application({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Nomad',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const Home(),
      routes: {
        '/profile': (context) => MyProfileScreen(),
        '/settings': (context) => SettingsScreen(),
        '/historial': (context) => HistorialScreen(),
        '/ubicacion': (context) => UbicacionScreen(),
      },
    );
  }
}
