import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:playground_flutter/bloc/theme.bloc.dart';
import 'package:playground_flutter/configs/themes.dart';
import 'package:playground_flutter/pages/templates/smart-home-clone/bottom-bar.dart';
import 'dart:math' as math;
import 'package:playground_flutter/pages/templates/smart-home-clone/curve-clipper.dart';

Color color = Color(0xffff024a);
Color color2 = Color(0xfffa3629);
String img2 =
    "https://passivehouseplus.ie/media/k2/items/cache/fc5d9d8578a06f6d4c69c78df34d3f3a_XL.jpg?t=-62169984000";

class SmartHome extends StatefulWidget {
  const SmartHome({Key key}) : super(key: key);

  @override
  _SmartHomeState createState() => _SmartHomeState();
}

class _SmartHomeState extends State<SmartHome>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;
  Animation<double> _heightAnimation;
  Animation<double> _iconSizeAnimation;

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

    _iconSizeAnimation =
        new Tween<double>(begin: 10, end: 35).animate(new CurvedAnimation(
      curve: Curves.easeInOut,
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
                //color: Color(0xffff1e39),
                gradient: LinearGradient(
                  colors: [
                    Color(0xffff1e39),
                    Color(0xffff4125),
                  ],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
              ),
            ),
          ),
          Positioned(
            top: 40,
            width: media.width,
            child: Container(
              alignment: Alignment.center,
              child: Text(
                "Good morning Rebeca",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                ),
              ),
            ),
          ),
          Positioned(
            top: media.height * .08,
            width: media.width,
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 18,
                vertical: 20,
              ),
              child: Container(
                height: 200,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      color: Color(0xffeff2f3),
                      offset: Offset(1, 5.0),
                      blurRadius: 3.0,
                    ),
                  ],
                ),
                child: Column(
                  children: <Widget>[
                    buildDashboardRow1(),
                    Divider(
                      color: Colors.grey,
                      height: 1,
                    ),
                    buildDashboardRow2(),
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            top: media.height * .38,
            height: (media.height * .66) - 100,
            width: media.width,
            child: Padding(
              padding: const EdgeInsets.only(left: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    "Routines",
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(height: 5),
                  Expanded(
                    child: ListView(
                      padding: const EdgeInsets.only(right: 20),
                      scrollDirection: Axis.horizontal,
                      children: List.generate(3, (_) {
                        return Column(
                          children: <Widget>[
                            _buildRoutinesItem(media),
                            SizedBox(height: 5),
                            _buildRoutinesItem(media),
                          ],
                        );
                      }),
                    ),
                  ),
                  SizedBox(height: 5),
                  Text(
                    "Rooms",
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(height: 5),
                  Expanded(
                    child: LayoutBuilder(builder: (_, constraint) {
                      return ListView(
                        padding: const EdgeInsets.only(right: 20),
                        scrollDirection: Axis.horizontal,
                        children: <Widget>[
                          _buildRoomItem(constraint, media),
                          _buildRoomItem(constraint, media),
                          _buildRoomItem(constraint, media),
                        ],
                      );
                    }),
                  ),
                ],
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
                      child: Icon(
                        Icons.history,
                        color: Colors.white,
                        size: _iconSizeAnimation.value,
                      ),
                    ),
                    Visibility(
                      visible: _heightAnimation.value > 160,
                      child: Icon(
                        Icons.history,
                        color: Colors.white,
                        size: _iconSizeAnimation.value,
                      ),
                    ),
                    Visibility(
                      visible: _heightAnimation.value > 90,
                      child: Icon(
                        Icons.history,
                        color: Colors.white,
                        size: _iconSizeAnimation.value,
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

  Card _buildRoomItem(BoxConstraints constraint, Size media) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        children: <Widget>[
          Container(
            height: constraint.maxHeight * .6,
            width: media.width * .7,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10),
                topRight: Radius.circular(10),
              ),
              image: DecorationImage(
                image: NetworkImage(img2),
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(height: 5),
          Expanded(
            child: Container(
              height: constraint.maxHeight,
              width: media.width * .7,
              padding: const EdgeInsets.only(left: 5, right: 5),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(left: 5),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          "Living Room",
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        Text(
                          "21ºC",
                          style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 15,
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 5),
                  Container(
                    height: 30,
                    width: 100,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: ExactAssetImage('assets/images/img6.png'),
                        fit: BoxFit.cover,
                      ),
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _buildRoutinesItem(Size media) {
    return Expanded(
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        child: Container(
          width: media.width * .6,
          child: ListTile(
            title: Text("10 PM daily"),
            subtitle: Text("SureFeed pet"),
            trailing: CupertinoSwitch(
              onChanged: (bool value) {},
              value: true,
            ),
          ),
        ),
      ),
    );
  }

  Widget buildDashboardRow1() {
    return Expanded(
      child: Row(
        children: <Widget>[
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Row(
                children: <Widget>[
                  Container(
                    width: 70,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: ExactAssetImage('assets/images/img4.png'),
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                  SizedBox(width: 10),
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          "Front door",
                          style: TextStyle(
                            color: color,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          "Locked",
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 15,
                          ),
                        ),
                        Container(
                          width: 30,
                          height: 12,
                          padding: const EdgeInsets.all(1.5),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(2),
                            border: Border.all(
                              color: Colors.grey,
                              width: 0.5,
                            ),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.only(right: 7),
                            child: Container(
                              decoration: BoxDecoration(
                                color: Color(0xff0ed02d),
                                borderRadius: BorderRadius.circular(2),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          VerticalDivider(
            color: Colors.grey,
            width: 1,
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Row(
                children: <Widget>[
                  Container(
                    width: 75,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: ExactAssetImage('assets/images/img3.png'),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  SizedBox(width: 10),
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          "Avg temp",
                          style: TextStyle(
                            color: color,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          "21ºC",
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 15,
                          ),
                        ),
                        Text(
                          "27ºC outside",
                          style: TextStyle(
                            fontSize: 13.5,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildDashboardRow2() {
    return Expanded(
      child: Row(
        children: <Widget>[
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Row(
                children: <Widget>[
                  Container(
                    width: 70,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: ExactAssetImage('assets/images/img1.png'),
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                  SizedBox(width: 10),
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          "Washer",
                          style: TextStyle(
                            color: color,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          "1:24",
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 15,
                          ),
                        ),
                        Text(
                          "Done 9.30 am",
                          style: TextStyle(
                            fontSize: 13.5,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          VerticalDivider(
            color: Colors.grey,
            width: 1,
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Row(
                children: <Widget>[
                  Container(
                    width: 75,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: ExactAssetImage('assets/images/img2.png'),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  SizedBox(width: 10),
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          "Devices on",
                          style: TextStyle(
                            color: color,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          "8",
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 15,
                          ),
                        ),
                        SizedBox(height: 20),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
