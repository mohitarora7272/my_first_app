import 'package:flutter/material.dart';
import 'package:my_first_app/assets.dart';

class SettingsFragment extends StatefulWidget {
  const SettingsFragment();

  @override
  SettingsFragmentState createState() => new SettingsFragmentState();
}

class SettingsFragmentState extends State<SettingsFragment>
    with TickerProviderStateMixin {

  @override
  Widget build(BuildContext context) {
    return new Container(
        padding: EdgeInsets.all(10.0),
        child: ListView(
          children: <Widget>[
            Container(
                padding: EdgeInsets.all(10.0), child: getPushNotificationTab()),
            Container(
                padding: EdgeInsets.all(10.0), child: getSubsNewsletterTab()),
            Container(padding: EdgeInsets.all(10.0), child: getSubsSmsTab())
          ],
        ));
  }

  Widget getPushNotificationTab() {
    return SizedBox(
      width: double.infinity,
      height: 48.0,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(8.0)),
          color: Colors.white,
          boxShadow: [
            new BoxShadow(
                //spreadRadius: 1.0,
                color: Colors.grey,
                blurRadius: 2.0,
                offset: Offset.zero),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(10.0),
              child: new Text(StringAssets.push_notifications),
            ),
            Container(
              padding: EdgeInsets.all(10.0),
              child: new Switch(
                value: false,
                onChanged: (bool value) {
                  print(value);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget getSubsNewsletterTab() {
    return SizedBox(
      width: double.infinity,
      height: 48.0,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(8.0)),
          color: Colors.white,
          boxShadow: [
            new BoxShadow(
                //spreadRadius: 1.0,
                color: Colors.grey,
                blurRadius: 2.0,
                offset: Offset.zero),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(10.0),
              child: new Text(StringAssets.subs_news_letter),
            ),
            Container(
              padding: EdgeInsets.all(10.0),
              child: new Switch(
                value: false,
                onChanged: (bool value) {
                  print(value);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget getSubsSmsTab() {
    return SizedBox(
      width: double.infinity,
      height: 48.0,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(8.0)),
          color: Colors.white,
          boxShadow: [
            new BoxShadow(
                //spreadRadius: 1.0,
                color: Colors.grey,
                blurRadius: 2.0,
                offset: Offset.zero),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(10.0),
              child: new Text(StringAssets.subs_sms),
            ),
            Container(
              padding: EdgeInsets.all(10.0),
              child: new Switch.adaptive(
                value: false,
                onChanged: (bool value) {

                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
