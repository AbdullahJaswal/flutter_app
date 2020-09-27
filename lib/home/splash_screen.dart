import 'dart:async';
import 'package:flutter/material.dart';

import 'package:flare_flutter/flare_actor.dart';

import 'package:sample/home/home_page.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  void initState() {
    super.initState();
    new Timer(Duration(milliseconds: 2800), navigate);
    changeOpacity();
  }

  double opacity = 0.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.withOpacity(0.1),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              alignment: Alignment.center,
              width: 200.0,
              height: 200.0,
              child: FlareActor(
                "assets/svgs/animation_1.flr",
                animation: "circular",
                fit: BoxFit.contain,
                alignment: Alignment.center,
              ),
            ),
            AnimatedOpacity(
              opacity: opacity,
              duration: Duration(seconds: 1),
              curve: Curves.fastOutSlowIn,
              child: Text(
                "Sample",
                style: TextStyle(
                  color: Colors.deepPurpleAccent,
                  fontSize: 25.0,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  changeOpacity() {
    Future.delayed(Duration(seconds: 1), () {
      setState(() {
        opacity = opacity == 0.0 ? 1.0 : 1.0;
        changeOpacity();
      });
    });
  }

  void navigate() {
    Navigator.of(context).pushReplacement(new PageRouteBuilder(
        maintainState: true,
        opaque: true,
        pageBuilder: (context, _, __) => new HomePage(title: "Sample"),
        transitionDuration: const Duration(seconds: 1),
        transitionsBuilder: (context, anim1, anim2, child) {
          return new FadeTransition(
            child: child,
            opacity: anim1,
          );
        }));
  }
}
