import 'dart:convert';
import 'dart:io';
import 'dart:ui' as ui;
import 'package:google_ml_kit/google_ml_kit.dart';
import 'package:image_picker/image_picker.dart';

class FaceDetectorData {
  final List<Face> faces;
  final ui.Image image;

  const FaceDetectorData({required this.faces, required this.image});
}

class FaceDetectorModal {
  const FaceDetectorModal();

  Future<FaceDetectorData> detectfaces() async {
    //choose the image
    final picker = ImagePicker();
    final imagefile = await picker.pickImage(
        source: ImageSource.gallery, maxHeight: 300, maxWidth: 300);
    //Load image and setup Ml kit
    final file = File(imagefile!.path);
    final image = InputImage.fromFile(file);
    final detector = GoogleMlKit.vision.faceDetector();
    //process data
    final faces = await detector.processImage(image);
    final canvasImage = await _decodeImage(file);
    return FaceDetectorData(faces: faces, image: canvasImage);
  }

  Future<ui.Image> _decodeImage(File file) async {
    final rawfile = await file.readAsBytes();
    //codec class is used by flutter
    final ui.Codec codec = await ui.instantiateImageCodec(rawfile);
    final ui.FrameInfo frameInfo = await codec.getNextFrame();
    return frameInfo.image;
  }
}
