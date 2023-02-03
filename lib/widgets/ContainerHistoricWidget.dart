import 'package:droplets/widgets/TextHistoricWidget.dart';
import 'package:flutter/material.dart';

class ContainerHistoricWidget extends StatelessWidget {
  ContainerHistoricWidget();
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(bottom: 80),

      child: SizedBox(
        height: 50.0,
        width: 340,
        child: Material(
          borderRadius: BorderRadius.circular(8.0),
          elevation: 3.0,
          shadowColor: Colors.black,
          color: Color(0xFFFFFFFF),
          child: GestureDetector(
            onTap: () {

            },
            child: Center(
              child: TextHistoricWidget(
                "eau",
                "12/04/2001",
                "12:05"
              ),
            ),

          ),
        ),
      ),
    )
    ;
  }
}


