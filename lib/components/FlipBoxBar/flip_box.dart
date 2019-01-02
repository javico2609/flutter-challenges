import 'package:flutter/material.dart';
import 'dart:math';

/// FlipBox constructs a Box consisting of two planes which can be controlled using a given Animation Controller.
class FlipBox extends StatefulWidget {
  /// The widget on the top side of the box. (Here, "top" refers to position in Stack).
  final Widget bottomChild;

  /// The widget in front of the user initially.
  final Widget topChild;

  /// The height of the box (Carries the BottomNavigationBar height).
  final double height;

  /// The animation controller to control the flip animation.
  final AnimationController controller;

  /// Callback for when the box is selected (Not when the box is reversed).
  final VoidCallback onTapped;

  FlipBox({
    this.bottomChild,
    this.topChild,
    this.height = 80.0,
    this.controller,
    this.onTapped,
  });

  @override
  _FlipBoxState createState() => _FlipBoxState();
}

class _FlipBoxState extends State<FlipBox> with SingleTickerProviderStateMixin {
  /// Tween for going from 0 to pi/2 radian and vice versa.
  Animation animation;

  /// Controller for controlling the Box.
  AnimationController controller;

  @override
  void initState() {
    super.initState();
    if (widget.controller == null) {
      controller = AnimationController(
          vsync: this, duration: Duration(milliseconds: 2000));
    } else {
      controller = widget.controller;
    }
    animation = Tween(begin: 0.0, end: pi / 2).animate(
      CurvedAnimation(parent: controller, curve: Curves.elasticInOut),
    );

    controller.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: widget.height,
      width: double.infinity,
      child: Stack(
        children: <Widget>[
          Transform(
            alignment: Alignment.center,
            transform: Matrix4.identity()
              ..setEntry(3, 2, 0.001)
              ..translate(0.0, -(cos(animation.value) * (widget.height / 2)),
                  ((-widget.height / 2) * sin(animation.value)))
              ..rotateX(-(pi / 2) + animation.value),
            child: Container(
              child: Center(child: widget.bottomChild),
            ),
          ),
          GestureDetector(
            onTap: () {
              widget.onTapped();
              controller.forward();
            },
            child: animation.value < (85 * pi / 180)
                ? Transform(
                    alignment: Alignment.center,
                    transform: Matrix4.identity()
                      ..setEntry(3, 2, 0.001)
                      ..translate(
                        0.0,
                        (widget.height / 2) * sin(animation.value),
                        -((widget.height / 2) * cos(animation.value)),
                      )
                      ..rotateX(animation.value),
                    child: Container(
                      child: Center(child: widget.topChild),
                    ),
                  )
                : Container(),
          ),
        ],
      ),
    );
  }
}
