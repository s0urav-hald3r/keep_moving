import 'package:flutter/material.dart';
import 'package:keep_moving/screens/login_screen/login_screen.dart';

import 'screens/mainmenu.dart';
import 'screens/splash_screen/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      routes: <String, WidgetBuilder>{
        "/mainmenu": (BuildContext context) => const MainMenu(),
        "/login": (BuildContext context) => const LoginScreen(),
      },
      home: const SplashScreen()
    );
  }
}
