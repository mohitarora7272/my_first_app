import 'package:flutter/material.dart';
import 'package:my_first_app/assets.dart';

class MyAccountFragment extends StatefulWidget {
  const MyAccountFragment();

  _MyAccountState createState() => new _MyAccountState();
}

class _MyAccountState extends State<MyAccountFragment> {
  @override
  Widget build(BuildContext context) {
    return new Container(
        padding: EdgeInsets.all(10.0),
        child: ListView(
          children: <Widget>[
            Container(
                padding: EdgeInsets.all(10.0), child: getAccountInfoTab()),
            Container(padding: EdgeInsets.all(10.0), child: getMyOrdersTab()),
            Container(padding: EdgeInsets.all(10.0), child: getMyReviewsTab()),
            Container(padding: EdgeInsets.all(10.0), child: getMyFavTab()),
          ],
        ));
  }

  Widget getAccountInfoTab() {
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
              child: new Icon(
                Icons.info_outline,
                color: Color(ColorAssets.primaryColor),
                size: 20.0,
              ),
            ),
            Container(
              //padding: EdgeInsets.all(10.0),
              child: new Text(StringAssets.account_info),
            ),
            Container(
              padding: EdgeInsets.all(10.0),
              child: new Icon(
                Icons.arrow_forward_ios,
                color: Colors.grey,
                size: 15.0,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget getMyOrdersTab() {
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
              child: new Icon(
                Icons.list,
                color: Color(ColorAssets.primaryColor),
                size: 20.0,
              ),
            ),
            Container(
              //padding: EdgeInsets.all(10.0),
              child: new Text(StringAssets.my_order),
            ),
            Container(
              padding: EdgeInsets.all(10.0),
              child: new Icon(
                Icons.arrow_forward_ios,
                color: Colors.grey,
                size: 15.0,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget getMyReviewsTab() {
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
              child: new Icon(
                Icons.star,
                color: Color(ColorAssets.primaryColor),
                size: 20.0,
              ),
            ),
            Container(
              //padding: EdgeInsets.all(10.0),
              child: new Text(StringAssets.my_reviews),
            ),
            Container(
              padding: EdgeInsets.all(10.0),
              child: new Icon(
                Icons.arrow_forward_ios,
                color: Colors.grey,
                size: 15.0,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget getMyFavTab() {
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
              child: new Icon(
                Icons.favorite,
                color: Color(ColorAssets.primaryColor),
                size: 20.0,
              ),
            ),
            Container(
              //padding: EdgeInsets.all(10.0),
              child: new Text(StringAssets.my_fav),
            ),
            Container(
              padding: EdgeInsets.all(10.0),
              child: new Icon(
                Icons.arrow_forward_ios,
                color: Colors.grey,
                size: 15.0,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
