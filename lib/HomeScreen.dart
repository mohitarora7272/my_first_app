import 'package:flutter/material.dart';
import 'assets.dart';
import 'fragments/AboutUsFragment.dart';
import 'fragments/ContactUsFragment.dart';
import 'fragments/HomeFragment.dart';
import 'fragments/MyAccountFragment.dart';
import 'fragments/SettingsFragment.dart';

void main() => runApp(new HomeScreen());

class DrawerItem {
  String title;
  IconData icon;

  DrawerItem(this.title, this.icon);
}

class HomeScreen extends StatefulWidget {
  final drawerItems = [
    new DrawerItem("Home", Icons.home),
    new DrawerItem("My Account", Icons.person),
    new DrawerItem("Settings", Icons.settings),
    new DrawerItem("Contact Us", Icons.phone),
    new DrawerItem("About Us", Icons.info)
  ];

  @override
  HomeScreenState createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> {
  final String titleNew = StringAssets.appName;
  int _selectedDrawerIndex = 0;

  @override
  void initState() {
    super.initState();
  }

  _getDrawerItemWidget(int pos) {
    switch (pos) {
      case 0:
        return new HomeFragment();
      case 1:
        return new MyAccountFragment();
      case 2:
        return new SettingsFragment();
      case 3:
        return new ContactUsFragment();
      case 4:
        return new AboutUsFragment();

      default:
        return new HomeFragment();
    }
  }

  _onSelectItem(int index) {
    setState(() => _selectedDrawerIndex = index);
    Navigator.of(context).pop(); // close the drawer
  }

  @override
  Widget build(BuildContext context) {
    var drawerOptions = <Widget>[];
    for (var i = 0; i < widget.drawerItems.length; i++) {
      var d = widget.drawerItems[i];
      drawerOptions.add(new ListTile(
        leading: new Icon(
          d.icon,
          size: 25,
        ),
        title: new Text(
          d.title,
          style: getTextStyleSideMenuItems(),
        ),
        selected: i == _selectedDrawerIndex,
        contentPadding: EdgeInsets.only(left: 20.0, top: 2.0),
        onTap: () => _onSelectItem(i),
      ));
    }

    return new Scaffold(
      appBar: new AppBar(
        centerTitle: true,
        // here we display the title corresponding to the fragment
        // you can instead choose to have a static title
        title: new Text(setAppBarTitle()),
        actions: <Widget>[
          IconButton(
            icon: const Icon(
              Icons.shopping_cart,
              color: Colors.white,
            ),
            onPressed: () {},
          ),
        ],
      ),
      body: Container(
        decoration: new BoxDecoration(
          image: new DecorationImage(
            image: new AssetImage(ImageAssets.backgroundImage),
            fit: BoxFit.cover,
          ),
        ),
        child: _getDrawerItemWidget(_selectedDrawerIndex),
      ),
      drawer: new Drawer(
          child: Container(
        decoration: new BoxDecoration(
          image: new DecorationImage(
            image: new AssetImage(ImageAssets.backgroundImage),
            fit: BoxFit.cover,
          ),
        ),
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              child: new GestureDetector(
                onTap: () {},
                child: Center(
                  child: Text(
                    StringAssets.please_login_into_your_account,
                    style: getTextStyle(),
                  ),
                ),
              ),
              decoration: BoxDecoration(
                color: const Color(ColorAssets.grayTopBarColor),
              ),
            ),
            new Column(children: drawerOptions),
          ],
        ),
      )),
    );
  }

  String setAppBarTitle() {
    if (_selectedDrawerIndex == 0) {
      return titleNew;
    }
    return widget.drawerItems[_selectedDrawerIndex].title;
  }
}

TextStyle getTextStyle() {
  return new TextStyle(
    fontWeight: FontWeight.normal,
    color: Colors.black,
    fontSize: 15.0,
  );
}

TextStyle getTextStyleSideMenuItems() {
  return new TextStyle(
    fontWeight: FontWeight.normal,
    letterSpacing: 0.5,
    fontSize: 16.0,
  );
}
