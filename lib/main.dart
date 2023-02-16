import 'package:camera/camera.dart';
import 'package:droplets/choice.dart';
import 'package:droplets/historic.dart';
import 'package:droplets/support.dart';
import 'package:droplets/widgets/ButtonCircleTextWidget.dart';
import 'package:droplets/widgets/ButtonWithTextWidget.dart';
import 'package:flutter/material.dart';

import 'camera.dart';


Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final cameras = await availableCameras();
  final firstCamera = cameras.first;
  runApp(MyApp(firstCamera: firstCamera));
}

class MyApp extends StatelessWidget {
  final CameraDescription firstCamera;

  const MyApp({Key? key, required this.firstCamera}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Droplets',
      theme: null,
      debugShowCheckedModeBanner: false,
      home: MyHomePage(title: 'Droplets'),
      initialRoute: '/',
      routes: {
        '/choice': (context) => ChoicePage(),
        '/support': (context) => SupportPage(),
        '/historic': (context) => HistoricPage(),
        '/camera': (context) => TakePictureScreen(camera: firstCamera)
      },
    );
  }
}
class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
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
        color: Color(0xFF267DAE),

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
              ButtonWithTextWidget("Je suis le téléphone capteur",340,'/choice'),
              ButtonWithTextWidget("Je suis le téléphone support",340,'/support'),
              ButtonWithTextWidget("Historique",340,'/historic'),
              Padding(padding: EdgeInsets.only(bottom: 80)),
              ButtonCircleWithTextWidget("?"),


            ],
        ),
      ),
    );
  }
}
