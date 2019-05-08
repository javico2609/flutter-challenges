import 'package:flutter/material.dart';
import 'package:playground_flutter/models/game_organizer_model.dart';
import 'package:playground_flutter/pages/templates/game-organizer-clone/game-organizer-item.dart';

Color color = new Color(0xff00b965);
Color textColor = new Color(0xffa8b6c2);

class GameOrganizerDetail extends StatefulWidget {
  final GameOrganizerModelModel item;

  GameOrganizerDetail({Key key, this.item}) : super(key: key);

  @override
  _GameOrganizerDetailState createState() => _GameOrganizerDetailState();
}

class _GameOrganizerDetailState extends State<GameOrganizerDetail>
    with SingleTickerProviderStateMixin {
  TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = new TabController(vsync: this, initialIndex: 0, length: 2);
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title: Icon(
          Icons.arrow_back_ios,
          color: color,
        ),
        actions: <Widget>[
          Icon(
            Icons.edit,
            size: 25,
            color: color,
          ),
          SizedBox(width: 16),
          Icon(
            Icons.more_horiz,
            size: 25,
            color: color,
          ),
          SizedBox(width: 10),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: color,
        child: Icon(
          Icons.person_add,
          color: Colors.white,
        ),
        onPressed: () {},
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      body: Column(
        children: <Widget>[
          Container(
            height: 80,
            width: width,
            child: GameOrganizerItem(
              item: widget.item,
              showDetail: false,
            ),
          ),
          Expanded(
            child: Column(
              children: <Widget>[
                new TabBar(
                  controller: _tabController,
                  indicatorColor: color,
                  indicatorSize: TabBarIndicatorSize.label,
                  indicatorWeight: 3,
                  tabs: <Widget>[
                    new Container(
                      height: 40,
                      child: Row(
                        children: <Widget>[
                          Icon(
                            Icons.group_add,
                            color: textColor,
                          ),
                          SizedBox(width: 10),
                          Text(
                            'Invitations',
                            style: TextStyle(
                              color: textColor,
                            ),
                          )
                        ],
                      ),
                    ),
                    new Container(
                      height: 40,
                      child: Row(
                        children: <Widget>[
                          Icon(
                            Icons.info,
                            color: textColor,
                          ),
                          SizedBox(width: 10),
                          Text(
                            'Informations',
                            style: TextStyle(
                              color: textColor,
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
                Expanded(
                  child: new TabBarView(
                    controller: _tabController,
                    children: <Widget>[
                      ListView(
                        padding: const EdgeInsets.only(left: 16, right: 16),
                        children: <Widget>[
                          _buildPlayerStatus(width),
                          _buildPlayerStatus(width),
                          _buildPlayerStatus(width),
                          _buildPlayerStatus(width, true),
                        ],
                      ),
                      Container(),
                    ],
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _buildPlayerStatus([double width, bool maybe = false]) {
    return Container(
      width: width,
      height: 80,
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: textColor,
            width: 0.5,
          ),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Container(
            height: 45,
            width: 45,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              image: DecorationImage(
                image: new NetworkImage(
                    "https://heavyeditorial.files.wordpress.com/2017/07/jessica-johnson-5.jpg?w=531&quality=65&strip=all&h=531"),
              ),
            ),
          ),
          SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  "Natalie Jeffrson",
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 18,
                  ),
                ),
                SizedBox(height: 5),
                Text(
                  "benet@gmail.com",
                  style: TextStyle(
                    color: textColor,
                    fontSize: 15,
                  ),
                ),
              ],
            ),
          ),
          Visibility(
            visible: !maybe,
            child: Container(
              width: 70,
              height: 30,
              decoration: BoxDecoration(
                color: color,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    "Yes",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                    ),
                  ),
                  SizedBox(width: 5),
                  Icon(
                    Icons.check,
                    color: Colors.white,
                    size: 12,
                  ),
                ],
              ),
            ),
          ),
          Visibility(
            visible: maybe,
            child: Row(
              children: <Widget>[
                Container(
                  alignment: Alignment.center,
                  width: 70,
                  height: 30,
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text(
                    "Maybe",
                    style: TextStyle(
                      color: Colors.black,
                    ),
                  ),
                ),
                SizedBox(width: 10),
                Icon(
                  Icons.close,
                  size: 17,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
