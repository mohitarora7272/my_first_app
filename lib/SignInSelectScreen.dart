import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_facebook_login/flutter_facebook_login.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:http/http.dart' as http;
import 'HomeScreen.dart';
import 'SignInScreen.dart';
import 'assets.dart';

void main() => runApp(SignInSelectScreen());

class SignInSelectScreen extends StatefulWidget {
  // This widget is the root of your application.
  const SignInSelectScreen();

  @override
  _SignInSelectScreenState createState() => _SignInSelectScreenState();
}

class _SignInSelectScreenState extends State<SignInSelectScreen> {
  GoogleSignIn _googleSignIn = GoogleSignIn(
    scopes: [
      'email',
      'https://www.googleapis.com/auth/contacts.readonly',
    ],
  );

  @override
  void initState() {
    super.initState();
  }

  bool isLoggedIn = false;

  void onLoginStatusChanged(bool isLoggedIn) {
    setState(() {
      this.isLoggedIn = isLoggedIn;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: const Color(ColorAssets.blackTransparentColor),
      body: new Container(
          padding: EdgeInsets.all(10.0),
          decoration: new BoxDecoration(
            image: new DecorationImage(
              image: new AssetImage(ImageAssets.banner_bg),
              fit: BoxFit.cover,
              colorFilter: const ColorFilter.mode(
                  Color(ColorAssets.blackTransparentColor),
                  BlendMode.hardLight),
            ),
          ),
          child: ListView(
            children: <Widget>[
              new SizedBox(
                width: double.infinity,
                height: 280.0,
                child: new Center(
                  child: new Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      getIcon(),
                      getAppName(),
                    ],
                  ),
                ),
              ),
              new SizedBox(
                width: double.infinity,
                child: new Center(child: getAllButton()),
              ),
            ],
          )),
    );
  }

  Widget getIcon() {
    return new Center(
      child: new Image(
        image: AssetImage(ImageAssets.logo),
        height: 160.0,
        width: 160.0,
      ),
    );
  }

  Widget getAppName() {
    return new Container(
      padding: EdgeInsets.only(top: 10.0),
      alignment: Alignment.center,
      child: new Text(
        StringAssets.appName,
        textAlign: TextAlign.center,
        style: getTextStyle(),
      ),
    );
  }

  TextStyle getTextStyle() {
    return new TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 25.0,
        color: Colors.white,
        fontFamily: 'nova');
  }

  Widget getAllButton() {
    return new Column(
      children: <Widget>[
        getPhoneButton(),
        getFacebookButton(),
        getGoogleButton(),
        getEmailButton(),
        logInLaterText(),
        byLoginText(),
      ],
    );
  }

  Widget getPhoneButton() {
    return new Container(
        width: 300.0,
        color: const Color(ColorAssets.phoneColor),
        child: new GestureDetector(
          onTap: () {
            //Navigator.of(context).pushNamed('/b');
          },
          child: new Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              new Center(
                child: new Image(
                  image: AssetImage(ImageAssets.phone_icon),
                  alignment: Alignment.centerLeft,
                  height: 16.0,
                  width: 16.0,
                ),
              ),
              new MaterialButton(
                onPressed: () {},
                child: Text(StringAssets.continue_with_phone,
                    textAlign: TextAlign.left, style: getTextStyleForButtons()),
                textColor: Colors.white,
                height: 48.0,
              ),
            ],
          ),
        ));
  }

  Widget getFacebookButton() {
    return new Container(
        margin: EdgeInsets.only(top: 10, bottom: 5),
        width: 300.0,
        color: const Color(ColorAssets.facebookColor),
        child: new GestureDetector(
          onTap: () {
            initiateFacebookLogin();
          },
          child: new Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              new Center(
                child: new Image(
                  image: AssetImage(ImageAssets.facebook_logo),
                  alignment: Alignment.center,
                  height: 18.0,
                  width: 18.0,
                ),
              ),
              new MaterialButton(
                onPressed: () {
                  initiateFacebookLogin();
                },
                child: Text(StringAssets.continue_with_facebook,
                    textAlign: TextAlign.left, style: getTextStyleForButtons()),
                textColor: Colors.white,
                height: 48.0,
                minWidth: 230.0,
              ),
            ],
          ),
        ));
  }

  Widget getGoogleButton() {
    return new Container(
        padding: EdgeInsets.only(left: 5.0),
        margin: EdgeInsets.all(5.0),
        width: 300.0,
        color: const Color(ColorAssets.googleColor),
        child: new GestureDetector(
          onTap: () {
            doLogin();
          },
          child: new Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              new Center(
                child: new Image(
                  image: AssetImage(ImageAssets.google_plus),
                  alignment: Alignment.centerLeft,
                  height: 18.0,
                  width: 18.0,
                ),
              ),
              new MaterialButton(
                onPressed: () {
                  doLogin();
                },
                child: Text(StringAssets.continue_with_google,
                    textAlign: TextAlign.center,
                    style: getTextStyleForButtons()),
                textColor: Colors.white,
                height: 48.0,
                minWidth: 230.0,
              ),
            ],
          ),
        ));
  }

  Widget getEmailButton() {
    return new Container(
        padding: EdgeInsets.only(left: 5.0),
        margin: EdgeInsets.all(5.0),
        width: 300.0,
        color: const Color(ColorAssets.emailColor),
        child: new GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              new MaterialPageRoute(builder: (context) => new SignInScreen()),
            );
          },
          child: new Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              new Center(
                child: new Image(
                  image: AssetImage(ImageAssets.email_icon),
                  alignment: Alignment.centerLeft,
                  height: 16.0,
                  width: 16.0,
                ),
              ),
              new MaterialButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    new MaterialPageRoute(
                        builder: (context) => new SignInScreen()),
                  );
                },
                child: Text(StringAssets.continue_with_email,
                    textAlign: TextAlign.center,
                    style: getTextStyleForButtons()),
                textColor: Colors.white,
                height: 48.0,
                minWidth: 230.0,
              ),
            ],
          ),
        ));
  }

  TextStyle getTextStyleForButtons() {
    return new TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: 16.0,
      color: Colors.white,
    );
  }

  Widget logInLaterText() {
    return new Container(
      padding: EdgeInsets.only(top: 10.0),
      alignment: Alignment.center,
      child: GestureDetector(
        onTap: () {
          Navigator.pushReplacement(
            context,
            new MaterialPageRoute(builder: (context) => new HomeScreen()),
          );
        },
        child: Text(StringAssets.l_ll_log_in_later,
            textAlign: TextAlign.center, style: getTextStyleLogin()),
      ),
    );
  }

  TextStyle getTextStyleLogin() {
    return new TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: 16.0,
      color: Colors.white,
    );
  }

  Widget byLoginText() {
    return new Container(
        padding: EdgeInsets.only(top: 10.0, left: 10.0, right: 10.0),
        alignment: Alignment.center,
        child: SizedBox(
          width: double.infinity,
          child: GestureDetector(
            onTap: () {},
            child: Text(StringAssets.by_login_text,
                textAlign: TextAlign.center, style: getTextStyleForText()),
          ),
        ));
  }

  TextStyle getTextStyleForText() {
    return new TextStyle(
      fontWeight: FontWeight.normal,
      fontSize: 12.0,
      color: Colors.white,
    );
  }

  void initiateFacebookLogin() async {
    var facebookLogin = FacebookLogin();
    var facebookLoginResult =
        await facebookLogin.logInWithReadPermissions(['email']);
    switch (facebookLoginResult.status) {
      case FacebookLoginStatus.error:
        print("Error");
        onLoginStatusChanged(false);
        break;
      case FacebookLoginStatus.cancelledByUser:
        print("CancelledByUser");
        onLoginStatusChanged(false);
        break;
      case FacebookLoginStatus.loggedIn:
        print("LoggedIn");
        var graphResponse = await http.get(
            'https://graph.facebook.com/v2.12/me?fields=name,first_name,last_name,email&access_token=${facebookLoginResult.accessToken.token}');

        var profile = json.decode(graphResponse.body);
        print(profile.toString());
        //onLoginStatusChanged(true, parsedJson: profile);
        String name = profile['name'];
        print(name);
        break;
    }
  }

  doLogin() async {
    await _googleSignIn.signIn();
  }

  void initGoogleLogin() {
    _googleSignIn.onCurrentUserChanged
        .listen((GoogleSignInAccount account) async {
      if (account != null) {
        // user logged
        String id = account.id;
        print(id);
      } else {
        // user NOT logged
        print("user NOT logged");
      }
    });
    //_googleSignIn.signInSilently().whenComplete(() => dismissLoading());
  }
}
