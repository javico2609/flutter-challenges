import 'package:flutter/material.dart';
import 'package:playground_flutter/pages/templates/news-app-concept-clone/bottom-bar.dart';
import 'package:playground_flutter/pages/templates/news-app-concept-clone/categories-navigator.dart';
import 'package:playground_flutter/pages/templates/news-app-concept-clone/news-app-concept-details.dart';

String img =
    "https://passivehouseplus.ie/media/k2/items/cache/fc5d9d8578a06f6d4c69c78df34d3f3a_XL.jpg?t=-62169984000";
String avatar =
    "https://heavyeditorial.files.wordpress.com/2017/07/jessica-johnson-5.jpg?w=531&quality=65&strip=all&h=531";

String img2 =
    "http://www.dubaiweek.ae/wp-content/uploads/2017/10/Krusty-The-Cone-1-e1507813664264.jpg";

class NewsAppConceptHome extends StatelessWidget {
  const NewsAppConceptHome({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Icon(
              Icons.menu,
              color: Colors.black,
              size: 32,
            ),
            Icon(
              Icons.search,
              color: Colors.black,
              size: 32,
            ),
          ],
        ),
      ),
      body: Container(
        width: width,
        height: height,
        child: Stack(
          children: <Widget>[
            Column(
              children: <Widget>[
                SizedBox(height: 10),
                CategoriesNavigator(
                  categories: [
                    "Latest",
                    "Decorative",
                    "Music",
                    "Style",
                  ],
                  onChangeActiveTab: (int index) {},
                ),
                SizedBox(height: 10),
                Flexible(
                  flex: 1,
                  child: LayoutBuilder(
                    builder: (BuildContext c, BoxConstraints constraints) {
                      return ListView(
                        padding: const EdgeInsets.only(left: 20),
                        scrollDirection: Axis.horizontal,
                        children: <Widget>[
                          _buildItem(width, constraints),
                          SizedBox(width: 15),
                          _buildItem(width, constraints),
                          SizedBox(width: 15),
                        ],
                      );
                    },
                  ),
                ),
                SizedBox(height: 5),
                Flexible(
                  flex: 1,
                  child: LayoutBuilder(
                      builder: (BuildContext c, BoxConstraints constraints) {
                    return Padding(
                      padding: const EdgeInsets.only(left: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            "Recommend",
                            textAlign: TextAlign.left,
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 20,
                            ),
                          ),
                          SizedBox(height: 15),
                          Expanded(
                            child: Container(
                              height: constraints.maxHeight,
                              width: constraints.maxWidth,
                              child: ListView(
                                children: <Widget>[
                                  _buildRecommendItem(constraints),
                                  SizedBox(height: 10),
                                  _buildRecommendItem(constraints),
                                  SizedBox(height: 10),
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                    );
                  }),
                ),
                SizedBox(height: 60),
              ],
            ),
            Positioned(
              bottom: 0,
              width: width,
              height: 70,
              child: BottomBar(
                onChangeActiveTab: (int index) {},
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildRecommendItem(BoxConstraints constraints) {
    double height = constraints.maxHeight * .50;

    return Container(
      height: height,
      width: constraints.maxWidth,
      child: Stack(
        children: <Widget>[
          Positioned(
            left: 15,
            bottom: 0,
            width: constraints.maxWidth - 70,
            height: height - 15,
            child: Stack(
              children: <Widget>[
                Container(
                  padding: EdgeInsets.only(left: constraints.maxWidth * .25),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: Colors.white,
                    //boxShadow: shadow1,
                    border: Border.all(
                      color: Colors.grey,
                      width: 0.3,
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Expanded(
                        child: ListTile(
                          contentPadding: EdgeInsets.only(right: 8),
                          leading: CircleAvatar(
                            backgroundColor: Colors.grey,
                            backgroundImage: new NetworkImage(avatar),
                          ),
                          title: RichText(
                            text: new TextSpan(
                              text: 'by ',
                              style: TextStyle(
                                color: Colors.black54,
                              ),
                              children: <TextSpan>[
                                new TextSpan(
                                  text: 'Jennifer Carol',
                                  style: new TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          subtitle: Text(
                            "January 23, 2019",
                            style: TextStyle(
                              fontSize: 13,
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: ListTile(
                          contentPadding: EdgeInsets.all(0),
                          title: Text(
                            "Ice Cream to Happy day",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          subtitle: Text(
                            "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod",
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ),
                      SizedBox(height: 22),
                    ],
                  ),
                ),
                Positioned(
                  right: 10,
                  top: 10,
                  child: Icon(
                    Icons.favorite,
                    color: Color(0xffff8993),
                    size: 18,
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            top: 0,
            left: 0,
            width: constraints.maxWidth * .26,
            height: height - 20,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                image: DecorationImage(
                  image: NetworkImage(img2),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Container _buildItem(double width, BoxConstraints constraints) {
    return Container(
      width: width - 40,
      child: Builder(builder: (context) {
        return GestureDetector(
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(builder: (_) => NewsAppConceptDetails()),
            );
          },
          child: Stack(
            children: <Widget>[
              Positioned(
                top: 0,
                width: width - 45,
                height: constraints.maxHeight * .65,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: NetworkImage(img),
                    ),
                  ),
                ),
              ),
              Positioned(
                bottom: 0,
                width: width - 45,
                height: constraints.maxHeight * .55,
                child: Padding(
                  padding: const EdgeInsets.all(15),
                  child: Stack(
                    children: <Widget>[
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(5),
                          border: Border.all(
                            color: Colors.grey,
                            width: 0.5,
                          ),
                          //boxShadow: shadow1,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Expanded(
                              child: ListTile(
                                leading: CircleAvatar(
                                  backgroundColor: Colors.grey,
                                  backgroundImage: new NetworkImage(avatar),
                                ),
                                title: RichText(
                                  text: new TextSpan(
                                    text: 'by ',
                                    style: TextStyle(
                                      color: Colors.black54,
                                    ),
                                    children: <TextSpan>[
                                      new TextSpan(
                                        text: 'Jennifer Carol',
                                        style: new TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                subtitle: Text(
                                  "January 23, 2019",
                                  style: TextStyle(
                                    fontSize: 13,
                                  ),
                                ),
                              ),
                            ),
                            Expanded(
                              child: ListTile(
                                title: Text(
                                  "Beatiful House in Malang",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                subtitle: Text(
                                    "lorem ipsum color sit amet, consectetur"),
                              ),
                            ),
                            SizedBox(height: 10),
                          ],
                        ),
                      ),
                      Positioned(
                        right: 10,
                        top: 10,
                        child: Icon(
                          Icons.favorite,
                          color: Color(0xffff8993),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      }),
    );
  }
}
