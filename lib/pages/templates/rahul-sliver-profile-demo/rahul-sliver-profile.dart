import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:playground_flutter/bloc/theme.bloc.dart';
import 'package:playground_flutter/configs/themes.dart';
import 'package:playground_flutter/pages/templates/rahul-sliver-profile-demo/rahul-profile-detail-panel.dart';
import 'package:video_player/video_player.dart';

class RahulSliverProfile extends StatefulWidget {
  const RahulSliverProfile({Key key}) : super(key: key);

  @override
  _RahulSliverProfileState createState() => _RahulSliverProfileState();
}

class _RahulSliverProfileState extends State<RahulSliverProfile> {
  VideoPlayerController playerController;
  VoidCallback listener;

  @override
  void initState() {
    super.initState();
    themeBloc.changeTheme(Themes.sliverProfile);
    playerController = VideoPlayerController.asset(
        'assets/videos/SampleVideo_1280x720_1mb.mp4')
      ..initialize().then((_) {
        // Ensure the first frame is shown after the video is initialized, even before the play button has been pressed.
        setState(() {});
      });

    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await Future.delayed(Duration(seconds: 2));
      await playerController.play();
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      bottomNavigationBar: _buildBottomBar(),
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            elevation: 0,
            backgroundColor: Colors.white,
            pinned: true,
            floating: false,
            snap: false,
            leading: Icon(
              Icons.group_add,
              color: Colors.black,
            ),
            centerTitle: true,
            title: Text(
              'Knight Owl',
              style: TextStyle(
                color: Colors.black,
              ),
            ),
            actions: <Widget>[
              Icon(
                Icons.menu,
                color: Colors.black,
              ),
              Icon(
                Icons.more_vert,
                color: Colors.black,
              ),
              SizedBox(width: 10),
            ],
          ),
          SliverPersistentHeader(
            delegate: CustomSliverDelegate(
              expandedHeight: (size.height * .4) - kToolbarHeight,
              child: RahulProfileDetail(),
            ),
          ),
          SliverPersistentHeader(
            delegate: CustomSliverDelegate(
              expandedHeight: kToolbarHeight,
              child: Container(
                color: Colors.white,
                height: kToolbarHeight,
                child: Padding(
                  padding: const EdgeInsets.only(
                    left: 50,
                    right: 50,
                    top: 10,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Icon(Icons.menu),
                      Icon(Icons.favorite),
                    ],
                  ),
                ),
              ),
            ),
            pinned: true,
          ),
          SliverList(
            delegate: SliverChildListDelegate([
              ...List.generate(10, (_) {
                return Row(
                  children: <Widget>[
                    _buildItem(EdgeInsets.only(right: 1)),
                    _buildItem(),
                    _buildItem(EdgeInsets.only(left: 1, top: 1))
                  ],
                );
              }).toList()
            ]),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    playerController.dispose();
  }

  Widget _buildItem([EdgeInsetsGeometry margin]) {
    return Expanded(
      child: Container(
        margin: margin,
        height: 200,
        alignment: Alignment.center,
        child: VideoPlayer(playerController),
      ),
    );
  }

  Widget _buildBottomBar() {
    return new BottomAppBar(
      child: new Container(
        height: 50.0,
        color: Colors.white,
        child: new Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            new Icon(Icons.home, size: 30.0),
            new Icon(Icons.search, size: 30.0),
            new Icon(Icons.add, size: 30.0),
            new Icon(Icons.chat_bubble, size: 30.0),
            new Icon(Icons.account_circle, size: 30.0),
          ],
        ),
      ),
    );
  }
}

class CustomSliverDelegate extends SliverPersistentHeaderDelegate {
  final double expandedHeight;
  final Widget child;

  CustomSliverDelegate({
    @required this.expandedHeight,
    @required this.child,
  });

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return child;
  }

  @override
  double get maxExtent => expandedHeight;

  @override
  double get minExtent => expandedHeight;

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) {
    return true;
  }
}
