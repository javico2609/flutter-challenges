import 'package:flutter/material.dart';

class ProfileOne extends StatelessWidget {
  final color = Color(0xFF11E8161);

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height / 1.8;
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: color,
        title: Text('Profile'),
        centerTitle: true,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {},
          )
        ],
      ),
      body: Column(
        children: <Widget>[
          buildTop(height, width),
          Expanded(
            child: Container(
              padding: EdgeInsets.all(15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      buildOption(Icons.pie_chart, 'Leaders', false),
                      buildOption(Icons.show_chart, 'Level Up', false),
                      buildOption(Icons.card_giftcard, 'Gifts', false),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      buildOption(Icons.code, 'QR Code', false),
                      buildOption(Icons.pie_chart, 'Daily bonus', false),
                      buildOption(Icons.remove_red_eye, 'Visitors', false),
                    ],
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget buildTop(double height, double width) {
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(16.0),
          bottomRight: Radius.circular(16.0),
        ),
      ),
      child: Column(
        children: <Widget>[
          Container(
            height: height * 0.5,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Container(
                  width: width * 0.3,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        'Familiar',
                        style: TextStyle(color: Colors.white),
                      ),
                      SizedBox(height: 5.0),
                      Text(
                        '12',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 17.0,
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        height: 140,
                        width: 140,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                            fit: BoxFit.fill,
                            image: new NetworkImage(
                                "http://www.usanetwork.com/sites/usanetwork/files/styles/629x720/public/suits_cast_harvey.jpg?itok=fpTOeeBb"),
                          ),
                        ),
                      ),
                      SizedBox(height: 15.0),
                      Text(
                        'ID: 142563225',
                        style: TextStyle(color: Colors.white70),
                      )
                    ],
                  ),
                ),
                Container(
                  width: width * 0.3,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        'Fallowing',
                        style: TextStyle(color: Colors.white),
                      ),
                      SizedBox(height: 5.0),
                      Text(
                        '18',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 17.0,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Container(
            alignment: Alignment.center,
            padding: EdgeInsets.all(16.0),
            child: Text(
              "Javier González Rodríguez",
              style: TextStyle(
                fontSize: 25.0,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.only(top: 30.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                buildOption(Icons.group_add, "Friends", true),
                buildOption(Icons.group, "Groups", true),
                buildOption(Icons.videocam, "Videos", true),
                buildOption(Icons.favorite, "Likes", true),
              ],
            ),
          ),
          Spacer(),
        ],
      ),
    );
  }

  Widget buildOption(IconData icon, String text, bool top) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Container(
          padding: EdgeInsets.only(bottom: 10.0),
          child: Icon(
            icon,
            size: 37.0,
            color: top ? Colors.white : Colors.grey,
          ),
        ),
        Text(
          text,
          style: TextStyle(
            fontSize: 15.0,
            color: top ? Colors.white : Colors.black,
          ),
        ),
      ],
    );
  }
}
