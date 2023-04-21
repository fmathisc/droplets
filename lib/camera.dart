import 'dart:async';
import 'dart:io';
import 'package:droplets/widgets/ButtonSaveCapture.dart';
import 'package:gallery_saver/gallery_saver.dart';
import 'package:path/path.dart' show join;
import 'package:path_provider/path_provider.dart';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:image/image.dart' as img;

import 'imageSegmentation/imageSegmentation.dart';

class TakePictureScreen extends StatefulWidget {
  const TakePictureScreen({Key? key, required this.camera}) : super(key: key);

  final CameraDescription camera;

  @override
  _TakePictureScreenState createState() => _TakePictureScreenState();
}

class _TakePictureScreenState extends State<TakePictureScreen> {
  late CameraController _controller;
  late Future<void> _initializeControllerFuture;
  final _textFieldController = TextEditingController();


  @override
  void initState() {
    super.initState();
    _controller = CameraController(
        widget.camera,
        ResolutionPreset.ultraHigh
    );

    _initializeControllerFuture = _controller.initialize();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: null,
      body: FutureBuilder<void>(
        future: _initializeControllerFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return Stack(
              children: [
                CameraPreview(_controller),
                Positioned(
                  left: MediaQuery.of(context).size.width / 2 - 75,
                  top: MediaQuery.of(context).size.height / 2 - 100,
                  child: Container(
                    width: 150,
                    height: 150,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.yellow, width: 4),
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    height: 200,
                    color: Colors.black,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        FloatingActionButton(
                          onPressed: () async {
                            try {
                              await _initializeControllerFuture;
                              final image = await _controller.takePicture();
                              final appDir = await getExternalStorageDirectory();
                              final fileName = DateTime.now().toIso8601String();
                              final fileName2 = DateTime.now().toIso8601String()+"Seg";
                              final filePath = join(appDir!.path, '$fileName.png');
                              final filePath2 = join(appDir.path, '$fileName2.png');


                              // Ajouter le recadrage de l'image avant de l'enregistrer
                              final img.Image? imgFile = img.decodeImage(await image.readAsBytes());
                              final int width = imgFile!.width;
                              final int height = imgFile.height;
                              final int size = width < height ? width : height;
                              final img.Image croppedImage = img.copyCrop(imgFile, (width-size)~/2, (height-size)~/2, size, size);

                              await File(filePath).writeAsBytes(img.encodePng(croppedImage));

                              await GallerySaver.saveImage(filePath);

                              imageSegmentation iseg = new imageSegmentation();
                              await File(filePath2).writeAsBytes(img.encodePng(iseg.lancement(filePath)));


                              if (!mounted) return;

                              await GallerySaver.saveImage(filePath2);


                              await Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) => Scaffold(
                                    appBar: null,
                                    body: Container(
                                      color: Color(0xFF1F668D),
                                      child: Column(
                                        children: [
                                          Expanded(
                                            child: Image.file(File(filePath)),
                                          ),
                                          Padding(
                                            padding: EdgeInsets.all(16.0),
                                            child: TextField(
                                              style: TextStyle(color: Colors.white),
                                              decoration: InputDecoration(
                                                labelText: 'Nom de la capture',
                                                labelStyle: TextStyle(color: Colors.white),
                                              ),
                                              controller: _textFieldController,
                                              onChanged: (value) {
                                                _textFieldController.text = value;
                                              },
                                            ),
                                          ),
                                          ButtonSaveCapture("Enregistrer",150,'/historic', _textFieldController.text, filePath),
                                          RaisedButton(
                                            color: Colors.white,
                                            textColor: Color(0xFF1F668D),
                                            child: Text('Voir image segmentée'),
                                            onPressed: () {
                                              Navigator.of(context).push(
                                                MaterialPageRoute(
                                                  builder: (context) => Scaffold(
                                                    appBar: null,
                                                    body: Center(
                                                      child: Image.file(File(filePath2)),
                                                    ),
                                                  ),
                                                ),
                                              );
                                            },
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              );

                            } catch (e) {
                              print(e);
                            }
                          },
                          child: const Icon(Icons.camera_alt),
                          backgroundColor: Colors.white,
                          foregroundColor: Colors.white,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            );
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}

class DisplayPictureScreen extends StatelessWidget {
  final String imagePath;



  const DisplayPictureScreen({Key? key, required this.imagePath}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: null,
      body: Image.file(File(imagePath)),
    );
  }
}

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final cameras = await availableCameras();
  final firstCamera = cameras.first;
  runApp(
    MaterialApp(
      theme: ThemeData.dark(),
      home: TakePictureScreen(camera: firstCamera),
    ),
  );
}