import 'package:flutter/material.dart';

class UbicacionScreen extends StatelessWidget {
  const UbicacionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Ubicación'),
      ),
      body: const Center(
        child: Text('Esta es la pantalla de ubicación'),
      ),
    );
  }
}
