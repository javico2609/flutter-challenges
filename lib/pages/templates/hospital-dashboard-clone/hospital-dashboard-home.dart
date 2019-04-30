import 'package:flutter/material.dart';
import 'package:playground_flutter/pages/templates/hospital-dashboard-clone/account.card.dart';
import 'package:playground_flutter/pages/templates/hospital-dashboard-clone/appointment.card.dart';
import 'package:playground_flutter/pages/templates/hospital-dashboard-clone/chart-painter.dart';

Color primaryColor = Color(0xff0074ff);

class HospitalDashboardHome extends StatelessWidget {
  const HospitalDashboardHome({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: _buildAppBar(),
      bottomNavigationBar: _buildBottomBar(),
      body: _buildBody(context),
    );
  }

  Widget _buildAppBar() {
    return AppBar(
      title: Text('Dashboard'),
      backgroundColor: primaryColor,
      elevation: 0,
      actions: <Widget>[
        Icon(Icons.notifications),
        Container(
          width: 50,
          alignment: Alignment.center,
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
              ),
            ],
          ),
        ),
        SizedBox(width: 10),
      ],
    );
  }

  Widget _buildBottomBar() {
    return BottomAppBar(
      elevation: 0,
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Icon(
              Icons.label_outline,
              size: 35,
              color: primaryColor,
            ),
            Icon(
              Icons.ac_unit,
              color: Colors.grey,
              size: 30,
            ),
            Icon(
              Icons.tune,
              size: 30,
              color: Colors.grey,
            ),
            Icon(
              Icons.perm_identity,
              color: Colors.grey,
              size: 30,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBody(BuildContext context) {
    return Column(
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
                      children: _buildChartLegend(context),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        Flexible(
          flex: 3,
          child: Container(
            color: Colors.white,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(10, 15, 10, 10),
              child: ListView(
                children: <Widget>[
                  Text(
                    "Appointments",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 10),
                  _buildCard(context, child: AppointmentCard()),
                  SizedBox(height: 20),
                  Text(
                    "Today (28 January)",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 10),
                  _buildCard(
                    context,
                    child: AccountCard(
                      name: 'Louisa Patel',
                      id: 'ID: AA741',
                      hour: '10:00 pm',
                      active: true,
                    ),
                  ),
                  SizedBox(height: 10),
                  _buildCard(
                    context,
                    child: AccountCard(
                      name: 'Sara Fuller',
                      id: 'ID: BA953',
                      hour: '11:00 pm',
                    ),
                  ),
                  SizedBox(height: 10),
                  _buildCard(
                    context,
                    child: AccountCard(
                      name: 'Javier Fuller',
                      id: 'ID: DD5666',
                      hour: '01:00 pm',
                    ),
                  ),
                  SizedBox(height: 10),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildCard(context, {Widget child}) {
    return Card(
      elevation: 2,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
      child: Container(
        height: 90,
        width: MediaQuery.of(context).size.width,
        child: child,
      ),
    );
  }

  List<Widget> _buildChartLegend(BuildContext context) {
    List<Widget> legend = [];
    int monthIndex = 0;
    for (double i = 1; i < 16.0; i++) {
      if (i % 2 != 0) {
        legend.add(
          Positioned(
            left: (i * 23) - 10,
            top: 10,
            child: Container(
              height: 30,
              child: Text(
                getMonth(monthIndex++),
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

  String getMonth(int index) {
    final months = ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug'];
    return months[index];
  }
}
