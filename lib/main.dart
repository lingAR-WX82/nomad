import 'package:flutter/material.dart';
import 'package:google_mlkit_translation/google_mlkit_translation.dart';
import 'package:nomad/language_recognition/services/language_detector_service.dart';
import 'package:nomad/language_recognition/services/language_translation_service.dart';
import 'package:nomad/routes.dart';
import 'package:nomad/screens/camera_screen.dart';
import 'package:nomad/shared/widgets/layout/app_layout.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const MyHomePage(title: 'Flutter Demo Home Page'),
        initialRoute: '/',
        routes: routes);
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late LanguageDetectorService detectorProvider;
  late OnDeviceTranslatorModelManager modelManager;
  late LanguageTranslationService translateProvider;
  int _selectedIndex = 0;

  @override
  void initState() {
    super.initState();
    detectorProvider = LanguageDetectorService();
    modelManager = OnDeviceTranslatorModelManager();
    translateProvider = LanguageTranslationService();
  }

  void _translateText() {
    var hasSpanish = false;
    modelManager
        .isModelDownloaded(TranslateLanguage.spanish.bcpCode)
        .then((value) => hasSpanish = value);

    if (!hasSpanish) {
      print('Downloading Spanish model');
      modelManager
          .downloadModel(TranslateLanguage.spanish.bcpCode)
          .then((value) => {
                print('Spanish model downloaded'),
                translateProvider
                    .translate('Hola amigos como estan', 'es', 'en')
                    .then((value) => print(value))
              });
    }
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => const CameraScreen()));
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return AppLayout(
      navBar: BottomNavigationBar(
          onTap: _onItemTapped,
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
            BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
            BottomNavigationBarItem(
                icon: Icon(Icons.settings), label: 'Settings')
          ]),
      child: const CameraScreen(),
    );
  }
}
