import 'package:flutter/material.dart';

Color color = Color(0xffff024a);

class BottomBar extends StatefulWidget {
  BottomBar({Key key}) : super(key: key);

  _BottomBarState createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  @override
  Widget build(BuildContext context) {
    double itemWidth = MediaQuery.of(context).size.width / 5;

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Container(
          width: itemWidth,
          alignment: Alignment.center,
          child: Ink(
            child: InkWell(
              onTap: () {},
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Icon(
                    Icons.home,
                    color: color,
                    size: 35,
                  ),
                  Text("Home")
                ],
              ),
            ),
          ),
        ),
        Container(
          width: itemWidth,
          alignment: Alignment.center,
          child: Ink(
            child: InkWell(
              onTap: () {
                print("hola!!");
              },
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Icon(
                    Icons.forward_5,
                    color: Colors.grey,
                    size: 35,
                  ),
                  Text("Routines")
                ],
              ),
            ),
          ),
        ),
        Container(width: itemWidth),
        Container(
          width: itemWidth,
          alignment: Alignment.center,
          child: Ink(
            child: InkWell(
              onTap: () {},
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Icon(
                    Icons.show_chart,
                    color: Colors.grey,
                    size: 35,
                  ),
                  Text("Stats")
                ],
              ),
            ),
          ),
        ),
        Container(
          width: itemWidth,
          alignment: Alignment.center,
          child: Ink(
            child: InkWell(
              onTap: () {},
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Icon(
                    Icons.menu,
                    color: Colors.grey,
                    size: 35,
                  ),
                  Text("More")
                ],
              ),
            ),
          ),
        )
      ],
    );
  }
}
