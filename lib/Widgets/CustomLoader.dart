import 'package:flutter/material.dart';

class GifLoader extends StatelessWidget {
  final double value;
  final double strokeWidth;
  final Animation<Color> valueColor;

  GifLoader({this.strokeWidth, this.value, this.valueColor});

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      'Asset/icon/loading.gif',
      width: strokeWidth != null?50:66,
      height: strokeWidth != null?50:66,
      gaplessPlayback: true,

      fit: BoxFit.contain,
    );
  }
}