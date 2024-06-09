import 'package:flutter/cupertino.dart';
import 'package:nomad/routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
        home: CupertinoApp.router(routerConfig: router));
  }
}
