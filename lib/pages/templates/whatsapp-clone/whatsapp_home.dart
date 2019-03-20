import 'package:flutter/material.dart';
import 'package:playground_flutter/bloc/theme.bloc.dart';
import 'package:playground_flutter/configs/themes.dart';
import './pages/calls_sceen.dart';
import './pages/camera_sceen.dart';
import './pages/chats_sceen.dart';
import './pages/status_sceen.dart';

class WhatsAppHome extends StatefulWidget {
  @override
  _WhatsAppHomeState createState() => _WhatsAppHomeState();
}

class _WhatsAppHomeState extends State<WhatsAppHome>
    with SingleTickerProviderStateMixin {
  TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = new TabController(vsync: this, initialIndex: 1, length: 4);
    _tabController.addListener(_handleTabIndex);
    themeBloc.changeTheme(Themes.whapsapp);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: new AppBar(
          title: new Text("WhatsApp"),
          elevation: 0.7,
          backgroundColor:  new Color(0xff075E54),
          bottom: new TabBar(
            controller: _tabController,
            indicatorColor: Colors.white,
            tabs: <Widget>[
              new Tab(icon: new Icon(Icons.camera_alt)),
              new Tab(text: "CHATS"),
              new Tab(text: "STATUS"),
              new Tab(text: "CALLS"),
            ],
          ),
          actions: <Widget>[
            new Icon(Icons.search),
            new Padding(
              padding: EdgeInsets.symmetric(horizontal: 5.0),
            ),
            new Icon(Icons.more_vert),
          ],
        ),
        body: new TabBarView(
          controller: _tabController,
          children: <Widget>[
            new CameraScreen(),
            new ChatsScreen(),
            new StatusScreen(),
            new CallsScreen(),
          ],
        ),
        floatingActionButton: _bottomButtons());
  }

  void _handleTabIndex() {
    setState(() {});
  }

  Widget _bottomButtons() {
    switch (_tabController.index) {
      case 1:
        {
          return new FloatingActionButton(
            backgroundColor: new Color(0xff25D366),
            child: new Icon(Icons.message, color: Colors.white),
            onPressed: () => print('Hola!!'),
          );
        }
      case 2:
        {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(bottom: 10.0),
                child: new FloatingActionButton(
                  backgroundColor: Colors.grey[200],
                  child: new Icon(
                    Icons.edit,
                    color: Colors.black,
                  ),
                  onPressed: () => print('Hola!!'),
                ),
              ),
              new FloatingActionButton(
                backgroundColor: new Color(0xff25D366),
                child: new Icon(
                  Icons.camera_alt,
                  color: Colors.white,
                ),
                onPressed: () => print('Hola!!'),
              ),
            ],
          );
        }
      case 3:
        {
          return new FloatingActionButton(
            backgroundColor: new Color(0xff25D366),
            child: new Icon(Icons.add_call, color: Colors.white),
            onPressed: () => print('Hola!!'),
          );
        }
      default:
        return null;
    }
  }

  @override
  void dispose() {
    _tabController.removeListener(_handleTabIndex);
    _tabController.dispose();
    themeBloc.changeTheme(Themes.light);
    super.dispose();
  }
}
