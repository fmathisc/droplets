import 'package:flutter/material.dart';

class TextHistoricWidget extends StatelessWidget {
  String date;
  String name;
  String hour;
  TextHistoricWidget(this.name, this.date, this.hour);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          child: Text(
          "${name}",
          style: TextStyle(
            color: Color(0xFF267DAE),
            fontWeight: FontWeight.bold,
            fontFamily: 'Roboto',
            fontSize: 20),
        ),
        ),
        Container(
          child: Text(
            "${date} ${hour}",
            style: TextStyle(
                color: Color(0xFF267DAE),
                fontWeight: FontWeight.bold,
                fontFamily: 'Roboto',
                fontSize: 15),
          ),
        ),
      ],

    )
    ;
  }
}
