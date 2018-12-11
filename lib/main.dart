import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'HomeScreen.dart';
import 'SignInScreen.dart';
import 'SignInSelectScreen.dart';
import 'SignUpScreen.dart';
import 'SplashScreen.dart';
import 'assets.dart';

void main() => runApp(AppTest());

class AppTest extends StatelessWidget {
  // This widget is the root of your application.
  const AppTest();

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: StringAssets.appName,
      theme: ThemeData(
        primaryColor: const Color(ColorAssets.primaryColor),
        accentColor: const Color(ColorAssets.accentColor),
        scaffoldBackgroundColor: Colors.white,
      ),
      home: new SplashScreen(),
      routes: <String, WidgetBuilder>{
        '/SignInScreen': (BuildContext context) => new SignInScreen(),
        '/SignUpScreen': (BuildContext context) => new SignUpScreen(),
        '/SignInSelectScreen': (BuildContext context) =>
            new SignInSelectScreen(),
        '/HomeScreen': (BuildContext context) => new HomeScreen(),
      },
    );
  }
}

/*
 * Below code is not in used, this is only for reference
 * */
class MyAppRoute extends StatefulWidget {
  _MyAppRoutes createState() => new _MyAppRoutes();
}

class _MyAppRoutes extends State<MyAppRoute> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Welcome to Flutter'),
        ),
        body: Center(
          child: MaterialButton(
            onPressed: () {
              debugPrint('click here');
              Navigator.of(context).pushNamed('/b');
            },
            child: Text('Press'),
            padding: EdgeInsets.only(left: 50.0, right: 50.0),
            color: Colors.redAccent,
            textColor: Colors.white,
          ),
        ));
  }
}

class RandomWords extends StatefulWidget {
  RandomWordsState createState() => new RandomWordsState();
}

class RandomWordsState extends State<RandomWords> {
  @override
  Widget build(BuildContext context) {
    return Text("ABC");
  }
}

class FirstScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    getCoordinates() async {
      Map coordinates = await Navigator.of(context).pushNamed('/location');
      debugPrint('coordinates: $coordinates');
    }

    return Scaffold(
//      appBar: AppBar(
//        title: Text('First Screen'),
//      ),
      body: Center(
        child: RaisedButton(
          child: Text('Launch screen'),
          onPressed: () {
            getCoordinates();
//            Navigator.push(
//              context,
//              MaterialPageRoute(builder: (context) => SecondScreen()),
//            );
          },
        ),
      ),
    );
  }
}

class SecondScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Second Screen"),
      ),
      body: Center(
        child: RaisedButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: Text('Go back!'),
        ),
      ),
    );
  }
}

class SampleAppPage extends StatefulWidget {
  SampleAppPage({Key key}) : super(key: key);

  @override
  _SampleAppPageState createState() => _SampleAppPageState();
}

class _SampleAppPageState extends State<SampleAppPage> {
  // Default value for toggle
  bool toggle = true;

  void _toggle() {
    setState(() {
      toggle = !toggle;
    });
  }

  _getToggleChild() {
    if (toggle) {
      return Text('Toggle One');
    } else {
      return MaterialButton(onPressed: () {}, child: Text('Toggle Two'));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Sample App"),
      ),
      body: Center(
        child: _getToggleChild(),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _toggle,
        tooltip: 'Update Text',
        child: Icon(Icons.update),
      ),
    );
  }
}

class MyFadeTest extends StatefulWidget {
  MyFadeTest({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyFadeTest createState() => _MyFadeTest();
}

class _MyFadeTest extends State<MyFadeTest> with TickerProviderStateMixin {
  AnimationController controller;
  CurvedAnimation curve;

  @override
  void initState() {
    controller = AnimationController(
        duration: const Duration(milliseconds: 2000), vsync: this);
    curve = CurvedAnimation(parent: controller, curve: Curves.easeIn);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
          child: Container(
              child: FadeTransition(
                  opacity: curve,
                  child: FlutterLogo(
                    size: 100.0,
                  )))),
      floatingActionButton: FloatingActionButton(
        tooltip: 'Fade',
        child: Icon(Icons.brush),
        onPressed: () {
          controller.forward();
        },
      ),
    );
  }
}

class Signature extends StatefulWidget {
  SignatureState createState() => SignatureState();
}

class SignatureState extends State<Signature> {
  List<Offset> _points = <Offset>[];

  Widget build(BuildContext context) {
    return GestureDetector(
      onPanUpdate: (DragUpdateDetails details) {
        setState(() {
          RenderBox referenceBox = context.findRenderObject();
          Offset localPosition =
              referenceBox.globalToLocal(details.globalPosition);
          _points = List.from(_points)..add(localPosition);
        });
      },
      onPanEnd: (DragEndDetails details) => _points.add(null),
      child:
          CustomPaint(painter: SignaturePainter(_points), size: Size.infinite),
    );
  }
}

class SignaturePainter extends CustomPainter {
  SignaturePainter(this.points);

  final List<Offset> points;

  void paint(Canvas canvas, Size size) {
    var paint = Paint()
      ..color = Colors.red
      ..strokeCap = StrokeCap.round
      ..strokeWidth = 5.0;
    for (int i = 0; i < points.length - 1; i++) {
      if (points[i] != null && points[i + 1] != null)
        canvas.drawLine(points[i], points[i + 1], paint);
    }
  }

  bool shouldRepaint(SignaturePainter other) => other.points != points;
}

class SampleAppPage2 extends StatefulWidget {
  SampleAppPage2({Key key}) : super(key: key);

  @override
  _SampleAppPageState2 createState() => _SampleAppPageState2();
}

class _SampleAppPageState2 extends State<SampleAppPage2> {
  List widgets = [];

  @override
  void initState() {
    super.initState();
    loadData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Sample App"),
        ),
        body: ListView.builder(
            itemCount: widgets.length,
            itemBuilder: (BuildContext context, int position) {
              return getBody(position);
            }));
  }

  Widget getTitle(int i) {
    return Padding(
        padding: EdgeInsets.all(10.0),
        child: Text("Row ${widgets[i]["title"]}"));
  }

  Widget getBody(int i) {
    return Padding(
        padding: EdgeInsets.all(10.0), child: Text("${widgets[i]["body"]}"));
  }

  loadData() async {
    String dataURL = "https://jsonplaceholder.typicode.com/posts";
    http.Response response = await http.get(dataURL);
    setState(() {
      widgets = json.decode(response.body);
    });
  }
}
