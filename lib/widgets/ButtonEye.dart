import 'package:flutter/material.dart';
import 'dart:io';

class ButtonEyeWidget extends StatelessWidget {
  String logo;
  String file;
  ButtonEyeWidget(this.logo, this.file);
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
      child: Material(
        child: RaisedButton(
          onPressed: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => Scaffold(
                  appBar: null,
                  body: Center(
                    child: Image.file(File(file)),
                  ),
                ),
              ),
            );
          },
          child: Container(
            child: Center(
              child: Image.asset(
                'assets/images/${logo}.png',
                height: 20,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
