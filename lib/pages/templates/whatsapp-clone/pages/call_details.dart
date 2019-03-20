import 'package:flutter/material.dart';
import 'package:playground_flutter/models/call_model.dart';

class CallDetail extends StatelessWidget {
  final CallModel call;

  CallDetail({Key key, @required this.call}) : super(key: key);

  Widget buildHeader(BuildContext context) {
    return Container(
      color: Colors.white,
      height: 100.0,
      alignment: Alignment.center,
      child: new ListTile(
        leading: new Container(
          height: 70.0,
          width: 70.0,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(40.0),
            image: DecorationImage(
              image: new NetworkImage(call.avatar),
              fit: BoxFit.scaleDown,
            ),
          ),
        ),
        title: new Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            new Text(
              call.name,
              style: new TextStyle(fontSize: 25.0),
            ),
            Row(
              children: <Widget>[
                new Icon(
                  Icons.call,
                  color: Theme.of(context).primaryColor,
                  size: 30.0,
                ),
                SizedBox(width: 20.0),
                new Icon(
                  Icons.videocam,
                  color: Theme.of(context).primaryColor,
                  size: 30.0,
                )
              ],
            )
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: new Color(0xff075E54),
        title: Text('Call info'),
        actions: <Widget>[
          new Container(
            width: 80.0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                new Icon(
                  Icons.chat,
                  color: Colors.white,
                ),
                new Icon(
                  Icons.more_vert,
                  color: Colors.white,
                )
              ],
            ),
          )
        ],
      ),
      body: Container(
        color: Colors.grey[300],
        child: Column(
          children: <Widget>[
            buildHeader(context),
            Expanded(
              child: Container(
                padding: EdgeInsets.all(12.0),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5.0),
                    color: Colors.white,
                  ),
                  child: ListView(
                    children: <Widget>[
                      new ListTile(
                        title: new Text(
                          '31 de diciembre de 2018',
                          style: TextStyle(
                            color: Theme.of(context).primaryColor,
                            fontSize: 20.0,
                          ),
                        ),
                      ),
                      new Divider(),
                      buildListItem(context),
                      new Divider(),
                      buildListItem(context),
                      new Divider(),
                      buildListItem(context),
                      new Divider(),
                      buildListItem(context),
                      new Divider(),
                      buildListItem(context),
                      new Divider(),
                      buildListItem(context),
                      new Divider()
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  ListTile buildListItem(BuildContext context) {
    return new ListTile(
      title: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Column(
            children: <Widget>[
              SizedBox(height: 5.0),
              new Icon(
                Icons.call_received,
                color: Theme.of(context).accentColor,
                size: 17.0,
              ),
            ],
          ),
          SizedBox(width: 10.0),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                new Text(
                  "Entrante",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20.0,
                  ),
                ),
                SizedBox(height: 5.0),
                new Text(
                  "10:38 pm",
                  style: TextStyle(fontSize: 17.0),
                ),
              ],
            ),
          )
        ],
      ),
      trailing: new Column(
        children: <Widget>[
          new Text(
            "0:07",
            style: TextStyle(fontSize: 17.0),
          ),
          SizedBox(height: 5.0),
          new Text(
            "18 kb",
            style: TextStyle(fontSize: 17.0),
          ),
        ],
      ),
    );
  }
}
