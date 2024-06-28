import 'package:flutter/material.dart';

class UbicacionScreen extends StatelessWidget {
  const UbicacionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Ubicación'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: const Center(
        child: Text('Ubicación Screen'),
      ),
    );
  }
}
