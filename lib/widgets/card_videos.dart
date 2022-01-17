import 'package:cimos_v1/screens/screens.dart';
import 'package:flutter/material.dart';
import '/models/vods.dart';

class CardVideos extends StatelessWidget {
  final CimosVODS video;

  const CardVideos({Key? key, required this.video}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Card(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)),
          child: Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(40),
                child: FadeInImage.assetNetwork(
                  placeholder: 'assets/loading.gif',
                  image: "${video.pictureId}",
                  //TODO Revisar el gif de carga
                  width: double.infinity,
                  fit: BoxFit.fitWidth,
                  height: MediaQuery.of(context).size.height * 0.29,
                ),
              ),
              Container(
                //TODO Tamaño del contenedor "ALTURA" "RECORDAR HACER EL REPOSITORIO"
                height: MediaQuery.of(context).size.height * 0.29,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Column(
                  children: [
                    Column(
                      children: [
                        Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(top: 14, left: 14),
                              child: Text(
                                "${video.name}",
                                style: const TextStyle(
                                    fontSize: 22,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w900),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(top: 14, left: 14),
                              child: Text(
                                'Duration: ${video.duration}',
                                style: const TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w900),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(top: 60, left: 13),
                              child: ElevatedButton(
                                  onPressed: () {
                                    final information = {
                                      'name': video.name,
                                      'created': video.created,
                                      'duration': video.duration,
                                      'description': video.description,
                                      'video': video.file
                                    };
                                    ViewInformationVideo(context, information);
                                  },
                                  child: const Icon(Icons.arrow_right)),
                            ),
                            Expanded(child: Container()),
                            Padding(
                              padding:
                                  const EdgeInsets.only(top: 50.0, right: 9),
                              child: Column(
                                children: [
                                  Text(
                                    '${video.created}',
                                    style: const TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                            )
                          ],
                        )
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
        )
      ],
    );
  }

  void ViewInformationVideo(context, information) {
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => VideoDetailsScreen(
            information: information,
          ),
        ));
  }
}
