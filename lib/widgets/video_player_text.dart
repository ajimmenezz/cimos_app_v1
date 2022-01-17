import 'package:flutter/material.dart';

class VideoPlayerText extends StatelessWidget {
  final String value;
  final Color color;
  final double size;
  const VideoPlayerText(
      {Key? key, required this.value, required this.color, required this.size})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 9, bottom: 8),
      child: Text(
        value,
        style: TextStyle(
          color: color,
          fontSize: size,
          fontWeight: FontWeight.bold,
        ),
        textAlign: TextAlign.center,
      ),
    );
  }
}
