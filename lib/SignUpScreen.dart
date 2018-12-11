import 'package:flutter/material.dart';
import 'assets.dart';

void main() => runApp(SignUpScreen());

class SignUpScreen extends StatefulWidget {
  // This widget is the root of your application.
  const SignUpScreen();

  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final FocusNode _nameFocus = FocusNode();
  final FocusNode _phoneFocus = FocusNode();
  final FocusNode _emailFocus = FocusNode();
  final FocusNode _passwordFocus = FocusNode();
  bool _value1 = false;
  bool _value2 = false;
  bool _value3 = false;

  void _value1Changed(bool value) => setState(() => _value1 = value);

  void _value2Changed(bool value) => setState(() => _value2 = value);

  void _value3Changed(bool value) => setState(() => _value3 = value);

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _emailFocus.dispose();
    _nameFocus.dispose();
    _phoneFocus.dispose();
    _passwordFocus.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(StringAssets.signup),
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
            padding: EdgeInsets.only(left: 15.0, right: 15.0, top: 2.0),
            child: TextFormField(
              //cursorColor: const Color(ColorAssets.primaryColor),
              focusNode: _nameFocus,
              onFieldSubmitted: (term) {
                FocusScope.of(context).requestFocus(_phoneFocus);
              },

              decoration: InputDecoration(
                border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(1.0))),
                filled: false,
                fillColor: Colors.grey[300],
                hintText: StringAssets.name,
                contentPadding: EdgeInsets.all(12.0),
              ),
              keyboardType: TextInputType.text,
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
              focusNode: _phoneFocus,
              onFieldSubmitted: (term) {
                FocusScope.of(context).requestFocus(_emailFocus);
              },

              decoration: InputDecoration(
                border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(1.0))),
                filled: false,
                fillColor: Colors.grey[300],
                hintText: StringAssets.phone,
                contentPadding: EdgeInsets.all(12.0),
              ),
              keyboardType: TextInputType.number,
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
            padding: EdgeInsets.only(left: 15.0, right: 15.0, top: 10.0),
            //alignment: AlignmentDirectional.center,
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                new Row(
                  children: <Widget>[
                    new Checkbox(
                      value: _value1,
                      onChanged: _value1Changed,
                      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    ),
                    new Text(
                      StringAssets.subs_news,
                      style: new TextStyle(
                        color: Colors.black,
                        fontSize: 12.0,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                  ],
                ),
                new Row(
                  children: <Widget>[
                    new Checkbox(
                      value: _value2,
                      onChanged: _value2Changed,
                      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    ),
                    new Text(
                      StringAssets.subs_sms,
                      style: new TextStyle(
                        color: Colors.black,
                        fontSize: 12.0,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.only(left: 15.0, right: 15.0),
            //alignment: AlignmentDirectional.center,
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                new Checkbox(
                  value: _value3,
                  onChanged: _value3Changed,
                  materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                ),
                new SizedBox(
                  width: 290.0,
                  child: GestureDetector(
                    onTap: () {},
                    child: Text(
                      StringAssets.terms_conditions,
                      style: new TextStyle(
                        color: Colors.black,
                        fontSize: 12.0,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
              padding: EdgeInsets.only(
                  left: 15.0, right: 15.0, top: 15.0, bottom: 10.0),
              child: SizedBox(
                width: double.infinity,
                height: 48.0,
                child: new MaterialButton(
                  onPressed: () {},
                  child: Text(StringAssets.signup_caps,
                      textAlign: TextAlign.center,
                      style: getTextStyleForButtons()),
                  textColor: Colors.white,
                  color: const Color(ColorAssets.primaryColor),
                ),
              )),
          Container(
              padding: EdgeInsets.only(
                  left: 15.0, right: 15.0, top: 15.0, bottom: 5.0),
              alignment: AlignmentDirectional.bottomCenter,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  new GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: new Text(
                      StringAssets.already_have_account,
                      style: new TextStyle(
                        color: Colors.black,
                        fontSize: 15.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  new GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: new Padding(
                      padding: new EdgeInsets.only(left: 3.0),
                      child: new Text(
                        StringAssets.signin,
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
