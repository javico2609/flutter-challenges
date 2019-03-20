import 'package:flutter/material.dart';
import 'package:playground_flutter/data/chats_data.dart';
import 'package:playground_flutter/models/chat_model.dart';

class ChatsScreen extends StatefulWidget {
  @override
  ChatsScreenState createState() {
    return new ChatsScreenState();
  }
}

class ChatsScreenState extends State<ChatsScreen> {
  @override
  Widget build(BuildContext context) {
    return new ListView.builder(
      itemCount: chats.length,
      itemBuilder: (BuildContext context, int index) {
        final ChatModel msg = chats[index];

        return new Column(
          children: <Widget>[
            new Divider(
              height: index == 0 ? 5.0 : 10.0,
            ),
            new ListTile(
              leading: new CircleAvatar(
                foregroundColor: Theme.of(context).primaryColor,
                backgroundColor: Colors.grey,
                backgroundImage: new NetworkImage(msg.avatar),
              ),
              title: new Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  new Text(
                    msg.name,
                    style: new TextStyle(fontWeight: FontWeight.bold),
                  ),
                  new Text(
                    msg.time,
                    style: new TextStyle(color: Colors.grey, fontSize: 14.0),
                  ),
                ],
              ),
              subtitle: new Container(
                padding: EdgeInsets.only(top: 5.0),
                child: new Text(
                  msg.message,
                  style: new TextStyle(color: Colors.grey, fontSize: 15.0),
                ),
              ),
            )
          ],
        );
      },
    );
  }
}
