import 'package:flutter/material.dart';
import 'package:playground_flutter/data/furniture_data.dart';
import 'package:playground_flutter/pages/templates/furniture-clone/furniture-category-item.dart';
import 'package:playground_flutter/pages/templates/furniture-clone/furniture-content-section.dart';

Color primaryColor = Color(0xffdc2f2e);

class FurnitureHome extends StatelessWidget {
  const FurnitureHome({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      bottomNavigationBar: _buildBottomBar(),
      body: _buildBody(height, width),
    );
  }

  Widget _buildBottomBar() {
    return BottomAppBar(
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Icon(
              Icons.home,
              size: 35,
              color: primaryColor,
            ),
            Icon(
              Icons.adjust,
              color: Colors.black54,
              size: 30,
            ),
            Icon(
              Icons.shopping_cart,
              size: 30,
              color: Colors.black54,
            ),
            Icon(
              Icons.message,
              color: Colors.black54,
              size: 30,
            ),
            Icon(
              Icons.perm_identity,
              color: Colors.black54,
              size: 30,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildAppBar(height, width) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              "Hello, Marshall",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.white,
                fontSize: 18,
              ),
            ),
            SizedBox(height: 5),
            Text(
              "Want to buy unique furniture ?",
              style: TextStyle(
                color: Colors.white70,
                fontSize: 16,
              ),
            ),
          ],
        ),
        Container(
          width: 60,
          alignment: Alignment.centerLeft,
          child: Stack(
            children: <Widget>[
              Container(
                width: 45,
                height: 45,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white,
                ),
                child: Icon(
                  Icons.notifications_none,
                  color: Colors.black87,
                  size: 28,
                ),
              ),
              Positioned(
                top: 0,
                right: 2,
                child: Container(
                  width: 12,
                  height: 12,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: primaryColor,
                    border: Border.all(color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildBody(height, width) {
    return Container(
      height: height,
      width: width,
      color: Colors.white,
      child: Stack(
        children: <Widget>[
          Positioned(
            top: 0,
            width: width,
            height: height * .35,
            child: Container(
              color: primaryColor,
              padding: EdgeInsets.only(left: 20),
              child: SafeArea(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    SizedBox(height: 15),
                    _buildAppBar(height, width),
                    SizedBox(height: 30),
                    Container(
                      width: width - 40,
                      height: 40,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: TextField(
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          enabledBorder: InputBorder.none,
                          focusedBorder: InputBorder.none,
                          prefixIcon: Icon(
                            Icons.search,
                            color: Colors.black87,
                          ),
                          hintText: 'Search unique furniture now...',
                        ),
                      ),
                    ),
                    SizedBox(height: 30),
                    Text(
                      "Categories",
                      style: TextStyle(
                        fontSize: 19,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
          _buildCategoriesSection(height, width),
          _buildContent(height, width),
        ],
      ),
    );
  }

  Widget _buildContent(height, width) {
    return Positioned(
      top: (height * .35) + 50,
      width: width,
      height: height - (height * .35) + 50,
      child: LayoutBuilder(
        builder: (BuildContext c, BoxConstraints constraints) {
          final List<Widget> items = [];
          furnitureResult.forEach((item) {
            items.add(
              FurnitureContentSection(
                width: constraints.maxWidth,
                height: constraints.maxHeight * .50,
                isLargeImg: item.price == "3500",
              ),
            );
          });

          items.add(SizedBox(
            height: constraints.maxHeight / 3,
          ));

          return ListView(
            padding: EdgeInsets.only(left: 20),
            children: items,
          );
        },
      ),
    );
  }

  Widget _buildCategoriesSection(height, width) {
    return Positioned(
      width: width,
      height: 100,
      top: (height * .35) - 45,
      child: ListView(
        padding: EdgeInsets.only(left: 20),
        scrollDirection: Axis.horizontal,
        children: List.generate(
          10,
          (int index) =>
              FurnitureCategoryItem(newItemCount: index % 3 == 0 ? 40 : 0),
        ).toList(),
      ),
    );
  }
}
