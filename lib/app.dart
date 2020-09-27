import 'package:flutter/material.dart';
import 'package:flutter_statusbarcolor/flutter_statusbarcolor.dart';
import 'package:sample/home/splash_screen.dart';

import 'home/home_page.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    FlutterStatusbarcolor.setStatusBarColor(Colors.deepPurple);
    FlutterStatusbarcolor.setNavigationBarColor(Colors.deepPurple);

    return MaterialApp(
      title: "Flutter Sample",
      theme: _theme(),
      home: SplashScreen(),
    );
  }
}

ThemeData _theme() {
  return ThemeData(
      fontFamily: "OpenSans",
      primaryColor: Colors.white,
      accentColor: Colors.deepPurpleAccent,
      accentColorBrightness: Brightness.light,
      primaryTextTheme: TextTheme(
          title: TextStyle(
        color: Colors.deepPurpleAccent,
      )));
}
