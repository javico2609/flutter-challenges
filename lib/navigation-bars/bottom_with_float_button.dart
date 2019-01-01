import 'package:flutter/material.dart';

class BottomBarWithFloatButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BottomBarWithFloatButton'),
      ),
      bottomNavigationBar: new BottomAppBar(
        child: new Container(
          height: 60.0,
          color: Colors.white,
          child: new Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              new Container(
                width: MediaQuery.of(context).size.width / 5,
                child: new Icon(Icons.home, size: 35.0),
              ),
              new Container(
                width: MediaQuery.of(context).size.width / 5,
                child: new Icon(Icons.monochrome_photos, size: 35.0),
              ),
              new Container(width: MediaQuery.of(context).size.width / 5),
              new Container(
                width: MediaQuery.of(context).size.width / 5,
                child: new Icon(Icons.account_circle, size: 35.0),
              ),
              new Container(
                width: MediaQuery.of(context).size.width / 5,
                child: new Icon(Icons.shopping_cart, size: 35.0),
              )
            ],
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        tooltip: 'Increment',
        child: Icon(Icons.add),
        onPressed: () {},
      ),
    );
  }
}
