import 'package:flutter/material.dart';
import 'ForgotPasswordScreen.dart';
import 'SignUpScreen.dart';
import 'assets.dart';

void main() => runApp(SignInScreen());

class SignInScreen extends StatefulWidget {
  // This widget is the root of your application.
  const SignInScreen();

  @override
  _SignInScreenState createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final FocusNode _emailFocus = FocusNode();
  final FocusNode _passwordFocus = FocusNode();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _emailFocus.dispose();
    _passwordFocus.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(StringAssets.signin),
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
            padding: EdgeInsets.only(left: 15.0, right: 15.0, top: 10.0),
            child: TextFormField(
              //cursorColor: const Color(ColorAssets.primaryColor),
              focusNode: _emailFocus,
              onFieldSubmitted: (term) {
                FocusScope.of(context).requestFocus(_passwordFocus);
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
              textInputAction: TextInputAction.next,

              style: new TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.normal,
                color: Colors.black,
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.only(left: 15.0, right: 15.0, top: 10.0),
            child: TextFormField(
              //cursorColor: const Color(ColorAssets.primaryColor),
              focusNode: _passwordFocus,
              onFieldSubmitted: (term) {
                _passwordFocus.unfocus();
              },

              decoration: InputDecoration(
                border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(1.0))),
                filled: false,
                fillColor: Colors.grey[300],
                hintText: StringAssets.password,
                contentPadding: EdgeInsets.all(12.0),
              ),
              obscureText: true,
              keyboardType: TextInputType.text,
              textInputAction: TextInputAction.done,
              style: new TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.normal,
                color: Colors.black,
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.only(left: 15.0, right: 15.0, top: 15.0),
            alignment: AlignmentDirectional.centerEnd,
            child: new GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  new MaterialPageRoute(builder: (context) => new ForgotPasswordScreen()),
                );
              },
              child: new Text(
                StringAssets.forgot_password,
                style: new TextStyle(
                  color: const Color(ColorAssets.primaryColor),
                  fontSize: 15.0,
                  fontStyle: FontStyle.normal,
                  fontWeight: FontWeight.normal,
                ),
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
                  child: Text(StringAssets.signin_caps,
                      textAlign: TextAlign.center,
                      style: getTextStyleForButtons()),
                  textColor: Colors.white,
                  color: const Color(ColorAssets.primaryColor),
                ),
              )),
          Container(
              height: 180.0,
              padding: EdgeInsets.only(
                  left: 15.0, right: 15.0, top: 15.0, bottom: 5.0),
              alignment: AlignmentDirectional.bottomCenter,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  new GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        new MaterialPageRoute(builder: (context) => new SignUpScreen()),
                      );
                    },
                    child: new Text(
                      StringAssets.dont_have_account,
                      style: new TextStyle(
                        color: Colors.black,
                        fontSize: 15.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  new GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        new MaterialPageRoute(builder: (context) => new SignUpScreen()),
                      );
                    },
                    child: new Padding(
                      padding: new EdgeInsets.only(left: 3.0),
                      child: new Text(
                        StringAssets.signup,
                        style: new TextStyle(
                          color: const Color(ColorAssets.primaryColor),
                          fontSize: 15.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
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