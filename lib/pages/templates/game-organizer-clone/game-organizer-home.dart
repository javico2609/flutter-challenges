import 'package:flutter/material.dart';
import 'package:playground_flutter/bloc/theme.bloc.dart';
import 'package:playground_flutter/configs/themes.dart';
import 'package:playground_flutter/pages/templates/game-organizer-clone/line-painter.dart';

Color color = new Color(0xff00b965);

class GameOrganizerHome extends StatefulWidget {
  GameOrganizerHome({Key key}) : super(key: key);

  _GameOrganizerHomeState createState() => _GameOrganizerHomeState();
}

class _GameOrganizerHomeState extends State<GameOrganizerHome> {
  @override
  void initState() {
    super.initState();
    themeBloc.changeTheme(Themes.gameOrganizer);
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        actions: <Widget>[
          Icon(
            Icons.add_circle,
            size: 35,
          ),
          SizedBox(width: 10),
        ],
      ),
      body: Container(
        width: width,
        height: height,
        child: Column(
          children: <Widget>[
            Container(
              color: color,
              width: width,
              height: 110,
              child: Padding(
                padding: const EdgeInsets.only(
                  top: 0,
                  right: 16,
                  left: 16,
                  bottom: 10,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      "Existing games",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 35,
                      ),
                    ),
                    SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        _buildInputFilter("Date"),
                        SizedBox(width: 15),
                        _buildInputFilter("Time"),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: ListView(
                padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
                children: <Widget>[
                  _buildText("Today"),
                  SizedBox(height: 10),
                  Card(
                    elevation: 0.8,
                    child: Container(
                      width: width,
                      height: height * .35,
                      child: Column(
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.fromLTRB(16, 16, 16, 10),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Container(
                                  height: 50,
                                  width: 50,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5),
                                    color: Colors.orangeAccent.withOpacity(0.2),
                                  ),
                                ),
                                SizedBox(width: 10),
                                Expanded(
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Text(
                                        "Tennis",
                                        style: TextStyle(
                                          fontSize: 19,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                      SizedBox(height: 5),
                                      Text(
                                        "April 1, 2019",
                                        style: TextStyle(
                                          fontSize: 15,
                                          color: Colors.grey,
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                Container(
                                  alignment: Alignment.centerRight,
                                  width: 70,
                                  child: Text(
                                    "12:30",
                                    style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            width: width,
                            height: 20,
                            child: CustomPaint(
                              foregroundPainter: LinePainter(),
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildInputFilter(String type) {
    return Container(
      width: 100,
      height: 30,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(5),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Text(
            type,
            style: TextStyle(
              fontSize: 16,
            ),
          ),
          Icon(
            Icons.keyboard_arrow_down,
            size: 18,
          ),
        ],
      ),
    );
  }

  Widget _buildText(String msg) {
    return Text(
      msg,
      style: TextStyle(
        color: Colors.grey,
      ),
    );
  }
}
