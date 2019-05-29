import 'package:flutter/material.dart';
import 'package:playground_flutter/pages/templates/network-of-gas-stations-clone/animated-container.dart';

Color color1 = Color(0xff3f8abb);

class NetworkGasHome extends StatefulWidget {
  const NetworkGasHome({Key key}) : super(key: key);

  @override
  _NetworkGasHomeState createState() => _NetworkGasHomeState();
}

class _NetworkGasHomeState extends State<NetworkGasHome>
    with SingleTickerProviderStateMixin {
  int _indexActive = 0;
  AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 1),
    );
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        height: size.height,
        width: size.width,
        child: Stack(
          children: <Widget>[
            Column(
              children: <Widget>[
                Container(
                  height: size.height * .3,
                  color: Color(0xfff6f6f6),
                  alignment: Alignment.center,
                  child: _buildTop(size),
                ),
                Container(
                  height: size.height * .7,
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: ListView(
                        children: List.generate(10, (_) {
                      return NetworkAnimatedContainer(
                        controller: _controller,
                        waitTime: 200,
                        child: ListTile(
                          leading: Icon(
                            Icons.local_gas_station,
                            color: color1,
                          ),
                          title: Text("Order Nº 454"),
                          subtitle: Text("id: 13236448"),
                        ),
                      );
                    }).toList()),
                  ),
                )
              ],
            ),
            Positioned(
              height: 50,
              width: size.width,
              top: (size.height * .3) - 25,
              child: Padding(
                padding: const EdgeInsets.only(right: 20, left: 20),
                child: Card(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Expanded(
                        child: InkWell(
                          onTap: () {
                            setState(() {
                              _indexActive = 0;
                              _controller.reset();
                              _controller.forward();
                            });
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              Icon(
                                Icons.timer,
                                color: _indexActive == 0 ? color1 : Colors.grey,
                              ),
                              SizedBox(width: 10),
                              Text(
                                "History",
                                style: TextStyle(
                                  fontSize: 16,
                                  color:
                                      _indexActive == 0 ? color1 : Colors.grey,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                          top: 2,
                          bottom: 2,
                        ),
                        child: VerticalDivider(
                          width: 2,
                          color: Colors.grey,
                        ),
                      ),
                      Expanded(
                        child: InkWell(
                          onTap: () {
                            setState(() {
                              _indexActive = 1;
                              _controller.reset();
                              _controller.forward();
                            });
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              Icon(
                                Icons.credit_card,
                                color: _indexActive == 1 ? color1 : Colors.grey,
                              ),
                              SizedBox(width: 10),
                              Text(
                                "Credit cards",
                                style: TextStyle(
                                  fontSize: 16,
                                  color:
                                      _indexActive == 1 ? color1 : Colors.grey,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTop(Size size) {
    return _indexActive == 0
        ? NetworkAnimatedContainer(
            waitTime: 200,
            controller: _controller,
            child: Container(
              width: size.width * .9,
              height: size.height * .3,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: ExactAssetImage("assets/images/gas.png"),
                  fit: BoxFit.contain,
                ),
              ),
            ),
          )
        : NetworkAnimatedContainer(
            controller: _controller,
            waitTime: 200,
            child: Container(
              width: size.width * .9,
              height: size.height * .25,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: ExactAssetImage("assets/images/gas2.png"),
                  fit: BoxFit.contain,
                ),
              ),
            ),
          );
  }
}
