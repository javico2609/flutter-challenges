import 'package:flutter/material.dart';
import 'package:playground_flutter/data/trending.dart';

class Trending extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Trending Template'),
      ),
      body: Column(
        children: <Widget>[
          Padding(
            padding:
                EdgeInsets.only(top: 12.0, bottom: 2.5, left: 7.0, right: 7.0),
            child: Container(
              alignment: Alignment.centerLeft,
              child: Text(
                'Explore',
                style: TextStyle(fontSize: 20.0),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(7.0),
            child: Container(
              height: 100.0,
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(right: 2.5),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Color(0xFFFD7384),
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Icon(
                              Icons.directions_car,
                              color: Colors.white,
                            ),
                            Text(
                              'Motor',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 2.5),
                      child: Column(
                        children: <Widget>[
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.only(bottom: 2.5),
                              child: Container(
                                decoration: BoxDecoration(
                                  color: Color(0XFF2BD093),
                                  borderRadius: BorderRadius.circular(5.0),
                                ),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: <Widget>[
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          left: 5.0, right: 2.5),
                                      child: Icon(
                                        Icons.local_offer,
                                        color: Colors.white,
                                      ),
                                    ),
                                    Text(
                                      'Classified',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.only(top: 2.5),
                              child: Container(
                                decoration: BoxDecoration(
                                  color: Color(0XFFFC7B4D),
                                  borderRadius: BorderRadius.circular(5.0),
                                ),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: <Widget>[
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          left: 5.0, right: 2.5),
                                      child: Icon(
                                        Icons.beenhere,
                                        color: Colors.white,
                                      ),
                                    ),
                                    Text(
                                      'Service',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 2.5),
                      child: Column(
                        children: <Widget>[
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.only(bottom: 2.5),
                              child: Container(
                                decoration: BoxDecoration(
                                  color: Color(0XFF53CEDB),
                                  borderRadius: BorderRadius.circular(5.0),
                                ),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: <Widget>[
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          left: 5.0, right: 2.5),
                                      child: Icon(
                                        Icons.account_balance,
                                        color: Colors.white,
                                      ),
                                    ),
                                    Text(
                                      'Properties',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.only(top: 2.5),
                              child: Container(
                                decoration: BoxDecoration(
                                  color: Color(0XFFF1B069),
                                  borderRadius: BorderRadius.circular(5.0),
                                ),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: <Widget>[
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          left: 5.0, right: 2.5),
                                      child: Icon(
                                        Icons.art_track,
                                        color: Colors.white,
                                      ),
                                    ),
                                    Text(
                                      'Jobs',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(7.0),
              child: ListView.builder(
                itemCount: trending.length,
                itemBuilder: (context, index) {
                  final item = trending[index];
                  return Container(
                    key: UniqueKey(),
                    height: 170.0,
                    child: Column(
                      children: <Widget>[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text(item.title, style: TextStyle(fontSize: 16.0)),
                            Text("View All",
                                style: TextStyle(
                                    fontSize: 16.0, color: Colors.blue)),
                          ],
                        ),
                        SizedBox(height: 8.0),
                        Row(
                          children: item.items
                              .map((product) => Expanded(
                                    child: Padding(
                                      padding:
                                          const EdgeInsets.only(right: 3.0),
                                      child: Column(
                                        children: <Widget>[
                                          new Container(
                                            height: 100.0,
                                            decoration: new BoxDecoration(
                                                borderRadius:
                                                    new BorderRadius.circular(
                                                        5.0),
                                                image: new DecorationImage(
                                                    image: new NetworkImage(
                                                        product.image),
                                                    fit: BoxFit.cover)),
                                          ),
                                          SizedBox(height: 5.0),
                                          Text(product.title,
                                              style:
                                                  new TextStyle(fontSize: 16.0),
                                              textAlign: TextAlign.center)
                                        ],
                                      ),
                                    ),
                                  ))
                              .toList(),
                        ),
                        SizedBox(height: 10.0),
                      ],
                    ),
                  );
                },
              ),
            ),
          )
        ],
      ),
      bottomNavigationBar: new BottomAppBar(
        child: new Container(
          height: 50.0,
          color: Colors.white,
          child: new Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              new Icon(
                Icons.home,
                size: 30.0,
                color: Color(0xFF18D191),
              ),
              new Icon(Icons.card_travel, size: 30.0),
              new Icon(Icons.local_offer, size: 30.0),
              new Icon(Icons.chat, size: 30.0),
              new Icon(Icons.format_list_bulleted, size: 30.0),
            ],
          ),
        ),
      ),
    );
  }
}
