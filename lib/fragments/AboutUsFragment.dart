import 'package:flutter/material.dart';
import 'package:my_first_app/assets.dart';

class AboutUsFragment extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Container(
        padding: EdgeInsets.all(10.0),
        child: ListView(
          children: <Widget>[
            new Text(
              StringAssets.lorem_ipsum_text,
              textDirection: TextDirection.ltr,
              textAlign: TextAlign.justify,
              style: getTextStyle(),
            ),
          ],
        ));
  }
}

TextStyle getTextStyle() {
  return new TextStyle(
    fontWeight: FontWeight.normal,
    color: Colors.black,
    fontSize: 15.0,
  );
}
