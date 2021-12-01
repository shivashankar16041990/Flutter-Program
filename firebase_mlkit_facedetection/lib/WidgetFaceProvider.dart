import 'package:flutter/material.dart';
import 'provider.dart';
import "package:provider/provider.dart";
import 'modal.dart';
import 'painter.dart';

class MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<FaceProvider>(builder: (context, faceprovider, _) {
      if (faceprovider.isDetectorVisible) {
        return const DetectFaces();
      }
      return const ShowImagePicker();
    });
  }
}

class ShowImagePicker extends StatelessWidget {
  const ShowImagePicker();

  @override
  Widget build(BuildContext context) {
    return Consumer<FaceProvider>(
      builder: (context, faceprovider, _) {
        return ElevatedButton(
          child: Text("Detect Faces"),
          onPressed: () {
            faceprovider.setDetectorVisible(true);
          },
        );
      },
    );
  }
}

class DetectFaces extends StatefulWidget {
  const DetectFaces();

  @override
  State<StatefulWidget> createState() {
    return DetectFacesState();
  }
}

class DetectFacesState extends State<DetectFaces> {
  late final Future<FaceDetectorData> _faces;
  final _model = FaceDetectorModal();

  void initState() {
    super.initState();
    _faces = _model.detectfaces();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<FaceDetectorData>(
      future: _faces,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          if (snapshot.data != null) {
            return Wrap(
              children: [
                SizedBox(
                  width: 300,
                  height: 300,
                  child: CustomPaint(
                    painter: RectangularPainter(
                        facesposition: snapshot.data!.faces,
                        selectedimage: snapshot.data!.image),
                  ),
                ),
                Consumer<FaceProvider>(
                  builder: (context, faceprovider, _) {
                    return ElevatedButton(
                      child: Text("Detect more Faces"),
                      onPressed: () {
                        faceprovider.setDetectorVisible(false);
                      },
                    );
                  },
                )
              ],
            );
          }
        }
        return CircularProgressIndicator();
      },
    );
  }
}
