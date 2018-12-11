import 'package:flutter/material.dart';
import 'package:my_first_app/assets.dart';

class HomeFragment extends StatefulWidget {
  const HomeFragment();

  @override
  HomeFragmentState createState() => HomeFragmentState();
}

class HomeFragmentState extends State<HomeFragment> {
  List _cities = [
    "Restaurants",
    "Cuisines",
    "Areas"
  ];

  List<DropdownMenuItem<String>> _dropDownMenuItems;
  String _currentCity;

  @override
  void initState() {
    _dropDownMenuItems = getDropDownMenuItems();
    _currentCity = _dropDownMenuItems[0].value;
    super.initState();
  }

  List<DropdownMenuItem<String>> getDropDownMenuItems() {
    List<DropdownMenuItem<String>> items = new List();
    for (String city in _cities) {
      items.add(new DropdownMenuItem(
        value: city,
        child: new Text(city),
      ));
    }
    return items;
  }

  @override
  Widget build(BuildContext context) {
    return new ListView(
      children: <Widget>[
        new Container(
          alignment: Alignment.topCenter,
          child: Column(
            children: <Widget>[
              Container(
                  alignment: Alignment.topRight,
                  padding: EdgeInsets.only(left: 15.0, right: 15.0, top: 15.0),
                  color: Colors.white,
                  child: new DropdownButton(
                    value: _currentCity,
                    items: _dropDownMenuItems,
                    onChanged: changedDropDownItem,
                  )),
              Container(
                padding: EdgeInsets.only(left: 15.0, right: 15.0, top: 18.0),
                child: TextFormField(
                  //cursorColor: const Color(ColorAssets.primaryColor),
                  onFieldSubmitted: (term) {},

                  decoration: InputDecoration(
                    border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(1.0))),
                    filled: false,
                    fillColor: Colors.grey[300],
                    hintText: StringAssets.enter_your_area,
                    contentPadding: EdgeInsets.all(12.0),
                    //labelText: StringAssets.email,
                  ),
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
                  child: SizedBox(
                    width: double.infinity,
                    height: 48.0,
                    child: new MaterialButton(
                      onPressed: () {},
                      child: Text(StringAssets.search_caps,
                          textAlign: TextAlign.center,
                          style: getTextStyleForButtons()),
                      textColor: Colors.white,
                      color: const Color(ColorAssets.primaryColor),
                    ),
                  )),
              Container(
                alignment: Alignment.topLeft,
                padding: EdgeInsets.only(left: 15.0, right: 15.0, top: 22.0),
                child: new Text(
                  StringAssets.most_popular_restaurants,
                  style: getTextStyleForText(),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 15.0),
                height: 162.0,
                width: double.infinity,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    shrinkWrap: true,
                    physics: const ClampingScrollPhysics(),
                    itemCount: 10,
                    // itemExtent: 10.0,
                    // reverse: true, //makes the list appear in descending order
                    itemBuilder: (BuildContext context, int index) {
                      return _buildItems(index);
                    }),
              ),
              Container(
                alignment: Alignment.topLeft,
                padding: EdgeInsets.only(left: 15.0, right: 15.0, top: 15.0),
                child: new Text(
                  StringAssets.most_popular_items,
                  style: getTextStyleForText(),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 15.0, bottom: 10.0),
                height: 162.0,
                width: double.infinity,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    shrinkWrap: true,
                    physics: const ClampingScrollPhysics(),
                    itemCount: 10,
                    // itemExtent: 10.0,
                    // reverse: true, //makes the list appear in descending order
                    itemBuilder: (BuildContext context, int index) {
                      return _buildItems(index);
                    }),
              ),
            ],
          ),
        )
      ],
    );
  }

  void changedDropDownItem(String selectedCity) {
    setState(() {
      _currentCity = selectedCity;
    });
  }
}

Widget _buildItems(int index) {
  return new Container(
    width: 150.0,
    padding: const EdgeInsets.symmetric(horizontal: 5.0),
    child: new Row(
      children: [
        new Container(
          width: 140.0,
          height: 160.0,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(8.0)),
            color: Colors.white,
            image: DecorationImage(
                image: AssetImage(ImageAssets.pizza),
                alignment: Alignment.topCenter),
            boxShadow: [
              new BoxShadow(
                  //spreadRadius: 1.0,
                  color: Colors.grey,
                  blurRadius: 2.0,
                  offset: Offset.zero),
            ],
          ),
          child: new Column(
            //mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              new Container(
                child: new Text(
                  StringAssets.appName,
                  style: getTextStyleForText2(),
                  maxLines: 1,
                  textDirection: TextDirection.ltr,
                ),
                margin: EdgeInsets.only(top: 90.0, left: 5.0, right: 5.0),
              ),
              new Container(
                child: new Text(
                  StringAssets.appName,
                  style: getTextStyleForText3(),
                  maxLines: 2,
                  textDirection: TextDirection.ltr,
                ),
                margin: EdgeInsets.only(top: 4.0, left: 5.0, right: 5.0),
              ),
              new Container(
                child: Row(
                  //mainAxisSize: MainAxisSize.max,
                  //crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    new Icon(
                      Icons.star,
                      color: const Color(ColorAssets.primaryColor),
                      size: 18.0,
                    ),
                    new Text("5.0"),
                  ],
                ),
                margin: EdgeInsets.only(top: 4.0, left: 5.0, right: 5.0),
              ),
            ],
          ),
        ),
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

TextStyle getTextStyleForText() {
  return new TextStyle(
    fontWeight: FontWeight.bold,
    color: const Color(ColorAssets.primaryColor),
    fontSize: 16.0,
  );
}

TextStyle getTextStyleForText2() {
  return new TextStyle(
    fontWeight: FontWeight.bold,
    fontSize: 16.0,
    color: Colors.black,
  );
}

TextStyle getTextStyleForText3() {
  return new TextStyle(
    fontWeight: FontWeight.normal,
    fontSize: 14.0,
    color: Colors.black,
  );
}
