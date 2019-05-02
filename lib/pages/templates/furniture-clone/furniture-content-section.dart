import 'package:flutter/material.dart';
import 'package:playground_flutter/data/furniture_data.dart';

class FurnitureContentSection extends StatelessWidget {
  final double height;
  final double width;
  final bool isLargeImg;

  const FurnitureContentSection(
      {Key key, this.width, this.height, this.isLargeImg = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      child: Column(
        children: <Widget>[
          SizedBox(height: 15),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Text(
                "Featured Product Packs",
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 10),
                child: Icon(
                  Icons.arrow_forward,
                  size: 28,
                ),
              ),
            ],
          ),
          SizedBox(height: 15),
          Expanded(
            child: LayoutBuilder(
              builder: (BuildContext c, BoxConstraints constr) {
                return Container(
                  width: constr.maxWidth,
                  height: constr.maxHeight,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: furnitureResult.map(
                      (item) {
                        return Padding(
                          padding: const EdgeInsets.only(right: 15),
                          child: Container(
                            width: isLargeImg
                                ? constr.maxWidth * .8
                                : constr.maxWidth * .6,
                            height: constr.maxHeight,
                            color: Colors.white,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: <Widget>[
                                Container(
                                  height: constr.maxHeight * .65,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5),
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
                                SizedBox(height: 10),
                                Text(
                                  item.name,
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18,
                                  ),
                                ),
                                Text(
                                  item.description,
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.grey,
                                  ),
                                ),
                                Row(
                                  children: <Widget>[
                                    Text(
                                      "\$${item.price}",
                                      style: TextStyle(
                                        color: Colors.grey,
                                        decoration: TextDecoration.lineThrough,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    SizedBox(width: 10),
                                    Text(
                                      "\$${item.priceOff}",
                                      style: TextStyle(
                                        color: Colors.red,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 19,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ).toList(),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
