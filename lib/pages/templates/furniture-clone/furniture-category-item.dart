import 'package:flutter/material.dart';
import 'package:playground_flutter/pages/templates/furniture-clone/furniture-category-home.dart';

Color primaryColor = Color(0xffdc2f2e);

class FurnitureCategoryItem extends StatelessWidget {
  final int newItemCount;

  const FurnitureCategoryItem({Key key, this.newItemCount = 0})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 90,
      width: 110,
      child: Stack(
        children: <Widget>[
          Container(
            width: 90,
            height: 90,
            child: InkWell(
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (c) => FurnitureCategoryHome(),
                  ),
                );
              },
              child: Material(
                elevation: 2,
                borderRadius: BorderRadius.all(
                  Radius.circular(5),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Icon(
                      Icons.event_seat,
                      size: 40,
                    ),
                    Text(
                      "Chair",
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Visibility(
            visible: newItemCount != 0,
            child: Positioned(
              top: 8,
              right: 10,
              child: Container(
                width: 30,
                height: 20,
                decoration: BoxDecoration(
                  color: primaryColor,
                  border: Border.all(color: Colors.white),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Text(
                  newItemCount.toString(),
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
