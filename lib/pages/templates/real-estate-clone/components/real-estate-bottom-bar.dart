import 'package:flutter/material.dart';
import 'package:playground_flutter/pages/templates/real-estate-clone/components/real-estate-active-tab.dart';

class RealEstateBottomBar extends StatefulWidget {
  @override
  _RealEstateBottomBarState createState() => _RealEstateBottomBarState();
}

class _RealEstateBottomBarState extends State<RealEstateBottomBar>
    with SingleTickerProviderStateMixin {
  Animation _animation;
  AnimationController _controller;
  int _currentActiveTab = 0;

  @override
  void initState() {
    super.initState();
    _controller =
        AnimationController(vsync: this, duration: Duration(seconds: 1));
    _animation = new Tween(begin: 0.0, end: 1.0).animate(
        new CurvedAnimation(parent: _controller, curve: Curves.elasticOut));

    _controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(right: 16, bottom: 5, top: 10, left: 16),
      height: 60,
      width: MediaQuery.of(context).size.width,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          _buildTab('Home', Icons.home, 0),
          _buildTab('Favorite', Icons.bookmark_border, 1),
          _buildTab('Message', Icons.chat_bubble_outline, 2),
          _buildTab('Profile', Icons.perm_identity, 3),
        ],
      ),
    );
  }

  Widget _buildTab(String text, IconData icon, int index) {
    return _currentActiveTab == index
        ? RealEstateActiveTab(
          animation: _animation,
          key: Key(text),
          text: text,
          icon: icon,
        )
        : Material(
            child: InkWell(
              onTap: () {
                setState(() {
                  _currentActiveTab = index;
                  _controller.reset();
                  _controller.forward();
                });
              },
              child: Icon(
                icon,
                size: 35,
              ),
            ),
          );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
