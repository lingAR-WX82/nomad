import 'package:flutter/material.dart';

import 'package:nomad/shared/widgets/home.dart';

void main() {
  runApp(const Application());
}

class Application extends StatelessWidget {
  const Application({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(home: Home());
  }
}
