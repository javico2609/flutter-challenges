import 'package:flutter/material.dart';

Color textColor = new Color(0xffa8b6c2);

Widget buildDetailInfo(
    {String title1, String value1, String title2, String value2}) {
  return Padding(
    padding: const EdgeInsets.only(
      top: 10,
      bottom: 10,
    ),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        buildDetailInfoItem(title1, value1),
        buildDetailInfoItem(title2, value2),
      ],
    ),
  );
}

Widget buildDetailInfoItem(String title1, String value1) {
  return Expanded(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          title1,
          style: TextStyle(
            color: textColor,
            fontSize: 16,
          ),
        ),
        SizedBox(height: 5),
        Text(
          value1,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    ),
  );
}
