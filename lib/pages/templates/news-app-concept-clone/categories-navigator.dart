import 'package:flutter/material.dart';

Color color = Color(0xff59c2ff);

class CategoriesNavigator extends StatefulWidget {
  final Function(int index) onChangeActiveTab;
  final List<String> categories;

  CategoriesNavigator({Key key, this.onChangeActiveTab, this.categories})
      : super(key: key);

  _CategoriesNavigatorState createState() => _CategoriesNavigatorState();
}

class _CategoriesNavigatorState extends State<CategoriesNavigator> {
  int _activeInndex = 0;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    List<Widget> items = [];

    for (int index = 0; index < widget.categories.length; index++) {
      items.add(
        GestureDetector(
          onTap: () {
            if (_activeInndex != index) {
              setState(() {
                _activeInndex = index;
                widget.onChangeActiveTab(index);
              });
            }
          },
          child: Row(
            children: <Widget>[
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text(
                    widget.categories[index],
                    style: TextStyle(
                      color: index == _activeInndex
                          ? Colors.black
                          : Colors.grey[300],
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Visibility(
                    visible: _activeInndex == index,
                    child: Padding(
                      padding: const EdgeInsets.only(top: 5),
                      child: Container(
                        height: 5,
                        width: 5,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: color,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(width: width / 11),
            ],
          ),
        ),
      );
    }

    return Container(
      height: 40,
      width: width,
      child: ListView(
        padding: EdgeInsets.only(left: 20),
        scrollDirection: Axis.horizontal,
        children: items.toList(),
      ),
    );
  }
}
