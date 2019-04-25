import 'package:flutter/material.dart';

Color color1 = Color(0xff38bbad);
Color color2 = Color(0xff2b7a98);

class DaycareHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: Container(
        width: width,
        height: height,
        child: Stack(
          children: <Widget>[
            Container(
              width: width,
              height: height * .30,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [color1, color2],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
            ),
            buildHeader(width, height),
            buildHeaderData(height, width),
            buildHeaderInfoCard(height, width),
            buildNotificationPanel(width, height),
            buildBottomBar(width),
            buildFloatingButton(width, height),
          ],
        ),
      ),
    );
  }

  Widget buildHeader(double width, double height) {
    return Positioned(
      top: 30,
      child: Container(
        width: width,
        height: height * .30,
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    "DAYCARE",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Stack(
                    children: <Widget>[
                      Icon(
                        Icons.notifications_none,
                        color: Colors.white,
                      ),
                      Positioned(
                        top: 0,
                        right: 2,
                        child: Container(
                          height: 13,
                          width: 13,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.red,
                          ),
                          child: Text(
                            "5",
                            style: TextStyle(
                              fontSize: 10,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      )
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget buildHeaderData(double height, double width) {
    return Positioned(
      top: (height * .30) / 2 - 40,
      width: width,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Container(
            height: 80,
            width: 80,
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: new Border.all(color: Color(0xff2eb7a9), width: 3),
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: new NetworkImage(
                      "https://images.csmonitor.com/csm/2012/11/babyinbucket.jpg?alias=standard_900x600nc"),
                )),
          ),
          SizedBox(height: 5),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                "Hi Rose",
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 16),
              ),
              Text(
                ", Good Morning",
                style: TextStyle(color: Colors.white70, fontSize: 16),
              ),
            ],
          ),
          Text(
            "Today, 14 Aug 2017",
            style: TextStyle(color: Colors.white70, fontSize: 13),
          ),
        ],
      ),
    );
  }

  Widget buildHeaderInfoCard(double height, double width) {
    return Positioned(
      top: height * .30 - 25,
      width: width,
      child: Container(
        alignment: Alignment.center,
        child: Container(
          height: 50,
          width: width * .65,
          child: Material(
            elevation: 3,
            borderRadius: BorderRadius.circular(30),
            color: Colors.white,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: <Widget>[
                    Text("Check In"),
                    Text(
                      "9:00 AM",
                      style: TextStyle(
                        color: Color(0xff053150),
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                  ],
                ),
                Icon(
                  Icons.access_time,
                  size: 35,
                  color: Colors.grey,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text("Check In"),
                    Text(
                      "NOT YET",
                      style: TextStyle(
                        color: Color(0xff053150),
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buildBottomBar(double width) {
    return Positioned(
      bottom: 0,
      width: width,
      child: Container(
        height: 55,
        width: width,
        color: Colors.white,
        child: Material(
          elevation: 5,
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Container(
                width: width / 3,
                child: Icon(
                  Icons.account_circle,
                  size: 35,
                  color: Color(0xff065967).withOpacity(0.7),
                ),
              ),
              Container(width: width / 3),
              Container(
                width: width / 3,
                child: Icon(
                  Icons.assessment,
                  size: 35,
                  color: Color(0xff065967).withOpacity(0.7),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget buildFloatingButton(double width, double height) {
    return Positioned(
      top: height - 85,
      width: width,
      child: Container(
        height: 70,
        width: 70,
        child: RawMaterialButton(
          shape: CircleBorder(),
          fillColor: Color(0xff1a9bb1),
          elevation: 4,
          onPressed: () {},
          child: Icon(
            Icons.menu,
            size: 35,
            color: Colors.white,
          ),
        ),
      ),
    );
  }

  Widget buildNotificationPanel(double width, double height) {
    return Positioned(
      width: width,
      height: height * .70 - 80,
      top: height * 0.30 + 34,
      child: Padding(
        padding: const EdgeInsets.only(right: 16, left: 16, top: 10),
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Material(
                elevation: 1,
                color: Colors.white,
                child: Column(
                  children: <Widget>[
                    buildBodyCardTitle(title: "Notification & Messages"),
                    Divider(
                      height: 3,
                      color: Colors.black87,
                    ),
                    buildNotificationItem(icon: Icons.notifications_none),
                    Divider(
                      height: 3,
                      color: Colors.black87,
                    ),
                    buildNotificationItem(icon: Icons.chat),
                    Divider(
                      height: 3,
                      color: Colors.black87,
                    ),
                    buildNotificationItem(icon: Icons.child_friendly),
                  ],
                ),
              ),
              SizedBox(height: 15),
              Material(
                elevation: 1,
                color: Colors.white,
                child: Column(
                  children: <Widget>[
                    buildBodyCardTitle(title: "Invoice"),
                    Divider(
                      height: 3,
                      color: Colors.black87,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10, bottom: 10),
                      child: ListTile(
                        contentPadding: const EdgeInsets.only(left: 10),
                        leading: Card(
                          elevation: 2,
                          child: Container(
                            height: 60,
                            width: 60,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Text(
                                  "MAY",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 14,
                                  ),
                                ),
                                Text(
                                  "21",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18,
                                  ),
                                ),
                                Text(
                                  "2017",
                                  style: TextStyle(
                                    color: Colors.grey,
                                    fontSize: 12,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        title: Text(
                          "Invoce 1013",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        subtitle: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            Text("This month fate fee"),
                            Text(
                              "PENDING",
                              style: TextStyle(
                                color: Colors.red,
                                fontSize: 10,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                        trailing: Container(
                          height: 70,
                          width: 80,
                          padding: const EdgeInsets.only(right: 5),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              Text(
                                "\$1200",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                ),
                              ),
                              SizedBox(height: 2),
                              Container(
                                alignment: Alignment.center,
                                height: 30,
                                width: 80,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: Color(0xff1abcaa),
                                ),
                                child: Text(
                                  "PLAY NOW",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget buildBodyCardTitle({String title}) {
    return Container(
      padding: const EdgeInsets.all(15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Text(
            title,
            style: TextStyle(
              color: Color(0xff06866C),
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            "View All",
            style: TextStyle(color: Colors.grey),
          ),
        ],
      ),
    );
  }

  Widget buildNotificationItem({IconData icon}) {
    return Padding(
      padding: const EdgeInsets.only(top: 10, bottom: 10),
      child: ListTile(
        contentPadding: const EdgeInsets.only(left: 10),
        leading: Container(
          height: 60,
          width: 60,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            gradient: LinearGradient(
              colors: [color1, color2],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: Icon(
            icon,
            size: 28,
            color: Colors.white70,
          ),
        ),
        title: Text(
          "From Austin",
          style: TextStyle(color: Colors.grey, fontSize: 13),
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              "Celebrating New Year",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              "We are Celebrating Upcoming",
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                fontSize: 16,
              ),
            ),
          ],
        ),
        trailing: Container(
          height: 40,
          width: 70,
          decoration: BoxDecoration(
            border: Border(
              left: BorderSide(
                width: 1,
                color: Colors.black26,
              ),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.only(left: 5),
            child: Row(
              children: <Widget>[
                Icon(
                  Icons.timer,
                  color: Colors.grey,
                  size: 15,
                ),
                Text(
                  " 1 Day",
                  style: TextStyle(
                    color: Colors.grey,
                  ),
                )
              ],
            ),
          ),
        ),
        onTap: () {},
      ),
    );
  }
}
