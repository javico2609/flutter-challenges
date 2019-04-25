import 'package:flutter/material.dart';
import 'package:playground_flutter/data/real_estate_data.dart';
import 'package:playground_flutter/models/real_estate_model.dart';
import 'package:playground_flutter/pages/templates/real-estate-clone/components/real-estate-bottom-bar.dart';

class RealEstateHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: ExactAssetImage(
                  "assets/images/map.png",
                ),
                fit: BoxFit.cover,
                colorFilter: new ColorFilter.mode(
                  Colors.white.withOpacity(0.7),
                  BlendMode.hardLight,
                ),
              ),
            ),
          ),
          _buildTopBar(),
          _buildBody(),
        ],
      ),
    );
  }

  Widget _buildTopBar() {
    return Builder(
      builder: (BuildContext context) {
        return Positioned(
          top: 30,
          width: MediaQuery.of(context).size.width,
          height: 70,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Text(
                      "Howdy",
                      style: TextStyle(fontSize: 20),
                    ),
                    SizedBox(width: 5),
                    Text(
                      "Macell",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                new CircleAvatar(
                  foregroundColor: Theme.of(context).primaryColor,
                  backgroundColor: Colors.grey,
                  backgroundImage: new NetworkImage(
                      "http://www.usanetwork.com/sites/usanetwork/files/styles/629x720/public/suits_cast_harvey.jpg?itok=fpTOeeBb"),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildBody() {
    return Builder(
      builder: (BuildContext context) {
        return Positioned(
          top: 90,
          child: Container(
            padding: EdgeInsets.all(16),
            height: MediaQuery.of(context).size.height - 100,
            width: MediaQuery.of(context).size.width,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  "Discover",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 35,
                  ),
                ),
                Text(
                  "Suitable Home",
                  style: TextStyle(
                    fontSize: 35,
                  ),
                ),
                SizedBox(height: 15),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                          color: Color(0xFFe2d7f5),
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(20),
                            bottomLeft: Radius.circular(20),
                            bottomRight: Radius.circular(20),
                          ),
                        ),
                        child: TextField(
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            prefixIcon: Icon(
                              Icons.search,
                              color: Color(0xff7645c7),
                            ),
                            hintText: 'Find a good home',
                            hintStyle: TextStyle(
                              color: Color(0xff7645c7),
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Container(
                      alignment: Alignment.centerRight,
                      width: 50,
                      child: Stack(
                        children: <Widget>[
                          Icon(
                            Icons.notifications_none,
                            color: Color(0xff7645c7),
                            size: 35,
                          ),
                          Positioned(
                            top: -1,
                            right: 2,
                            child: Container(
                              padding: EdgeInsets.all(4),
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Color(0xfffd8c00),
                              ),
                              child: Text(
                                '2',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 10,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
                SizedBox(height: 20),
                Expanded(
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: realEstatesResult.length,
                    itemBuilder: (BuildContext c, int index) {
                      final RealEstateModel item = realEstatesResult[index];
                      return Padding(
                        padding: const EdgeInsets.only(right: 20),
                        child: Stack(
                          children: <Widget>[
                            LayoutBuilder(
                              builder:
                                  (BuildContext c, BoxConstraints constraints) {
                                return Container(
                                  width:
                                      MediaQuery.of(context).size.width * .65,
                                  height: constraints.maxHeight - 20,
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                      image: NetworkImage(item.img),
                                      fit: BoxFit.cover,
                                      colorFilter: new ColorFilter.mode(
                                        Colors.black.withOpacity(0.2),
                                        BlendMode.hardLight,
                                      ),
                                    ),
                                    borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(35),
                                      bottomLeft: Radius.circular(35),
                                      bottomRight: Radius.circular(35),
                                    ),
                                  ),
                                );
                              },
                            ),
                            Positioned(
                              top: 15,
                              left: 15,
                              child: Container(
                                alignment: Alignment.center,
                                height: 55,
                                width: 55,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  border: Border.all(
                                    width: 2,
                                    color: Colors.white,
                                  ),
                                  color: Color(0xff7645c7),
                                ),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: <Widget>[
                                    Text(
                                      item.priceOff,
                                      style: TextStyle(
                                        color: Colors.white,
                                      ),
                                    ),
                                    Text(
                                      'Off',
                                      style: TextStyle(
                                        color: Colors.white,
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                            Positioned(
                              bottom: 0,
                              right: 10,
                              child: Container(
                                height: 45,
                                width: 45,
                                decoration: BoxDecoration(
                                  color: Color(0xfffd8b00),
                                  shape: BoxShape.circle,
                                ),
                                child: Icon(
                                  Icons.navigate_next,
                                  color: Colors.white,
                                  size: 40,
                                ),
                              ),
                            ),
                            Positioned(
                              bottom: 35,
                              left: 10,
                              width: MediaQuery.of(context).size.width * .65,
                              child: ListTile(
                                title: Text(
                                  item.name,
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20,
                                  ),
                                ),
                                subtitle: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: <Widget>[
                                    Icon(
                                      Icons.pin_drop,
                                      color: Colors.white,
                                      size: 18,
                                    ),
                                    Text(
                                      item.address,
                                      style: TextStyle(
                                        color: Colors.white,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
                RealEstateBottomBar(),
              ],
            ),
          ),
        );
      },
    );
  }
}
