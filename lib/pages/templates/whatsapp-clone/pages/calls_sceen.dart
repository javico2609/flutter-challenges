import 'package:flutter/material.dart';
import 'package:playground_flutter/data/calls_data.dart';
import 'package:playground_flutter/models/call_model.dart';
import 'package:playground_flutter/pages/templates/whatsapp-clone/pages/call_details.dart';

class CallsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new ListView.builder(
      itemCount: calls.length,
      itemBuilder: (BuildContext context, int index) {
        final CallModel call = calls[index];

        return new Column(
          children: <Widget>[
            new Divider(
              height: index == 0 ? 5.0 : 10.0,
            ),
            new ListTile(
              leading: new CircleAvatar(
                foregroundColor: Theme.of(context).primaryColor,
                backgroundColor: Colors.grey,
                backgroundImage: new NetworkImage(call.avatar),
              ),
              title: new Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  new Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      new Text(
                        call.name,
                        style: new TextStyle(fontWeight: FontWeight.bold),
                      ),
                      new Container(
                        padding: EdgeInsets.only(top: 5.0),
                        child: new Row(
                          children: <Widget>[
                            new Icon(
                              Icons.call_received,
                              size: 20.0,
                              color: Theme.of(context).accentColor,
                            ),
                            new Text(
                              call.time,
                              style: new TextStyle(
                                  color: Colors.grey, fontSize: 15.0),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                  new Icon(
                    call.type == CallType.Call ? Icons.call : Icons.videocam,
                    color: Theme.of(context).primaryColor,
                  )
                ],
              ),
              onTap: () {
                Navigator.push(
                  context,
                  new MaterialPageRoute(
                    builder: (context) => new CallDetail(call: calls[index]),
                  ),
                );
              },
            )
          ],
        );
      },
    );
  }
}
