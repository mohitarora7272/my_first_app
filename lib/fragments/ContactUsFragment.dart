import 'package:flutter/material.dart';
import 'package:my_first_app/assets.dart';

class ContactUsFragment extends StatefulWidget {
  const ContactUsFragment();

  @override
  _ContactUsFragmentState createState() => _ContactUsFragmentState();
}

class _ContactUsFragmentState extends State<ContactUsFragment> {
  final FocusNode _nameFocus = FocusNode();
  final FocusNode _emailFocus = FocusNode();
  final FocusNode _phoneFocus = FocusNode();
  final FocusNode _messageFocus = FocusNode();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _emailFocus.dispose();
    _nameFocus.dispose();
    _phoneFocus.dispose();
    _messageFocus.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return new Center(
      child: ListView(
        children: <Widget>[
          getEditableFields(),
        ],
      ),
    );
  }

  Widget getEditableFields() {
    return new Container(
      alignment: Alignment.center,
      child: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(left: 15.0, right: 15.0, top: 15.0),
            child: TextFormField(
              //cursorColor: const Color(ColorAssets.primaryColor),
              focusNode: _nameFocus,
              onFieldSubmitted: (term) {
                FocusScope.of(context).requestFocus(_emailFocus);
              },

              decoration: InputDecoration(
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(1.0))),
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
              focusNode: _emailFocus,
              onFieldSubmitted: (term) {
                FocusScope.of(context).requestFocus(_phoneFocus);
              },

              decoration: InputDecoration(
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(1.0))),
                filled: false,
                fillColor: Colors.grey[300],
                hintText: StringAssets.email,
                contentPadding: EdgeInsets.all(12.0),
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
              focusNode: _phoneFocus,
              onFieldSubmitted: (term) {
                FocusScope.of(context).requestFocus(_messageFocus);
              },

              decoration: InputDecoration(
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(1.0))),
                filled: false,
                fillColor: Colors.grey[300],
                hintText: StringAssets.phone,
                contentPadding: EdgeInsets.all(12.0),
                //labelText: StringAssets.email,
              ),
              keyboardType: TextInputType.phone,
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
              focusNode: _messageFocus,
              onFieldSubmitted: (term) {
                _messageFocus.unfocus();
              },

              decoration: InputDecoration(
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(1.0))),
                filled: false,
                fillColor: Colors.grey[300],
                hintText: StringAssets.message,
                contentPadding: EdgeInsets.all(12.0),
              ),
              keyboardType: TextInputType.multiline,
              textInputAction: TextInputAction.done,
              maxLines: 5,
              style: new TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.normal,
                color: Colors.black,
              ),
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
