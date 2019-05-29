import 'package:flutter/material.dart';
import 'package:playground_flutter/pages/templates/network-of-gas-stations-clone/animated-container.dart';

Color color1 = Color(0xff3f8abb);

class NetworkSlideItem extends StatelessWidget {
  final String title;
  final String msg;

  final IconData icon;

  const NetworkSlideItem({
    Key key,
    this.title,
    this.msg,
    this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      children: <Widget>[
        Flexible(
          flex: 9,
          child: LayoutBuilder(
            builder: (_, constraints) {
              return Stack(
                fit: StackFit.expand,
                children: <Widget>[
                  Positioned(
                    height: constraints.maxHeight,
                    width: constraints.maxWidth,
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                      child: NetworkAnimatedContainer(
                        waitTime: 240,
                        child: Image(
                          image: ExactAssetImage("assets/images/ng1.jpg"),
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    top: constraints.maxHeight * .8,
                    right: 20,
                    child: NetworkAnimatedContainer(
                      waitTime: 280,
                      child: Icon(
                        icon,
                        size: 100,
                        color: color1,
                      ),
                    ),
                  ),
                ],
              );
            },
          ),
        ),
        SizedBox(height: 20),
        Flexible(
          flex: 1,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              NetworkAnimatedContainer(
                waitTime: 200,
                child: Text(
                  title,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                  ),
                ),
              ),
              SizedBox(height: 10),
              Container(
                width: MediaQuery.of(context).size.width * .7,
                child: NetworkAnimatedContainer(
                  waitTime: 300,
                  child: Text(
                    msg,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 15,
                    ),
                  ),
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
