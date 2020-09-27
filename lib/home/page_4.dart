import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';

class Page4 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.withOpacity(0.1),
      body: Container(
        child: FlareActor(
          "assets/svgs/animation_1.flr",
          animation: "circular",
          fit: BoxFit.contain,
          alignment: Alignment.center,
        ),
      ),
    );
  }
}
