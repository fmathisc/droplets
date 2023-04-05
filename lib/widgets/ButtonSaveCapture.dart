import 'package:flutter/material.dart';

class ButtonSaveCapture extends StatelessWidget {
  String text;
  double size;
  String route;
  ButtonSaveCapture(this.text, this.size, this.route);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(bottom: 80),

      child: SizedBox(
        height: 50.0,
        width: size,
        child: Material(
          borderRadius: BorderRadius.circular(8.0),
          elevation: 3.0,
          shadowColor: Colors.black,
          color: Color(0xFFFFFFFF),
          child: GestureDetector(
            onTap: () {
              if(route=='') {
                Navigator.pop(context);
              }else {
                Navigator.pushNamed(context, '${route}');
              }
            },
            child: Center(
              child: Text(
                "${text}",
                style: TextStyle(
                    color: Color(0xFF267DAE),
                    fontWeight: FontWeight.bold,
                      fontFamily: 'Roboto',
                    fontSize: 25),
              ),
            ),
          ),
        ),
      ),
    )
    ;
  }
}
