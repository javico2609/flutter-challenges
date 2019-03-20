import 'dart:async';
import 'package:flutter/material.dart';

typedef Operation = Function(Function(bool));
typedef CanExecuteOperation = bool Function();

class ProgressButton extends StatefulWidget {
  final String title;
  final Operation operation;
  final CanExecuteOperation canExecuteOperation;

  ProgressButton({
    Key key,
    @required this.title,
    @required this.operation,
    @required this.canExecuteOperation,
  }) : super(key: key);

  @override
  _ProgressButtonState createState() => _ProgressButtonState();
}

class _ProgressButtonState extends State<ProgressButton>
    with TickerProviderStateMixin {
  int _state = 0;
  Animation _animation;
  AnimationController _controller;
  GlobalKey _globalKey = GlobalKey();
  double _width = double.maxFinite;

  @override
  void dispose() {
    super.dispose();
    _controller?.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Align(
        alignment: Alignment.centerRight,
        child: PhysicalModel(
          elevation: 8,
          shadowColor: _state == 3 ? Colors.redAccent : Colors.greenAccent,
          color: _state == 3 ? Colors.red : Colors.green,
          borderRadius: BorderRadius.circular(25),
          child: Container(
            key: _globalKey,
            height: 48,
            width: _width,
            child: RaisedButton(
              animationDuration: Duration(milliseconds: 1000),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(25),
              ),
              padding: EdgeInsets.all(0),
              child: setUpButtonChild(),
              onPressed: () {
                if(widget.canExecuteOperation()) {
                  setState(() {
                    if (_state == 0) {
                      animateButton();
                    }
                  });
                }
              },
              elevation: 4,
              color: _state == 3 ? Colors.red : Colors.green,
            ),
          ),
        ),
      ),
    );
  }

  setUpButtonChild() {
    if (_state == 0) {
      return Text(
        widget.title,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 16,
        ),
      );
    } else if (_state == 1) {
      return SizedBox(
        height: 36,
        width: 36,
        child: CircularProgressIndicator(
          value: null,
          valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
        ),
      );
    }
    else if (_state == 2) {
      return IconButton(
        icon: Icon(Icons.check),
        color: Colors.white,
        onPressed: () {
          _controller.reset();
          setState(() {
            _state = 0;
          });
        },
      );
    }
    else {
      return IconButton(
        icon: Icon(Icons.cancel),
        color: Colors.white,
        onPressed: () {
          _controller.reset();
          setState(() {
            _state = 0;
          });
        },
      );
    }
  }

  void animateButton() async {
    double initialWidth = _globalKey.currentContext.size.width;

    _controller =
        AnimationController(duration: Duration(milliseconds: 300), vsync: this);

    _animation = Tween(begin: 0.0, end: 1).animate(_controller)
      ..addListener(() {
        setState(() {
          _width = initialWidth - ((initialWidth - 48) * _animation.value);
        });
      });
    _controller.forward();

    setState(() {
      _state = 1;
    });

    await widget.operation( (success) {
      if(success) {
        setState(() {
          _state = 2;
        });
      }
      else{
        setState(() {
          _state = 3;
        });
      }
    });

  }
}
