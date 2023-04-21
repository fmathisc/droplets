import 'package:droplets/widgets/ButtonEye.dart';
import 'package:droplets/widgets/ButtonHistoricWidget.dart';
import 'package:droplets/widgets/TextHistoricWidget.dart';
import 'package:flutter/material.dart';

class ContainerHistoricWidget extends StatelessWidget {

  ContainerHistoricWidget({required this.text, required this.file});

  String text;
  String file;

  @override
  Widget build(BuildContext context) {

    return Container(
      padding: EdgeInsets.only(bottom: 20),
      child: SizedBox(
        height: 55.0,
        width: 340,
        child: Material(
          borderRadius: BorderRadius.circular(8.0),
          color: Color(0xFFFFFFFF),
          child: GestureDetector(
            onTap: () {},
            child: Row(
              children: <Widget>[
                Padding(padding: EdgeInsets.only(left: 10)),
                TextHistoricWidget(
                  name: text,
                ),
                Padding(padding: EdgeInsets.only(left: 50)),
                ButtonHistoricWidget('stat2'),
                Padding(padding: EdgeInsets.only(left: 10)),
                ButtonEyeWidget('eye', file),
                Padding(padding: EdgeInsets.only(left: 10)),
                ButtonHistoricWidget('trash')
              ],
            ),
          ),
        ),
      ),
    );
  }
}
