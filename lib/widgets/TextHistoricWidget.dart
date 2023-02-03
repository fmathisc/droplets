import 'package:flutter/material.dart';

class TextHistoricWidget extends StatelessWidget {
  String date;
  String name;
  String hour;
  TextHistoricWidget(this.date, this.name, this.hour);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          child: Text(
          "${name} ${date}",
          style: TextStyle(
            color: Color(0xFF267DAE),
            fontWeight: FontWeight.bold,
            fontFamily: 'Roboto',
            fontSize: 15),
        ),
        ),
        Container(
          child: Text(
            "${hour}",
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
