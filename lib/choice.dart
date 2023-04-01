import 'package:droplets/widgets/ButtonCircleTextWidget.dart';
import 'package:droplets/widgets/ButtonWithTextWidget.dart';
import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Droplets',
      theme: null,
      debugShowCheckedModeBanner: false,
      home: ChoicePage(),
    );
  }
}

class ChoicePage extends StatefulWidget {
  const ChoicePage({Key? key}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".


  @override
  State<ChoicePage> createState() => _ChoicePageState();
}

class _ChoicePageState extends State<ChoicePage> {
  void _init() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
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
            Padding(padding: EdgeInsets.only(top: 100)),
            ButtonWithTextWidget("Tester une goutte",340,'/camera'),
            ButtonWithTextWidget("Tester deux gouttes",340,'/cameraDuo'),
            ButtonWithTextWidget("Retour",120,''),
            Padding(padding: EdgeInsets.only(bottom: 80)),
            ButtonCircleWithTextWidget("?", "Ici, vous pouvez choisir de capturer une goutte ou deux gouttes simultanément."),


          ],
        ),
      ),
    );
  }
}
