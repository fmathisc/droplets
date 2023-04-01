import 'package:flutter/material.dart';

class ButtonCircleWithTextWidget extends StatelessWidget {
  String text;
  String text2;
  ButtonCircleWithTextWidget(this.text, this.text2);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        showDialog<String>(
          context: context,
          builder: (BuildContext context) => AlertDialog(
            title: const Text('Aide'),
            content: Text("${text2}"),
            actions: <Widget>[
              TextButton(
                onPressed: () => Navigator.pop(context, 'OK'),
                child: const Text('OK'),
              ),
            ],
          ),
        );
      },
      child: Container(
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
                  color: Color(0xB6267DAE),
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Roboto',
                  fontSize: 20),
            ),
          ),
        ),
      ),
    );

  }
}