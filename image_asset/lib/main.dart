import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

void main() {
  runApp(Myapp());
}

class Myapp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: ListView(
          children: [
            const Image(image: AssetImage("asset/surya.jpg")),
            Image.asset('asset/surya.jpg'),
            Image.network(
              'https://d3rk2wqy1pqubb.cloudfront.net/wp-content/uploads/2021/01/Surya-2.jpg',
              loadingBuilder: (context, child, progress) {
                var percentage = 0.0;

                final total = progress?.expectedTotalBytes;
                var remaining = progress?.cumulativeBytesLoaded;
                if (remaining != null && total != null) {
                  percentage = (remaining / total) * 100;
                  debugPrint('${percentage}');
                }
                if (progress == null) return child;
                return Center(
                  child: CircularProgressIndicator(
                    value: percentage,
                  ),
                );
              },
            ),
            CachedNetworkImage(
              imageUrl:
                  "https://d3rk2wqy1pqubb.cloudfront.net/wp-content/uploads/2021/01/Surya-2.jpg",
              progressIndicatorBuilder: (context, url, status) {
                return CircularProgressIndicator(value: status.progress);
              },
              errorWidget: (_, __, ___) {
                return Icon(Icons.error);
              },
            )
          ],
        ),
      ),
    );
  }
}
