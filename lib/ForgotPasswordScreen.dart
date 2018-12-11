import 'package:flutter/material.dart';
import 'assets.dart';

void main() => runApp(ForgotPasswordScreen());

class ForgotPasswordScreen extends StatefulWidget {
  // This widget is the root of your application.
  const ForgotPasswordScreen();

  @override
  _ForgotPasswordScreenState createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  final FocusNode _emailFocus = FocusNode();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _emailFocus.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(StringAssets.forgot_password),
      ),
      body: Container(
        decoration: new BoxDecoration(
          image: new DecorationImage(
            image: new AssetImage(ImageAssets.backgroundImage),
            fit: BoxFit.cover,
          ),
        ),
        child: ListView(
          children: <Widget>[
            getTopIcon(),
            getEditableFields(),
          ],
        ),
      ),
    );
  }

  Widget getTopIcon() {
    return new Container(
      alignment: Alignment.topCenter,
      child: new Image(
        image: AssetImage(ImageAssets.login_logo),
        height: 150.0,
        width: 150.0,
      ),
    );
  }

  Widget getEditableFields() {
    return new Container(
        alignment: Alignment.center,
        child: Column(
          children: <Widget>[
            Container(
              padding: EdgeInsets.only(left: 15.0, right: 15.0, top: 50.0),
              child: TextFormField(
                onFieldSubmitted: (term) {

                },
                decoration: InputDecoration(
                  border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(1.0))),
                  filled: false,
                  fillColor: Colors.grey[300],
                  hintText: StringAssets.email,
                  contentPadding: EdgeInsets.all(12.0),
                  //labelText: StringAssets.email,
                ),
                keyboardType: TextInputType.emailAddress,
                textInputAction: TextInputAction.done,

                style: new TextStyle(
                  fontSize: 16.0,
                  fontWeight: FontWeight.normal,
                  color: Colors.black,
                ),
              ),
            ),
            Container(
                padding: EdgeInsets.only(
                    left: 15.0, right: 15.0, top: 15.0, bottom: 15.0),
                child: SizedBox(
                  width: double.infinity,
                  height: 48.0,
                  child: new MaterialButton(
                    onPressed: () {},
                    child: Text(StringAssets.submit_caps,
                        textAlign: TextAlign.center,
                        style: getTextStyleForButtons()),
                    textColor: Colors.white,
                    color: const Color(ColorAssets.primaryColor),
                  ),
                )),
          ],
        ),
    );
  }

  TextStyle getTextStyleForButtons() {
    return new TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: 16.0,
    );
  }
}
