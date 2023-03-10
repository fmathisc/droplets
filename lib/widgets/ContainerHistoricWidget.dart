import 'package:droplets/widgets/ButtonHistoricWidget.dart';
import 'package:droplets/widgets/TextHistoricWidget.dart';
import 'package:flutter/material.dart';

class ContainerHistoricWidget extends StatelessWidget {
  ContainerHistoricWidget();
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(bottom: 80),

      child: SizedBox(
        height: 55.0,
        width: 340,
        child: Material(
          borderRadius: BorderRadius.circular(8.0),
          color: Color(0xFFFFFFFF),
          child: GestureDetector(
            onTap: () {

            },
            child: Row(
              children: <Widget> [
                Padding(padding: EdgeInsets.only(left: 10)),
                TextHistoricWidget(
                    "Eau",
                    "12/04/2001",
                    "12:05"
                ),
                Padding(padding: EdgeInsets.only(left: 50)),
                ButtonHistoricWidget('stat2'),
                Padding(padding: EdgeInsets.only(left: 10)),
                ButtonHistoricWidget('eye'),
                Padding(padding: EdgeInsets.only(left: 10)),
                ButtonHistoricWidget('trash')
              ],
            ),

          ),
        ),
      ),
    )
    ;
  }
}


