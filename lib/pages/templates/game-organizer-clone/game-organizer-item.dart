import 'package:flutter/material.dart';
import 'package:playground_flutter/models/game_organizer_model.dart';
import 'package:playground_flutter/pages/templates/game-organizer-clone/line-painter.dart';

import 'game-organizer-helper.dart';

Color color = new Color(0xff00b965);
Color textColor = new Color(0xffa8b6c2);

class GameOrganizerItem extends StatelessWidget {
  final GameOrganizerModelModel item;
  final bool showDetail;

  GameOrganizerItem({Key key, this.item, this.showDetail = true})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return Column(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.fromLTRB(16, 16, 16, 10),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Container(
                height: 50,
                width: 50,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: item.color.withOpacity(0.16),
                ),
                child: Icon(
                  item.icon,
                  color: item.color,
                  size: 28,
                ),
              ),
              SizedBox(width: 10),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      item.name,
                      style: TextStyle(
                        fontSize: 19,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    SizedBox(height: 5),
                    Text(
                      item.date,
                      style: TextStyle(
                        fontSize: 15,
                        color: textColor,
                      ),
                    )
                  ],
                ),
              ),
              Container(
                alignment: Alignment.centerRight,
                width: 70,
                child: Text(
                  item.hour,
                  style: TextStyle(
                    fontSize: 23,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            ],
          ),
        ),
        Visibility(
          visible: showDetail,
          child: Container(
            width: width,
            height: 20,
            child: CustomPaint(
              foregroundPainter: LinePainter(),
            ),
          ),
        ),
        Visibility(
          visible: showDetail,
          child: Expanded(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  buildDetailInfo(
                    title1: "Country",
                    value1: item.country,
                    title2: "City",
                    value2: item.city,
                  ),
                  buildDetailInfo(
                    title1: "Players with yes:",
                    value1: item.playersWithYes.toString(),
                    title2: "Players with Maybe:",
                    value2: item.playersWithMaybe.toString(),
                  ),
                  buildDetailInfoItem(
                    "Players with no:",
                    item.playersWithNo.toString(),
                  ),
                  SizedBox(height: 5),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
