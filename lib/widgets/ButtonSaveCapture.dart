import 'package:flutter/material.dart';
import 'package:droplets/historic.dart';

import 'ButtonHistoricWidget.dart';
import 'ContainerHistoricWidget.dart';

class ButtonSaveCapture extends StatelessWidget {
  String text;
  double size;
  String route;
  String name;
  String file;
  ButtonSaveCapture(this.text, this.size, this.route, this.name, this.file);
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
              } else {
                Navigator.pushNamed(context, '${route}');
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('Ajouté avec succès'),
                    duration: Duration(seconds: 1),
                    action: SnackBarAction(
                      label: 'Annuler',
                      onPressed: () {
                      },
                    ),
                  ),
                );
                HistoricPage.containerHistoricWidgets.add(ContainerHistoricWidget(text: name, file: file));
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
    );
  }
}