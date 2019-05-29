import 'package:flutter/material.dart';
import 'package:playground_flutter/bloc/theme.bloc.dart';
import 'package:playground_flutter/configs/themes.dart';
import 'package:playground_flutter/pages/templates/network-of-gas-stations-clone/network-bottom-navigate.dart';
import 'package:playground_flutter/pages/templates/network-of-gas-stations-clone/network-gas-home.dart';
import 'package:playground_flutter/pages/templates/network-of-gas-stations-clone/network-slide-item.dart';

Color color1 = Color(0xff3f8abb);

class NetworkGasStationHome extends StatefulWidget {
  const NetworkGasStationHome({Key key}) : super(key: key);

  @override
  _NetworkGasStationHomeState createState() => _NetworkGasStationHomeState();
}

class _NetworkGasStationHomeState extends State<NetworkGasStationHome> {
  PageController _pageController;

  @override
  void initState() {
    themeBloc.changeTheme(Themes.networkGas);
    _pageController = PageController(
      initialPage: 0,
    );

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Container(
              alignment: Alignment.centerRight,
              padding: const EdgeInsets.only(right: 20),
              child: InkWell(
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (_) => NetworkGasHome(),
                    ),
                  );
                },
                child: Text("Skip"),
              ),
            ),
            Flexible(
              flex: 9,
              child: PageView(
                controller: _pageController,
                children: <Widget>[
                  Container(
                    child: NetworkSlideItem(
                      title: "The location of the vehicle",
                      msg:
                          "Call mobile refills using the geolocation of your location",
                      icon: Icons.location_on,
                    ),
                  ),
                  Container(
                    child: NetworkSlideItem(
                      title: "Payment online",
                      msg: "Online Payment directly from your mobile phone",
                      icon: Icons.attach_money,
                    ),
                  ),
                  Container(
                    child: NetworkSlideItem(
                      title: "Filling the car",
                      msg: "Is carried out without your participation",
                      icon: Icons.vpn_key,
                    ),
                  ),
                ],
              ),
            ),
            Flexible(
              flex: 1,
              child: NetworkBottomNavigate(
                pageController: _pageController,
              ),
            )
          ],
        ),
      ),
    );
  }
}
