import 'package:flutter/material.dart';
import 'package:playground_flutter/bloc/theme.bloc.dart';
import 'package:playground_flutter/configs/themes.dart';
import 'package:playground_flutter/pages/templates/smart-home-clone/bottom-bar.dart';
import 'package:playground_flutter/pages/templates/smart-home-clone/center-bottom-button.dart';
import 'package:playground_flutter/pages/templates/smart-home-clone/curve-clipper.dart';

Color color = Color(0xffff024a);
Color color2 = Color(0xfffa3629);

class SmartHome extends StatefulWidget {
  const SmartHome({Key key}) : super(key: key);

  @override
  _SmartHomeState createState() => _SmartHomeState();
}

class _SmartHomeState extends State<SmartHome> {
  @override
  void initState() {
    super.initState();
    themeBloc.changeTheme(Themes.smartHome);
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
                gradient: LinearGradient(
                  colors: [
                    Color(0xffff024a),
                    Color(0xfffa3629),
                  ],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
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
            bottom: 6,
            left: (media.width / 2) - 25,
            child: CenterBottomButton(),
          ),
        ],
      ),
    ));
  }
}
