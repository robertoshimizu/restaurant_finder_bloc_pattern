import 'package:flutter/material.dart';

class ImageContainer extends StatelessWidget {
  final double width;
  final double height;
  final String url;

  ImageContainer({
    @required this.width,
    @required this.height,
    @required this.url,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: this.width,
      height: this.height,
      decoration: new BoxDecoration(
        image: DecorationImage(
          image: NetworkImage(this.url),
          fit: BoxFit.fill,
        ),
      ),
    );
  }
}
