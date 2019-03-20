import 'package:flutter/material.dart';

class StatusScreen extends StatelessWidget {
  Widget _buildStatusItem(context) {
    return ListTile(
      leading: Stack(
        children: <Widget>[
          new CircleAvatar(
            foregroundColor: Theme.of(context).primaryColor,
            backgroundColor: Colors.grey,
            backgroundImage: new NetworkImage(
                "http://www.usanetwork.com/sites/usanetwork/files/styles/629x720/public/suits_cast_harvey.jpg?itok=fpTOeeBb"),
          ),
          Container(
            alignment: AlignmentDirectional.bottomEnd,
            width: 42,
            height: 42,
            child: Container(
              width: 15.0,
              height: 15.0,
              child: new RawMaterialButton(
                onPressed: () {},
                child: new Icon(
                  Icons.add,
                  color: Colors.white,
                  size: 15.0,
                ),
                shape: new CircleBorder(),
                elevation: 2.0,
                fillColor: Theme.of(context).accentColor,
              ),
            ),
          ),
        ],
      ),
      title: Text(
        "My Status",
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
      subtitle: Text(
        "Add new update",
        style: TextStyle(color: Colors.grey, fontSize: 14.0),
      ),
    );
  }

  Widget _buildSection(String name) {
    return Container(
      height: 30.0,
      alignment: AlignmentDirectional.centerStart,
      decoration: BoxDecoration(
        color: Colors.grey[200],
        border: Border(
          top: BorderSide(
            color: Colors.grey,
            width: 0.1,
          ),
        ),
      ),
      child: Padding(
        padding: EdgeInsets.only(left: 15.0),
        child: Text(
          name,
          style: TextStyle(
            fontSize: 15,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        Divider(height: 5.0),
        _buildStatusItem(context),
        _buildSection("Recently"),
        ListTile(
          leading: new CircleAvatar(
            foregroundColor: Theme.of(context).primaryColor,
            backgroundColor: Colors.grey,
            backgroundImage: new NetworkImage(
                "https://heavyeditorial.files.wordpress.com/2017/07/jessica-johnson-5.jpg?w=531&quality=65&strip=all&h=531"),
          ),
          title: Text("Daynelis Cruz",
              style: new TextStyle(fontWeight: FontWeight.bold)),
          subtitle: Text("Today: 12.55 PM"),
        ),
        _buildSection("Videos"),
      ],
    );
  }
}
