import 'package:flutter/material.dart';
import 'package:nomad/shared/screens/home_screen.dart';
import 'package:nomad/profile_management/my_profile_screen.dart';

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

    final List<Widget> _defaultNavScreens = [
      const HomeScreen(),
      const MyProfileScreen()
    ];

    Widget bottomNavigationBar() {
      if (widget.navBar == null) {
        return BottomNavigationBar(
            selectedItemColor: Colors.black,
            unselectedItemColor: Colors.black,
            selectedLabelStyle: const TextStyle(color: Colors.black),
            showUnselectedLabels: true,
            items: const [
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: 'Home',
              ),
              BottomNavigationBarItem(icon: Icon(Icons.map), label: 'Explore'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.camera_alt), label: 'Translate'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.person), label: 'Profile'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.settings), label: 'Settings')
            ]);
      } else {
        return widget.navBar!;
      }
    }

    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(title: const Text('Nomad')),
      body: SizedBox(
          width: screenWidth, height: screenHeight, child: widget.child),
      bottomNavigationBar: bottomNavigationBar(),
    );
  }
}
