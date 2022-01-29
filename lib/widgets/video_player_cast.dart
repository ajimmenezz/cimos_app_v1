// import 'package:flutter/material.dart';
// import 'package:flutter_video_cast/flutter_video_cast.dart';

// class CastSample extends StatefulWidget {
//   const CastSample({Key? key}) : super(key: key);

//   @override
//   _CastSampleState createState() => _CastSampleState();
// }

// class _CastSampleState extends State<CastSample> {
//   late ChromeCastController _controller;

//   @override
//   Widget build(BuildContext context) {
//     return ChromeCastButton(
//       onButtonCreated: (controller) {
//         setState(() => _controller = controller);
//         _controller.addSessionListener();
//       },
//       onSessionStarted: () {
//         _controller.loadMedia(
//             'https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4');
//       },
//     );
//   }
// }
