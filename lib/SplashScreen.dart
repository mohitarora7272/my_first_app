import 'dart:async';
import 'package:flutter/material.dart';
import 'assets.dart';

void main() => runApp(SplashScreen());

class SplashScreen extends StatefulWidget {
  SplashScreen({Key key}) : super(key: key);

  @override
  _SplashScreenState createState() => new _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  startTime() async {
    var _duration = new Duration(seconds: 3);
    return new Timer(_duration, navigationPage);
  }

  void navigationPage() {
    Navigator.of(context).pushReplacementNamed('/SignInSelectScreen');
  }

  @override
  void initState() {
    super.initState();
    startTime();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            backgroundColor: Colors.purple,
            body: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                getIcon(),
                getTransParentContainer(),
                getAppName(),
              ],
            )));
  }

  Widget getIcon() {
    return new Center(
      child: new Image(
        image: AssetImage(ImageAssets.logo),
        height: 160.0,
        width: 160.0,
        gaplessPlayback: true,
      ),
    );
  }

  Widget getAppName() {
    return new Center(
      child: new Text(
        StringAssets.appName,
        textAlign: TextAlign.center,
        style: getTextStyle(),
      ),
    );
  }

  TextTheme getTextTheme() {
    return Theme.of(context).textTheme.apply(
          bodyColor: Colors.white,
          displayColor: Colors.white,
        );
  }

  TextStyle getTextStyle() {
    return new TextStyle(
        fontWeight: FontWeight.bold, fontSize: 25.0, color: Colors.white);
  }

  Widget getTransParentContainer() {
    return Container(
      height: 10.0,
      color: Colors.transparent,
    );
  }
}