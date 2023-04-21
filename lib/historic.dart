import 'package:flutter/material.dart';
import 'package:droplets/widgets/ButtonCircleTextWidget.dart';
import 'package:droplets/widgets/ButtonWithTextWidget.dart';
import 'package:droplets/widgets/ContainerHistoricWidget.dart';

class HistoricPage extends StatefulWidget {
  static List<ContainerHistoricWidget> containerHistoricWidgets = [];
  const HistoricPage({Key? key}) : super(key: key);

  @override
  State<HistoricPage> createState() => _HistoricPageState();
}

class _HistoricPageState extends State<HistoricPage> {
  void addWidget(String text, String file) {
    setState(() {
      HistoricPage.containerHistoricWidgets.add(ContainerHistoricWidget(text: text, file: file));
    });
  }

  void removeWidget(int index) {
    setState(() {
      HistoricPage.containerHistoricWidgets.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: null,
      body: Container(
        width: double.infinity,
        height: double.infinity,
        color: Color(0xFF1F668D),
        child: Column(
          children: <Widget>[
            Container(
              height: 150.0,
              width: MediaQuery.of(context).size.width,
              child: Image.asset(
                'assets/images/dropletslogo.png',
                height: 50,
              ),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.vertical(
                    bottom: Radius.elliptical(
                        MediaQuery.of(context).size.width, 150.0)),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.5),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: const Offset(0, 3), // changes position of shadow
                  ),
                ],
              ),
            ),
            Padding(padding: EdgeInsets.only(top: 0)),
            Expanded(
              child: ListView.builder(
                itemCount: HistoricPage.containerHistoricWidgets.length,
                itemBuilder: (BuildContext context, int index) {
                  return HistoricPage.containerHistoricWidgets[index];
                },
              ),
            ),
            SizedBox(height: 20),
            Align(
              alignment: Alignment.bottomCenter,
              child: ButtonWithTextWidget("Retour", 120, ''),
            ),
            Padding(padding: EdgeInsets.only(bottom: 50)),
            Align(
              alignment: Alignment.bottomCenter,
              child: ButtonCircleWithTextWidget(
                "?",
                "Ici, vous pouvez consulter toutes vos anciennes captures. Vous avez la possibilité d'afficher les stats d'une capture, afficher l'image capturée ou de supprimer une capture.",
              ),
            ),
          ],
        ),
      ),
    );
  }
}