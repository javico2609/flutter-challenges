import 'package:flutter/material.dart';
import 'dart:math' as math;
import 'package:playground_flutter/pages/templates/smart-home-clone/overlay-actions.dart';

Color color = Color(0xffff024a);

class CenterBottomButton extends StatefulWidget {
  @override
  _CenterBottomButtonState createState() => _CenterBottomButtonState();
}

class _CenterBottomButtonState extends State<CenterBottomButton>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = new AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 100),
    );
  }

  @override
  Widget build(BuildContext context) {
    return AnchoredOverlay(
      showOverlay: true,
      overlayBuilder: (context, offset) {
        return Stack(
          children: <Widget>[
            CenterAbout(
              position: Offset(
                MediaQuery.of(context).size.width / 2,
                MediaQuery.of(context).size.height - 100,
              ),
              child: ScaleTransition(
                scale: new CurvedAnimation(
                  parent: _controller,
                  curve: Curves.easeInOut,
                ),
                child: Container(
                  width: 56,
                  height: 180,
                  decoration: BoxDecoration(
                    color: color,
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[],
                  ),
                ),
              ),
            ),
          ],
        );
      },
      child: new FloatingActionButton(
        heroTag: null,
        backgroundColor: color,
        child: new Icon(Icons.add),
        onPressed: () {
          if (_controller.isDismissed) {
            _controller.forward();
          } else {
            _controller.reverse();
          }
        },
      ),
    );
  }
}
