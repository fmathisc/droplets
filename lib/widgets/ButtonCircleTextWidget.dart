import 'package:flutter/material.dart';

class ButtonCircleWithTextWidget extends StatelessWidget {
  String text;
  ButtonCircleWithTextWidget(this.text);
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 55.0,
      height: 55.0,
      decoration: BoxDecoration(
        color: Colors.white,
        shape: BoxShape.rectangle,
        borderRadius: BorderRadius.circular(8.0),
        boxShadow: [
          BoxShadow(
            color: Colors.black26,
            offset: Offset(5.0, 5.0),
            blurRadius: 3.0,
            spreadRadius: 3,
          ),
        ],
      ),
      child: Container(
        child: Center(
          child: Text(
            "${text}",
            style: TextStyle(
                color: Color(0xFF267DAE),
                fontWeight: FontWeight.bold,
                fontFamily: 'Roboto',
                fontSize: 20),
          ),
        ),
      ),
    )

    ;
  }
}
