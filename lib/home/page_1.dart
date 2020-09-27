import 'package:flutter/material.dart';
import 'package:carousel_pro/carousel_pro.dart';

class Page1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      heightFactor: 1.0,
      child: new Container(
        padding: EdgeInsets.all(0.0),
        height: 250.0,
        child: Carousel(
          autoplay: false,
          borderRadius: true,
          showIndicator: false,
          boxFit: BoxFit.cover,
          images: [
            AssetImage("assets/images/city1.jpg"),
            AssetImage("assets/images/city2.jpg"),
            AssetImage("assets/images/city3.jpg"),
            AssetImage("assets/images/city4.jpg"),
          ],
          animationCurve: Curves.fastOutSlowIn,
          animationDuration: Duration(milliseconds: 2000),
        ),
      ),
    );
  }
}
