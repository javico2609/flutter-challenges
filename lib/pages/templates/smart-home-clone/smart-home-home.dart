import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:playground_flutter/bloc/theme.bloc.dart';
import 'package:playground_flutter/configs/themes.dart';
import 'package:playground_flutter/pages/templates/smart-home-clone/bottom-bar.dart';
import 'dart:math' as math;
import 'package:playground_flutter/pages/templates/smart-home-clone/curve-clipper.dart';

Color color = Color(0xffff024a);
Color color2 = Color(0xfffa3629);

class SmartHome extends StatefulWidget {
  const SmartHome({Key key}) : super(key: key);

  @override
  _SmartHomeState createState() => _SmartHomeState();
}

class _SmartHomeState extends State<SmartHome>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;
  Animation<double> _heightAnimation;

  @override
  void initState() {
    super.initState();
    themeBloc.changeTheme(Themes.smartHome);
    _controller = new AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );
    _heightAnimation =
        new Tween<double>(begin: 0.0, end: 220.0).animate(new CurvedAnimation(
      curve: Curves.decelerate,
      parent: _controller,
    ));

    _controller.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    Size media = MediaQuery.of(context).size;

    return Scaffold(
        body: Container(
      height: media.height,
      width: media.width,
      child: Stack(
        children: <Widget>[
          ClipPath(
            clipper: CurveClipper(),
            child: Container(
              width: media.width,
              height: media.height * .25,
              decoration: BoxDecoration(
                color: Color(0xffff1e39),
                // gradient: LinearGradient(
                //   colors: [
                //     Color(0xffff1e39),
                //     Color(0xffff024a),
                //     Color(0xfffa3629),
                //   ],
                //   begin: Alignment.topCenter,
                //   end: Alignment.bottomCenter,
                // ),
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            width: media.width,
            height: 70,
            child: BottomBar(),
          ),
          Positioned(
            top: 0,
            child: new FadeTransition(
              opacity: _controller,
              child: GestureDetector(
                onTap: () {
                  _controller.reverse();
                },
                child: Container(
                  width: _heightAnimation.value > 5 ? media.width : 0,
                  height: _heightAnimation.value > 5 ? media.height : 0,
                  color: Colors.black54,
                ),
              ),
            ),
          ),
          Positioned(
            width: 56,
            height: _heightAnimation.value,
            bottom: 28,
            left: (media.width / 2) - 25,
            child: Container(
              decoration: BoxDecoration(
                color: Color(0xffff1e39),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                  bottomLeft: Radius.circular(5),
                  bottomRight: Radius.circular(5),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.only(top: 5, bottom: 30),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Visibility(
                      visible: _heightAnimation.value > 210,
                      child: FadeTransition(
                        opacity: _controller,
                        child: Icon(
                          Icons.history,
                          color: Colors.white,
                          size: 30,
                        ),
                      ),
                    ),
                    Visibility(
                      visible: _heightAnimation.value > 160,
                      child: FadeTransition(
                        opacity: _controller,
                        child: Icon(
                          Icons.history,
                          color: Colors.white,
                          size: 30,
                        ),
                      ),
                    ),
                    Visibility(
                      visible: _heightAnimation.value > 90,
                      child: FadeTransition(
                        opacity: _controller,
                        child: Icon(
                          Icons.history,
                          color: Colors.white,
                          size: 30,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 6,
            left: (media.width / 2) - 25,
            child: new FloatingActionButton(
              elevation: 0,
              heroTag: null,
              backgroundColor: Color(0xffff1e39),
              child: new AnimatedBuilder(
                animation: _controller,
                builder: (BuildContext context, Widget child) {
                  return new Transform(
                    transform: new Matrix4.rotationZ(
                        _controller.value * 0.5 * math.pi),
                    alignment: FractionalOffset.center,
                    child: new Icon(
                      _controller.isDismissed ? Icons.add : Icons.close,
                      size: 28,
                    ),
                  );
                },
              ),
              onPressed: () {
                if (_controller.isDismissed) {
                  _controller.forward();
                } else {
                  _controller.reverse();
                }
              },
            ),
          ),
        ],
      ),
    ));
  }
}
