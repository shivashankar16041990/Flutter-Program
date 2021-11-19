import 'package:flutter/material.dart';
import 'package:camera/camera.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final cameras = await availableCameras();
  final firstcamera = cameras.first;

  runApp(MaterialApp(home: Scaffold(body: CameraApp(camera: firstcamera,),
    appBar: AppBar(title: const Text("Take Photo"),),)));
}

class CameraApp extends StatefulWidget {
  final CameraDescription camera;

  CameraApp({required this.camera});

  @override
  State<StatefulWidget> createState() {
    return CameraAppState();
  }

}

class CameraAppState extends State<CameraApp> {
  late final CameraController _controller;
  late final Future<void> _initcontroller;

  void initState() {
    super.initState();
    _controller = CameraController(widget.camera, ResolutionPreset.high,
        imageFormatGroup: ImageFormatGroup.jpeg);
    _initcontroller = _controller.initialize();
  }

  void dispose() {
    _controller.dispose();


    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [FutureBuilder<void>(
          future: _initcontroller,


          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              return Expanded(child: Center(child: AspectRatio(
                aspectRatio: _controller.value.aspectRatio,
                child: CameraPreview(
                    _controller),),),);
            }
            return CircularProgressIndicator();
          }


      ),

        IconButton(
          onPressed: () => _takepicture(context), icon: Icon(Icons.camera),)


      ],);
  }

  void _takepicture(BuildContext context) async {
    await _initcontroller;

    final path = await _controller.takePicture();
    debugPrint("Stored to ${path.path}");

    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text("picture is saved"),
      duration: Duration(milliseconds: 1600),));
  }
}