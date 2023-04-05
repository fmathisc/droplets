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
      home: SupportPage(),
    );
  }
}

class SupportPage extends StatefulWidget {
  const SupportPage({Key? key}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".


  @override
  State<SupportPage> createState() => _SupportPageState();
}

class _SupportPageState extends State<SupportPage> {
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
            Padding(padding: EdgeInsets.only(top: 15)),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                _buildCircleContainer(40),
                _buildCircleContainer(40),
                _buildCircleContainer(40),
              ],
            ),
            Padding(padding: EdgeInsets.only(top: 8)),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                _buildCircleContainer(40),
                _buildCircleContainer(40),
                _buildCircleContainer(40),
              ],
            ),
            Padding(padding: EdgeInsets.only(top: 20)),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                _buildCircleContainer(50),
                _buildCircleContainer(50),
                _buildCircleContainer(50),
              ],
            ),
            Padding(padding: EdgeInsets.only(top: 8)),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                _buildCircleContainer(50),
                _buildCircleContainer(50),
                _buildCircleContainer(50),
              ],
            ),
            Padding(padding: EdgeInsets.only(top: 20)),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                _buildCircleContainer(60),
                _buildCircleContainer(60),
                _buildCircleContainer(60),
              ],
            ),
            Padding(padding: EdgeInsets.only(top: 8)),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                _buildCircleContainer(60),
                _buildCircleContainer(60),
                _buildCircleContainer(60),
              ],
            ),
            Padding(padding: EdgeInsets.only(top: 20)),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                _buildCircleContainer(70),
                _buildCircleContainer(70),
                _buildCircleContainer(70),
              ],
            ),
            Padding(padding: EdgeInsets.only(top: 8)),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                _buildCircleContainer(70),
                _buildCircleContainer(70),
                _buildCircleContainer(70),
              ],
            ),
            Padding(padding: EdgeInsets.only(top: 17)),
            ButtonWithTextWidget("Retour", 120, ''),
          ],
        ),
      ),
    );
  }


  Widget _buildCircleContainer(double tailleCircle) {
    return Container(
      width: tailleCircle,
      height: tailleCircle,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.white,
      ),
    );
  }
}