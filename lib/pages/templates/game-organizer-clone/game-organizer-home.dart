import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:playground_flutter/bloc/theme.bloc.dart';
import 'package:playground_flutter/configs/themes.dart';
import 'package:playground_flutter/data/game-organizer-data.dart';
import 'package:playground_flutter/data/icons.dart';
import 'package:playground_flutter/models/game_organizer_model.dart';
import 'package:playground_flutter/pages/templates/game-organizer-clone/game-organizer-detail.dart';
import 'package:playground_flutter/pages/templates/game-organizer-clone/game-organizer-item.dart';

Color color = new Color(0xff00b965);
Color textColor = new Color(0xffa8b6c2);

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
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.white,
        fixedColor: color,
        currentIndex: 0,
        items: [
          new BottomNavigationBarItem(
            icon: Icon(
              Icons.grid_on,
              size: 30,
            ),
            title: Text(
              "Games",
              style: TextStyle(
                fontSize: 12,
              ),
            ),
          ),
          new BottomNavigationBarItem(
            icon: Icon(
              history,
              size: 30,
              color: Color(0xff9dacbb),
            ),
            title: Text(
              "History",
              style: TextStyle(
                fontSize: 12,
                color: Color(0xff9dacbb),
              ),
            ),
          ),
          new BottomNavigationBarItem(
            icon: Icon(
              users,
              size: 30,
              color: Color(0xff9dacbb),
            ),
            title: Text(
              "Lists",
              style: TextStyle(
                fontSize: 12,
                color: Color(0xff9dacbb),
              ),
            ),
          ),
          new BottomNavigationBarItem(
            icon: Icon(
              Icons.notifications_none,
              size: 30,
              color: Color(0xff9dacbb),
            ),
            title: Text(
              "Notificaciones",
              style: TextStyle(
                fontSize: 12,
                color: Color(0xff9dacbb),
              ),
            ),
          ),
          new BottomNavigationBarItem(
            icon: Icon(
              Icons.account_circle,
              size: 30,
              color: Color(0xff9dacbb),
            ),
            title: Text(
              "Profile",
              style: TextStyle(
                fontSize: 12,
                color: Color(0xff9dacbb),
              ),
            ),
          )
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
                  ..._buildItems(width, height, organizerTodayData, context),
                  SizedBox(height: 15),
                  _buildText("Other"),
                  ..._buildItems(width, height, organizerOtherData, context),
                  SizedBox(height: 10),
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
        color: textColor,
        fontSize: 15,
      ),
    );
  }

  List<Widget> _buildItems(double width, double height,
      List<GameOrganizerModelModel> data, BuildContext context) {
    return data.map((item) {
      return Padding(
        padding: const EdgeInsets.only(top: 15),
        child: GestureDetector(
          onTap: () {
            Navigator.of(context).pushReplacement(
              MaterialPageRoute(
                builder: (_) => new GameOrganizerDetail(item: item),
              ),
            );
          },
          child: Container(
            width: width,
            height: height * .37,
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Color(0xffeff2f3),
                  offset: Offset(2.0, 10.0),
                  blurRadius: 10.0,
                ),
              ],
            ),
            child: GameOrganizerItem(
              item: item,
            ),
          ),
        ),
      );
    }).toList();
  }
}
