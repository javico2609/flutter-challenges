import 'package:flutter/material.dart';

Color primaryColor = Color(0xffdc2f2e);

class FurnitureCategoryHome extends StatefulWidget {
  FurnitureCategoryHome({Key key}) : super(key: key);

  @override
  _FurnitureCategoryHomeState createState() => _FurnitureCategoryHomeState();
}

class _FurnitureCategoryHomeState extends State<FurnitureCategoryHome> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.fromLTRB(10, 15, 10, 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  IconButton(
                    icon: Icon(Icons.arrow_back),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                  Text(
                    "Chair Furniture",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 22,
                    ),
                  ),
                  Container(
                    width: 50,
                    alignment: Alignment.centerLeft,
                    child: Stack(
                      children: <Widget>[
                        Container(
                          width: 45,
                          height: 45,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black54,
                                blurRadius: 3,
                              )
                            ],
                          ),
                          child: Icon(
                            Icons.notifications_none,
                            color: Colors.black87,
                            size: 28,
                          ),
                        ),
                        Positioned(
                          top: 0,
                          right: 2,
                          child: Container(
                            width: 12,
                            height: 12,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: primaryColor,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 10),
            Container(
              height: 50,
              width: width,
              child: ListView(
                scrollDirection: Axis.horizontal,
                padding: EdgeInsets.only(left: 10),
                children: <Widget>[
                  _buildCategoryItem(
                    width: 70.0,
                    child: Icon(
                      Icons.tune,
                      size: 32.0,
                    ),
                    onTap: () async {
                      await showModalBottomSheet(
                        context: context,
                        builder: (BuildContext c) {
                          return GestureDetector(
                            behavior: HitTestBehavior.opaque,
                            onTap: () {},
                            child: new Container(
                              height: height * .8,
                              color: Color(0xFF737373),
                              child: new Container(
                                padding: const EdgeInsets.only(
                                  top: 10,
                                  bottom: 10,
                                ),
                                decoration: new BoxDecoration(
                                  color: Theme.of(context).canvasColor,
                                  borderRadius: new BorderRadius.only(
                                    topLeft: const Radius.circular(30.0),
                                    topRight: const Radius.circular(30.0),
                                  ),
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    Padding(
                                      padding: const EdgeInsets.only(
                                        left: 20,
                                        right: 20,
                                      ),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: <Widget>[
                                          Text(
                                            "Sort & Filter",
                                            style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 16,
                                            ),
                                          ),
                                          IconButton(
                                            icon: Icon(
                                              Icons.close,
                                              color: Colors.black,
                                            ),
                                            onPressed: () {
                                              Navigator.of(context).pop();
                                            },
                                          )
                                        ],
                                      ),
                                    ),
                                    _buildBottomModalItem(
                                      width: width,
                                      isDivider: true,
                                      chlid: Text(
                                        "Sort by",
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16,
                                        ),
                                      ),
                                    ),
                                    _buildBottomModalItem(
                                      width: width,
                                      isDivider: false,
                                      chlid: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: <Widget>[
                                          Icon(Icons.access_time),
                                          SizedBox(width: 10),
                                          Text("Latest"),
                                          Spacer(),
                                          Icon(
                                            Icons.check,
                                            color: primaryColor,
                                          ),
                                        ],
                                      ),
                                    ),
                                    _buildBottomModalItem(
                                      width: width,
                                      isDivider: false,
                                      chlid: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: <Widget>[
                                          Icon(Icons.access_time),
                                          SizedBox(width: 10),
                                          Text("Popularity"),
                                          Spacer(),
                                          Icon(
                                            Icons.check,
                                            color: primaryColor,
                                          ),
                                        ],
                                      ),
                                    ),
                                    _buildBottomModalItem(
                                      width: width,
                                      isDivider: false,
                                      chlid: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: <Widget>[
                                          Icon(Icons.access_time),
                                          SizedBox(width: 10),
                                          Text("Low to High Prices"),
                                          Spacer(),
                                          Icon(
                                            Icons.check,
                                            color: primaryColor,
                                          ),
                                        ],
                                      ),
                                    ),
                                    _buildBottomModalItem(
                                      width: width,
                                      isDivider: false,
                                      chlid: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: <Widget>[
                                          Icon(Icons.access_time),
                                          SizedBox(width: 10),
                                          Text("High to Low Prices"),
                                          Spacer(),
                                          Icon(
                                            Icons.check,
                                            color: primaryColor,
                                          ),
                                        ],
                                      ),
                                    ),
                                    _buildBottomModalItem(
                                      width: width,
                                      isDivider: true,
                                      chlid: Text(
                                        "Filter by",
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16,
                                        ),
                                      ),
                                    ),
                                    Spacer(),
                                  ],
                                ),
                              ),
                            ),
                          );
                        },
                      );
                    },
                  ),
                  _buildCategoryItem(
                    width: 100.0,
                    child: Text(
                      "Office",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 17,
                      ),
                    ),
                    color: primaryColor,
                  ),
                  _buildCategoryItem(
                    width: 100.0,
                    child: Text(
                      "Kitchen",
                      style: TextStyle(
                        fontSize: 17,
                      ),
                    ),
                  ),
                  _buildCategoryItem(
                    width: 100.0,
                    child: Text(
                      "Cofe",
                      style: TextStyle(
                        fontSize: 17,
                      ),
                    ),
                  ),
                  _buildCategoryItem(
                    width: 100.0,
                    child: Text(
                      "Home",
                      style: TextStyle(
                        fontSize: 17,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 10),
            Expanded(
              child: ListView(
                children: <Widget>[
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      _buildItem(width),
                      _buildItem(width),
                    ],
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      _buildItem(width),
                      _buildItem(width),
                    ],
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      _buildItem(width),
                      _buildItem(width),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Container _buildBottomModalItem({
    double width,
    Widget chlid,
    bool isDivider = false,
  }) {
    return Container(
      alignment: Alignment.centerLeft,
      padding: const EdgeInsets.only(
        left: 20,
        right: 20,
      ),
      width: width,
      height: 40,
      decoration: BoxDecoration(
        color: isDivider ? Colors.grey[200] : Colors.white,
        border: Border(
          bottom: BorderSide(
            color: Colors.grey[400],
            width: 0.5,
          ),
          top: BorderSide(
            color: Colors.grey[400],
            width: 0.5,
          ),
        ),
      ),
      child: chlid,
    );
  }

  Widget _buildItem(double width) {
    return Padding(
      padding: EdgeInsets.fromLTRB(10, 0, 5, 5),
      child: Card(
        elevation: 2,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            width: width * .4,
            height: 300,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: <Widget>[
                Icon(
                  Icons.favorite_border,
                  color: primaryColor,
                ),
                Container(
                  alignment: Alignment.center,
                  child: Container(
                    width: 100,
                    height: 210,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      image: DecorationImage(
                        fit: BoxFit.contain,
                        image: NetworkImage(
                            "https://www.california-chiavari-chairs.com/v/vspfiles/photos/7900RFW-2T.jpg"),
                      ),
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.center,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text("Backless Silver"),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Icon(
                            Icons.star,
                            color: Colors.yellow,
                            size: 15,
                          ),
                          Icon(
                            Icons.star,
                            color: Colors.yellow,
                            size: 15,
                          ),
                          Icon(
                            Icons.star,
                            color: Colors.yellow,
                            size: 15,
                          ),
                          Icon(
                            Icons.star,
                            color: Colors.yellow,
                            size: 15,
                          ),
                          Icon(
                            Icons.star,
                            color: Colors.yellow,
                            size: 15,
                          ),
                        ],
                      ),
                      Container(
                        width: 100,
                        child: Divider(
                          color: Colors.black54,
                        ),
                      ),
                      Text(
                        "\$30",
                        style: TextStyle(
                          color: primaryColor,
                          fontWeight: FontWeight.bold,
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildCategoryItem({width, child, color = Colors.white, onTap}) {
    return InkWell(
      onTap: onTap,
      child: Card(
        elevation: 2,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(10.0)),
        ),
        child: Container(
          alignment: Alignment.center,
          height: 40,
          width: width,
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
          child: child,
        ),
      ),
    );
  }
}
