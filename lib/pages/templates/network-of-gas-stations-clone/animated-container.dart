import 'package:flutter/material.dart';

class NetworkAnimatedContainer extends StatefulWidget {
  final Widget child;
  final int waitTime;
  final AnimationController controller;

  NetworkAnimatedContainer({
    Key key,
    this.child,
    this.waitTime = 200,
    this.controller,
  }) : super(key: key);

  NetworkAnimatedContainerState createState() =>
      NetworkAnimatedContainerState();
}

class NetworkAnimatedContainerState extends State<NetworkAnimatedContainer>
    with SingleTickerProviderStateMixin {
  Animation _animation;
  AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = widget.controller ??
        AnimationController(
          vsync: this,
          duration: Duration(seconds: 1),
        );

    _animation = new Tween(begin: -1.0, end: 0.0).animate(
      new CurvedAnimation(
        parent: _controller,
        curve: Curves.elasticOut,
      ),
    );

    _controller.addListener(() {
      setState(() {});
    });

    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await _animate();
    });
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Transform(
      transform: new Matrix4.translationValues(_animation.value * width, 0, 0),
      child: widget.child,
    );
  }

  Future<void> _animate() async {
    await Future.delayed(Duration(milliseconds: widget.waitTime));
    _controller.forward();
  }

  @override
  void dispose() {
    _controller?.dispose();
    super.dispose();
  }
}
