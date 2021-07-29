import 'package:flutter/material.dart';

class Tick extends StatelessWidget {
  final DecorationImage image;
  Tick({this.image});
  @override
  Widget build(BuildContext context) {
    return (new Container(
      //padding: EdgeInsets.only(top: 1000),
      height: 100.0,
      width: 100.0,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(50.0),
        image: DecorationImage(
          image: AssetImage('assets/icon.png'),
          fit: BoxFit.cover,
        ),
      ),
    ));
  }
}
