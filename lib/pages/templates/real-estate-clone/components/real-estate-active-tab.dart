import 'package:flutter/material.dart';

class RealEstateActiveTab extends AnimatedWidget {
  final IconData icon;
  final String text;

  RealEstateActiveTab({Key key, Animation animation, this.icon, this.text})
      : super(key: key, listenable: animation);

  @override
  Widget build(BuildContext context) {
    final Animation<double> animation = listenable;

    return Transform(
      transform: Matrix4.diagonal3Values(animation.value, 1, 1),
      child: Container(
        width: 120,
        height: 60,
        decoration: BoxDecoration(
          color: Color(0xFFe2d7f5),
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            bottomLeft: Radius.circular(20),
            bottomRight: Radius.circular(20),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Icon(
              icon,
              color: Color(0xff6732c1),
              size: 30,
            ),
            Text(
              text,
              style: TextStyle(
                color: Color(0xff6732c1),
                fontSize: 18,
              ),
            )
          ],
        ),
      ),
    );
  }
}
