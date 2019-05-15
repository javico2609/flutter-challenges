import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:playground_flutter/data/sidemenu.dart';
import 'package:playground_flutter/models/menu_item.model.dart';

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Map<String, List<MenuModel>> items =
        groupBy<MenuModel, String>(menu, (MenuModel m) => m.type.toString());

    return Scaffold(
      drawer: new Drawer(
        child: new ListView(
          padding: const EdgeInsets.only(top: 0),
          children: <Widget>[
            UserAccountsDrawerHeader(
              accountEmail: Text('@javico_glez'),
              accountName: Text("Javier González Rodríguez"),
              currentAccountPicture: CircleAvatar(
                backgroundImage: ExactAssetImage("assets/images/myAvatar.png"),
                backgroundColor: Colors.transparent,
              ),
              margin: const EdgeInsets.only(bottom: 0),
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
                ),
              ),
            ),
            ..._buildSection(
              context: context,
              items: items[MenuItemType.COMPONENT.toString()] ?? [],
              type: "Components",
            ),
            ..._buildSection(
              context: context,
              items: items[MenuItemType.TEMPLATE.toString()] ?? [],
              type: "Templates",
            ),
            ..._buildSection(
              context: context,
              items: items[MenuItemType.CODE.toString()] ?? [],
              type: "CodeExample",
            ),
          ],
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
          ),
        ),
      ),
    );
  }

  List<Widget> _buildSection(
      {BuildContext context, String type, List<MenuModel> items}) {
    return [
      Padding(
        padding: const EdgeInsets.only(
          top: 10,
          left: 10,
          right: 10,
        ),
        child: Container(
          height: 40,
          color: Colors.blueGrey,
          alignment: Alignment.center,
          child: Text(
            type,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.white,
              fontSize: 25,
            ),
          ),
        ),
      ),
      ...items.map((item) => _buildItem(item, context))
    ];
  }

  Widget _buildItem(MenuModel item, context) {
    return new ListTile(
      title: new Text(item.title),
      leading: new Icon(item.icon),
      onTap: () {
        Navigator.pop(context);
        if (item.isRoot) {
          Navigator.pushReplacementNamed(context, item.route);
        } else {
          Navigator.pushNamed(context, item.route);
        }
      },
    );
  }
}
