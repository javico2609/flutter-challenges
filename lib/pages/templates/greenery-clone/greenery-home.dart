import 'package:flutter/material.dart';
import 'package:playground_flutter/pages/templates/greenery-clone/greenery-details.dart';

class GreeneryHome extends StatefulWidget {
  @override
  _GreeneryHomeState createState() => _GreeneryHomeState();
}

var greenColor = Color(0xff32a05f);
var darkGreenColor = Color(0xff279152);
var productImage =
    'https://i.pinimg.com/originals/8f/bf/44/8fbf441fa92b29ebd0f324effbd4e616.png';

class _GreeneryHomeState extends State<GreeneryHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: greenColor,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          buildTop(),
          Expanded(
            flex: 1,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 35),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  SizedBox(height: 15),
                  Text(
                    "Planting",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                    ),
                  ),
                  Spacer(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      buildCardDetail(context, "250", "ml", "water"),
                      buildCardDetail(context, "18", "ºC", "Sunshine"),
                    ],
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  Container buildCardDetail(
      BuildContext context, String value, String unit, String unitName) {
    return Container(
      height: 90,
      width: MediaQuery.of(context).size.width / 2 - 50,
      decoration: BoxDecoration(
        color: darkGreenColor,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.baseline,
            textBaseline: TextBaseline.alphabetic,
            children: <Widget>[
              Text(
                value,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(width: 5),
              Text(
                unit,
                style: TextStyle(
                  color: Colors.white70,
                ),
              )
            ],
          ),
          Text(
            unitName,
            style: TextStyle(
              color: Colors.white70,
            ),
          )
        ],
      ),
    );
  }

  Widget buildTop() {
    return Expanded(
      flex: 4,
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(110),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 35),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                width: 300,
                child: Text(
                  "Fiddle Leaf Fig Topiary",
                  style: TextStyle(
                    fontSize: 35,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(height: 10),
              Text(
                '10" Nursery Pot',
                style: TextStyle(
                  color: Colors.black54,
                ),
              ),
              SizedBox(height: 10),
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(bottom: 3),
                    child: Text(
                      "\$",
                      style: TextStyle(
                        color: greenColor,
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  SizedBox(width: 5),
                  Text(
                    "85",
                    style: TextStyle(
                      color: greenColor,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              const Spacer(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(bottom: 10),
                    child: FloatingActionButton(
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: ((c) => GreeneryDetailsPage()),
                        ));
                      },
                      backgroundColor: greenColor,
                      child: Icon(Icons.shopping_cart),
                    ),
                  ),
                  Container(
                    alignment: Alignment.bottomCenter,
                    width: 230,
                    child: Image.network(
                      productImage,
                      fit: BoxFit.fill,
                      alignment: Alignment.bottomCenter,
                    ),
                  )
                ],
              ),
              SizedBox(height: 35),
            ],
          ),
        ),
      ),
    );
  }
}
