import 'package:flutter/material.dart';
import 'package:nomad/language_recognition/screens/camera_screen.dart';
import 'package:nomad/profile_management/screens/settings_screen.dart';
import 'package:nomad/search_and_help/screens/explore_screen.dart';
import 'package:nomad/shared/screens/dashboard_screen.dart';
import 'package:nomad/profile_management/my_profile_screen.dart';

class Home extends StatefulWidget {
  final Widget? topBar, navBar;

  const Home({super.key, this.topBar, this.navBar});

  @override
  State<StatefulWidget> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final Color backgroundColor = const Color(0xFF000000);
  int _currentIndex = 0;

  final List<Widget> _widgetOptions = [
    const DashboardScreen(),
    const ExploreScreen(),
    const CameraScreen(),
    const MyProfileScreen(),
    const SettingsScreen()
  ];

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final screenWidth = screenSize.width;
    final screenHeight = screenSize.height;

    Widget bottomNavigationBar() {
      if (widget.navBar == null) {
        return BottomNavigationBar(
            onTap: (index) {
              setState(() {
                _currentIndex = index;
              });
            },
            currentIndex: _currentIndex,
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
      appBar: AppBar(title: const Text('Nomad')),
      body: SizedBox(
          width: screenWidth,
          height: screenHeight,
          child: IndexedStack(
            index: _currentIndex,
            children: _widgetOptions,
          )),
      bottomNavigationBar: bottomNavigationBar(),
    );
  }
}
