import 'package:flutter/material.dart';

class ButtonHistoricWidget extends StatelessWidget {
  String logo;
  ButtonHistoricWidget(this.logo);
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 45.0,
      height: 45.0,
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
          child: Image.asset(
            'assets/images/${logo}.png',
            height: 20,
          ),
        ),
      ),
    )

    ;
  }
}
