import 'package:explore_widget/mainActivity.dart';
import 'package:flutter/material.dart';

class FabBottomNavActivity extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => FabBottomNavActivityState();
}

class FabBottomNavActivityState extends State<FabBottomNavActivity> {
  int _selectedIndex = 0;

  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static const List<Widget> _widgetOptions = <Widget>[
    Text(
      'Index 0: Home',
      style: optionStyle,
    ),
    Text(
      'Index 1: Business',
      style: optionStyle,
    ),
    Text(
      'Index 2: School',
      style: optionStyle,
    ),
    Text(
      'Index 3: School',
      style: optionStyle,
    ),
    Text(
      'Index 4: School',
      style: optionStyle,
    ),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  Widget myBottom = BottomAppBar(
    color: Colors.green,
    child: Container(
      height: 50,
    ),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('BottomNavigationBar Sample'),
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () {
            print("Ikhwan FAB click");
          },
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        body: Center(
          child: Column(
            children: <Widget>[
              button("Version 1", () {
                onVersionOneClick();
              }),
              button("Version 2", () {
                onVersionTwoClick();
              }),
              button("Version 3", () {
                onVersionThreeClick();
              }),
              button("Version 4", () {
                onVersionFourClick();
              })
            ],
          ),
        ),
        bottomNavigationBar: myBottom);
  }

  onVersionOneClick() {
    setState(() {
      myBottom = BottomAppBar(
        color: Colors.green,
        child: Container(
          height: 50,
        ),
      );
    });
  }

  onVersionTwoClick() {
    setState(() {
      myBottom = BottomAppBar(
        child: Container(
          height: 55,
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[],
          ),
        ),
        shape: CircularNotchedRectangle(),
        color: Colors.blueGrey,
      );
    });
  }

  onVersionThreeClick() {
    setState(() {
      myBottom = BottomAppBar(
        shape: CircularNotchedRectangle(),
        child: Container(
          height: 55,
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              IconButton(
                iconSize: 30.0,
                padding: EdgeInsets.only(left: 28.0),
                icon: Icon(Icons.home),
                onPressed: () {},
              ),
              IconButton(
                iconSize: 30.0,
                padding: EdgeInsets.only(right: 28.0),
                icon: Icon(Icons.search),
                onPressed: () {},
              ),
              IconButton(
                iconSize: 30.0,
                padding: EdgeInsets.only(left: 28.0),
                icon: Icon(Icons.notifications),
                onPressed: () {},
              ),
              IconButton(
                iconSize: 30.0,
                padding: EdgeInsets.only(right: 28.0),
                icon: Icon(Icons.list),
                onPressed: () {},
              )
            ],
          ),
        ),
      );
    });
  }

  onVersionFourClick() {
    setState(() {
      myBottom = BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.business),
            label: 'Business',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.school),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.school),
            label: 'School',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.school),
            label: 'School',
          ),
        ],
        currentIndex: _selectedIndex,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.amber[800],
        onTap: _onItemTapped,
      );
    });
  }
}
