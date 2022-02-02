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
        // SizedBox(
        //   height: 10,
        // ),
        Card(
          margin: EdgeInsets.only(top: 15, left: 20, right: 20),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          child: Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: FadeInImage.assetNetwork(
                  placeholder: 'assets/loading3.gif',
                  image: "${video.pictureId}",
                  fit: BoxFit.fill,
                  placeholderFit: BoxFit.fill,
                  width: double.infinity,
                  height: MediaQuery.of(context).size.height * 0.29,
                ),
              ),
              Container(
                //Altura del contenedor
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
                                  style: ButtonStyle(
                                      backgroundColor:
                                          MaterialStateProperty.all(
                                              Color.fromRGBO(181, 79, 79, 1))),
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
                                  child: const Icon(
                                    Icons.arrow_right,
                                  )),
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
