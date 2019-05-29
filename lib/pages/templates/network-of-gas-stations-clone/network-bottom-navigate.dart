import 'package:flutter/material.dart';

Color color1 = Color(0xff3f8abb);

class NetworkBottomNavigate extends StatefulWidget {
  final PageController pageController;

  const NetworkBottomNavigate({Key key, this.pageController}) : super(key: key);

  @override
  _NetworkBottomNavigateState createState() => _NetworkBottomNavigateState();
}

class _NetworkBottomNavigateState extends State<NetworkBottomNavigate> {
  int _page = 0;

  @override
  void initState() {
    widget.pageController.addListener(() {
      setState(() {
        _page = widget.pageController.page.round();
      });
    });

    super.initState();
  }

  _next() {
    widget.pageController.nextPage(
      duration: Duration(milliseconds: 200),
      curve: Curves.easeInOut,
    );
  }

  _back() {
    widget.pageController.previousPage(
      duration: Duration(milliseconds: 200),
      curve: Curves.easeInOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Flexible(
              flex: 1,
              child: _buildNavigateAction(
                icon: RotatedBox(
                  quarterTurns: 6,
                  child: Icon(
                    Icons.play_arrow,
                    color: Colors.white,
                    size: 15,
                  ),
                ),
                show: _page != 0,
                onTap: _back,
              ),
            ),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Container(
                    height: 5,
                    width: 35,
                    decoration: BoxDecoration(
                      color: _page == 0 ? color1 : Colors.grey,
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  Container(
                    height: 5,
                    width: 35,
                    decoration: BoxDecoration(
                      color: _page == 1 ? color1 : Colors.grey,
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  Container(
                    height: 5,
                    width: 35,
                    decoration: BoxDecoration(
                      color: _page == 2 ? color1 : Colors.grey,
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ],
              ),
            ),
            Flexible(
              flex: 1,
              child: _buildNavigateAction(
                icon: Icon(
                  Icons.play_arrow,
                  color: Colors.white,
                  size: 15,
                ),
                show: _page != 2,
                onTap: _next,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildNavigateAction({Widget icon, bool show, Function onTap}) {
    if (!show) {
      return Container(
        width: 30,
        height: 30,
      );
    }

    return InkWell(
      borderRadius: BorderRadius.circular(20),
      onTap: onTap,
      child: Container(
        width: 30,
        height: 30,
        alignment: Alignment.center,
        child: icon,
        decoration: BoxDecoration(
          color: color1,
          borderRadius: BorderRadius.circular(20),
        ),
      ),
    );
  }
}
