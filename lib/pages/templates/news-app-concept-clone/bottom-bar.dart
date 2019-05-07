import 'package:flutter/material.dart';

Color color = Color(0xff59c2ff);

class BottomBar extends StatefulWidget {
  final Function(int index) onChangeActiveTab;
  final int activeInndex;

  const BottomBar({Key key, this.onChangeActiveTab, this.activeInndex = 0})
      : super(key: key);

  @override
  _BottomBarState createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  int _activeInndex;

  @override
  void initState() {
    super.initState();
    _activeInndex = widget.activeInndex;
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Positioned(
          bottom: 0,
          child: new BottomAppBar(
            //elevation: 3,
            child: Container(
              height: 60.0,
              width: MediaQuery.of(context).size.width,
              child: new Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                mainAxisSize: MainAxisSize.max,
                children: <Widget>[
                  _getBottomBarItem(
                    context: context,
                    index: 0,
                    icon: Icons.home,
                  ),
                  _getBottomBarItem(
                    context: context,
                    index: 1,
                    icon: Icons.account_balance_wallet,
                  ),
                  new Container(width: MediaQuery.of(context).size.width / 5),
                  _getBottomBarItem(
                    context: context,
                    index: 2,
                    icon: Icons.notifications_none,
                  ),
                  _getBottomBarItem(
                    context: context,
                    index: 3,
                    icon: Icons.account_circle,
                  ),
                ],
              ),
            ),
          ),
        ),
        Positioned(
          bottom: 10,
          width: MediaQuery.of(context).size.width,
          child: Container(
            alignment: Alignment.center,
            child: FloatingActionButton(
              elevation: 2,
              highlightElevation: 5,
              backgroundColor: color,
              child: Icon(
                Icons.add,
                size: 38,
              ),
              onPressed: () {},
            ),
          ),
        ),
      ],
    );
  }

  Widget _getBottomBarItem({BuildContext context, int index, IconData icon}) {
    double itemWidth = MediaQuery.of(context).size.width / 5;
    double iconSize = 30.0;
    return new Container(
      width: itemWidth,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          InkWell(
            child: Icon(
              icon,
              size: iconSize,
              color: _getItemColor(index: index),
            ),
            onTap: () {
              if (index != _activeInndex) {
                setState(() {
                  _activeInndex = index;
                  widget.onChangeActiveTab(index);
                });
              }
            },
          ),
          Visibility(
            visible: index == _activeInndex,
            child: Container(
              width: 10,
              height: 2,
              decoration: BoxDecoration(
                color: color,
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Color _getItemColor({int index}) {
    return index == _activeInndex ? color : Colors.grey[300];
  }
}
