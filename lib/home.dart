import 'package:flutter/material.dart';
import 'package:playground_flutter/data/sidemenu.dart';

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: new Drawer(
        child: new ListView.builder(
          itemCount: menu.length,
          itemBuilder: (BuildContext context, int index) => new ListTile(
                title: new Text(menu[index].title),
                trailing: new Icon(menu[index].icon),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.pushReplacementNamed(context, menu[index].route);
                },
              ),
        ),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Stack(
          children: <Widget>[
            Positioned(
              top: 30,
              left: 10,
              child: Builder(
                builder: (BuildContext c) => IconButton(
                      icon: Icon(
                        Icons.menu,
                        size: 30,
                        color: Colors.white,
                      ),
                      onPressed: () => Scaffold.of(c).openDrawer(),
                    ),
              ),
            ),
            Center(
              child: Text(
                "Flutter Challenges and Components",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 30,
                ),
              ),
            )
          ],
        ),
        decoration: BoxDecoration(
            gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            // Colors are easy thanks to Flutter's Colors class.
            Colors.blue[800],
            Colors.blue[700],
            Colors.blue[600],
            Colors.blue[400],
            Colors.blue[300],
          ],
        )),
      ),
    );
  }
}
