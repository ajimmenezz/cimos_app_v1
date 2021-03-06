
import 'package:cimos_v1/theme/cimos_theme.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'package:cimos_v1/widgets/widgets.dart' show ChewieListItem, VideoPlayerText;
class VideoDetailsScreen extends StatelessWidget {
  final Map information;

  const VideoDetailsScreen({
    Key? key,
    required this.information,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Clase On Demand'),
        backgroundColor: CimosTheme.primary,
      ),
      backgroundColor: Colors.blueGrey[900],
      body: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
        SizedBox(
          child: ChewieListItem(
            videoPlayerController: VideoPlayerController.network(
              information['File'],
            ),
            looping: true,
          ),
          width: double.infinity,
          height: MediaQuery.of(context).size.height * 0.35,
        ),
        Column(
          children: [
            VideoPlayerText(value: information['Name'], color: Colors.white, size: 30),
            VideoPlayerText(value: information['Created'], color: Colors.green, size: 20),
            VideoPlayerText(value: '${information['Duration']} Min'.toString(), color: Colors.green, size: 20),
            VideoPlayerText(value: '${information['DEscription']?? 'Sin descripcion'}', color: Colors.white, size: 20),
          ],
        )
      ]),
    );
  }
}
