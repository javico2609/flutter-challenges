import 'package:flutter/material.dart';
import 'package:playground_flutter/data/sidemenu.dart';

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter Demo'),
      ),
      drawer: new Drawer(
        child: new ListView.builder(
          itemCount: menu.length,
          itemBuilder: (BuildContext context, int index) => new ListTile(
                title: new Text(menu[index].title),
                trailing: new Icon(menu[index].icon),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.pushNamed(context, menu[index].route);
                },
              ),
        ),
      ),
    );
  }
}
