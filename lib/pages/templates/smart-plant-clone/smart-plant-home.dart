import 'package:flutter/material.dart';
import 'dart:math' as math;

import 'package:playground_flutter/pages/templates/smart-plant-clone/chart-painter.dart';

class SmartPlantHome extends StatelessWidget {
  const SmartPlantHome({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double padding = MediaQuery.of(context).size.width * .1;
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      floatingActionButtonLocation:
          CustomCenterFloatFloatingActionButtonLocation(),
      floatingActionButton: FloatingActionButton(
        elevation: 2,
        backgroundColor: Color(0xfff8a935),
        child: Icon(
          Icons.add,
          size: 30,
        ),
        onPressed: () {},
      ),
      body: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xFF47bf9e),
              Color(0xFF73cb8f),
              Color(0xFFa5d882),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: SafeArea(
          child: Stack(
            children: <Widget>[
              buildTitleBar(padding, width),
              buildTopBarNavigation(padding, width),
              buildBody(padding, width, height),
              buildBottomNavBar(padding, width),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildTitleBar(double padding, double width) {
    return Positioned(
      left: padding,
      top: 20,
      width: width * .8,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.baseline,
        textBaseline: TextBaseline.ideographic,
        children: <Widget>[
          Text(
            "Home",
            style: TextStyle(
              color: Colors.white,
              fontSize: 25,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            "25 ºC",
            style: TextStyle(
              color: Colors.white,
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }

  Widget buildTopBarNavigation(double padding, double width) {
    return Positioned(
      left: padding,
      top: 65,
      width: width,
      height: 35,
      child: ListView(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.only(right: 50),
        children: <Widget>[
          buildNavItem("Today", true),
          buildNavItem("Tomorrow", false),
          buildNavItem("April 17", false),
          buildNavItem("April 18", false),
          buildNavItem("April 19", false),
          buildNavItem("April 20", false),
          buildNavItem("April 21", false),
          buildNavItem("April 22", false),
          buildNavItem("April 23", false),
        ],
      ),
    );
  }

  Widget buildBody(double padding, double width, double height) {
    return Positioned(
      top: 110,
      left: padding,
      width: width,
      height: height - 230,
      child: Column(
        children: <Widget>[
          buildInfoSection(width),
          buildDailySection(width),
          buildARSection(width)
        ],
      ),
    );
  }

  Widget buildBottomNavBar(double padding, double width) {
    return Positioned(
      bottom: 20,
      left: padding,
      child: Container(
        width: width * .8,
        padding: const EdgeInsets.all(5),
        height: 60,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(30),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(left: 30),
              child: Container(
                width: 50,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Icon(Icons.domain),
                    Container(
                      height: 2,
                      width: 2,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 30),
              child: Container(
                width: 30,
                height: 30,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.grey,
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage(
                        "http://www.usanetwork.com/sites/usanetwork/files/styles/629x720/public/suits_cast_harvey.jpg?itok=fpTOeeBb"),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildInfoSection(double width) {
    return Flexible(
      flex: 3,
      child: Container(
        padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
        alignment: Alignment.centerLeft,
        child: Container(
          width: width * .8,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Container(
                width: 100,
                child: Image.asset(
                  'assets/images/leaves.png',
                  fit: BoxFit.contain,
                ),
              ),
              SizedBox(width: 10),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  SizedBox(height: 20),
                  Text(
                    "35%",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Container(
                    height: 30,
                    width: width * .5,
                    child: CustomPaint(
                      foregroundPainter: ChartPainter(),
                    ),
                  ),
                  Text(
                    "250 ml",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    "Nedd more water",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                    ),
                  ),
                  SizedBox(height: 5),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildDailySection(double width) {
    return Flexible(
      flex: 2,
      child: Container(
        padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
        alignment: Alignment.centerLeft,
        child: Container(
          width: width,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                "Daily Plants",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                ),
              ),
              SizedBox(height: 10),
              Expanded(
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: <Widget>[
                    buildDailyPlantItem(width),
                    buildDailyPlantItem(width),
                    buildDailyPlantItem(width),
                    buildDailyPlantItem(width),
                    buildDailyPlantItem(width),
                    buildDailyPlantItem(width),
                    SizedBox(width: 50),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildARSection(double width) {
    return Flexible(
      flex: 3,
      child: Container(
        padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
        alignment: Alignment.centerLeft,
        child: Container(
          width: width * .8,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Text(
                "Advertise",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                ),
              ),
              SizedBox(height: 10),
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Container(
                            width: 60,
                            height: 60,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: ExactAssetImage(
                                    "assets/images/ar-glasses.png"),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                "AR Mode",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                ),
                              ),
                              Container(
                                width: width * .5,
                                child: Text(
                                  "Introduce new tools to recognize your garden",
                                  textAlign: TextAlign.justify,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 10),
                        child: Text(
                          "Read more",
                          style: TextStyle(
                            color: Color(0xff2f61e9),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 10),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildDailyPlantItem(double width) {
    return LayoutBuilder(
      builder: (BuildContext c, BoxConstraints constraints) {
        return Padding(
          padding: const EdgeInsets.only(right: 10),
          child: Container(
            width: width * .5,
            height: constraints.maxHeight,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(15),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Container(
                  height: 40,
                  width: 40,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: ExactAssetImage("assets/images/cactus.png"),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    SizedBox(height: 5),
                    Text(
                      "Room Plants",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Row(
                      children: <Widget>[
                        Icon(
                          Icons.alarm,
                          size: 15,
                        ),
                        Text("2:00 PM")
                      ],
                    ),
                    Row(
                      children: <Widget>[
                        Icon(
                          Icons.alarm,
                          size: 15,
                        ),
                        Text("2:00 PM")
                      ],
                    ),
                    SizedBox(height: 5),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

Widget buildNavItem(String msg, [bool active = false]) {
  return Padding(
    padding: const EdgeInsets.only(right: 10),
    child: Container(
      alignment: Alignment.center,
      width: 70,
      decoration: BoxDecoration(
          color: active ? Color(0xff47a37f) : Colors.transparent,
          borderRadius: BorderRadius.circular(20)),
      child: Text(
        msg,
        style: TextStyle(
          color: Colors.white,
        ),
      ),
    ),
  );
}

class CustomCenterFloatFloatingActionButtonLocation
    extends FloatingActionButtonLocation {
  const CustomCenterFloatFloatingActionButtonLocation();

  @protected
  double getDockedY(ScaffoldPrelayoutGeometry scaffoldGeometry) {
    final double contentBottom = scaffoldGeometry.contentBottom;
    final double bottomSheetHeight = scaffoldGeometry.bottomSheetSize.height;
    final double fabHeight = scaffoldGeometry.floatingActionButtonSize.height;
    final double snackBarHeight = scaffoldGeometry.snackBarSize.height;

    double fabY = (contentBottom - fabHeight / 2.0) - 80;
    // The FAB should sit with a margin between it and the snack bar.
    if (snackBarHeight > 0.0)
      fabY = math.min(
          fabY,
          contentBottom -
              snackBarHeight -
              fabHeight -
              kFloatingActionButtonMargin);
    // The FAB should sit with its center in front of the top of the bottom sheet.
    if (bottomSheetHeight > 0.0)
      fabY =
          math.min(fabY, contentBottom - bottomSheetHeight - fabHeight / 2.0);

    final double maxFabY = scaffoldGeometry.scaffoldSize.height - fabHeight;
    return math.min(maxFabY, fabY);
  }

  @override
  Offset getOffset(ScaffoldPrelayoutGeometry scaffoldGeometry) {
    final double fabX = (scaffoldGeometry.scaffoldSize.width -
            scaffoldGeometry.floatingActionButtonSize.width) /
        2.0;
    return Offset(fabX, getDockedY(scaffoldGeometry));
  }

  @override
  String toString() => 'FloatingActionButtonLocation.centerFloat';
}
