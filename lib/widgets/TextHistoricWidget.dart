import 'package:flutter/material.dart';

class TextHistoricWidget extends StatelessWidget {
  TextHistoricWidget({required this.name});
  String name;
  @override
  Widget build(BuildContext context) {

    final DateTime now = DateTime.now();
    final String date = "${now.day}/${now.month}/${now.year}";
    final String time = "${now.hour+2}:${now.minute}";

    return Column(
      children: <Widget>[
        Container(
          child: Text(
          name,
          style: TextStyle(
            color: Color(0xFF267DAE),
            fontWeight: FontWeight.bold,
            fontFamily: 'Roboto',
            fontSize: 20),
        ),
        ),
        Container(
          child: Text(
            date+" "+time,
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
