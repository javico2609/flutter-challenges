import 'package:flutter/material.dart';
import 'package:playground_flutter/pages/templates/hospital-dashboard-clone/chart-painter.dart';

Color primaryColor = Color(0xff0074ff);

class HospitalDashboardHome extends StatelessWidget {
  const HospitalDashboardHome({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Dashboard'),
        backgroundColor: primaryColor,
        elevation: 0,
        actions: <Widget>[
          Icon(Icons.notifications),
          Container(
            alignment: Alignment.center,
            width: 50,
            child: Stack(
              children: <Widget>[
                Container(
                  width: 35,
                  height: 35,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.grey,
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: NetworkImage(
                          "http://www.usanetwork.com/sites/usanetwork/files/styles/629x720/public/suits_cast_harvey.jpg?itok=fpTOeeBb"),
                    ),
                  ),
                ),
                Positioned(
                  bottom: 0,
                  right: 2,
                  child: Container(
                    width: 10,
                    height: 10,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Color(0xff00ff1d),
                    ),
                  ),
                )
              ],
            ),
          ),
          SizedBox(width: 10),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Flexible(
            flex: 2,
            child: Container(
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                color: primaryColor,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(40),
                  bottomRight: Radius.circular(40),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.fromLTRB(20, 0, 20, 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      width: 100,
                      height: 30,
                      decoration: BoxDecoration(
                        color: Color(0xff4d9eff),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            "Monthly",
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                          Icon(
                            Icons.arrow_drop_down_circle,
                            color: Colors.white,
                            size: 20,
                          )
                        ],
                      ),
                    ),
                    SizedBox(height: 15),
                    Expanded(
                      child: CustomPaint(
                        foregroundPainter: ChartPainter(),
                      ),
                    ),
                    Container(
                        height: 30,
                        width: MediaQuery.of(context).size.width,
                        child: Stack(
                          children: buildChartBotton(context),
                        ))
                  ],
                ),
              ),
            ),
          ),
          Flexible(
            flex: 3,
            child: Container(
              color: Colors.white,
            ),
          )
        ],
      ),
    );
  }

  List<Widget> buildChartBotton(BuildContext context) {
    List<Widget> legend = [];

    for (double i = 1; i < 16.0; i++) {
      if (i % 2 != 0) {
        legend.add(
          Positioned(
            left: (i * 23) - 14,
            top: 10,
            child: Container(
              height: 30,
              child: Text(
                "month",
                style: TextStyle(
                  fontSize: 12,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        );
      }
    }

    return legend.toList();
  }
}
