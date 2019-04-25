import 'package:flutter/material.dart';
import 'package:playground_flutter/models/real_estate_model.dart';

class RealEstateDetails extends StatelessWidget {
  final RealEstateModel item;

  const RealEstateDetails({Key key, this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Stack(
          children: <Widget>[
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * .44,
              decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage(item.img),
                  colorFilter: ColorFilter.mode(
                    Colors.black.withOpacity(0.2),
                    BlendMode.hardLight,
                  ),
                ),
              ),
            ),
            Positioned(
              width: MediaQuery.of(context).size.width,
              top: MediaQuery.of(context).size.height * .4 - 80,
              child: Padding(
                padding: const EdgeInsets.only(left: 30, right: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Icon(
                      Icons.rotate_90_degrees_ccw,
                      color: Colors.white,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        _buildIndicator(),
                        SizedBox(width: 5),
                        _buildIndicator(),
                        SizedBox(width: 5),
                        _buildIndicator(),
                      ],
                    )
                  ],
                ),
              ),
            ),
            Positioned(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * .6 + 50,
              top: MediaQuery.of(context).size.height * .4 - 50,
              child: Container(
                padding: const EdgeInsets.only(left: 30, right: 20, top: 30),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(80),
                  ),
                  color: Colors.white,
                ),
                child: Column(
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          "\$4,999",
                          style: TextStyle(
                            color: Color(0xff632bbf),
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Icon(
                          Icons.bookmark_border,
                          size: 35,
                        )
                      ],
                    ),
                    SizedBox(height: 10),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      child: Text(
                        item.name,
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    SizedBox(height: 15),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Container(
                          width: 100,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              _buildRow(),
                              _buildRow(),
                              _buildRow(),
                            ],
                          ),
                        ),
                        Text('1,200 sq.ft')
                      ],
                    ),
                    SizedBox(height: 15),
                    Divider(
                      color: Colors.grey,
                      height: 2,
                    ),
                    Spacer(),
                    Row(
                      children: <Widget>[
                        _buildExpandedBtn('Ask a Question'),
                        SizedBox(width: 10),
                        _buildExpandedBtn('Express Interest'),
                      ],
                    ),
                    SizedBox(height: 15),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildExpandedBtn(String msg) {
    return Expanded(
      child: Container(
        alignment: Alignment.center,
        height: 50,
        decoration: BoxDecoration(
          color: Color(0xFFe2d7f5),
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            bottomLeft: Radius.circular(20),
            bottomRight: Radius.circular(20),
          ),
        ),
        child: Text(
          msg,
          style: TextStyle(
            color: Color(0xff6732c1),
            fontSize: 18,
          ),
        ),
      ),
    );
  }

  Widget _buildRow() {
    return Row(
      children: <Widget>[
        Icon(
          Icons.shop,
          size: 12,
          color: Colors.grey,
        ),
        SizedBox(width: 2),
        Text('2')
      ],
    );
  }

  Widget _buildIndicator() {
    return Container(width: 20, height: 5, color: Colors.white);
  }
}
