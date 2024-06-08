import 'package:flutter/material.dart';
import 'dart:ui';

class AppLayout extends StatefulWidget {
  final Widget child;
  final Widget? topBar, navBar;

  const AppLayout({super.key, this.topBar, this.navBar, required this.child});

  @override
  State<StatefulWidget> createState() => _AppLayoutState();
}

class _AppLayoutState extends State<AppLayout> {
  final Color backgroundColor = const Color(0xFF000000);

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final screenWidth = screenSize.width;
    final screenHeight = screenSize.height;

    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(title: const Text('Nomad')),
      body: SizedBox(
          width: screenWidth, height: screenHeight, child: widget.child),
      bottomNavigationBar: widget.navBar,
    );
  }
}
