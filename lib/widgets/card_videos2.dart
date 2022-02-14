import 'package:flutter/material.dart';

import '/models/vods.dart';
import 'package:cimos_v1/http/http_exec.dart';
import 'package:cimos_v1/models/http_response.dart';

import 'package:cimos_v1/screens/screens.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CardVideos2 extends StatelessWidget {
  final CimosVODS video;

  const CardVideos2({Key? key, required this.video}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        final information = {
          'id': video.id,
        };
        ViewInformationVideo(context, information);
      },
      child: Container(
        height: MediaQuery.of(context).size.height * 0.25,
        width: MediaQuery.of(context).size.width * 0.90,
        decoration: BoxDecoration(
          color: Colors.transparent,
          borderRadius:
              BorderRadius.circular(MediaQuery.of(context).size.width * 0.03),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.6),
              spreadRadius: 2,
              blurRadius: 2,
              offset: const Offset(3, 2),
            )
          ],
        ),
        margin: EdgeInsets.symmetric(
            vertical: 15, horizontal: MediaQuery.of(context).size.width * 0.05),
        child: Stack(
          fit: StackFit.expand,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(
                  MediaQuery.of(context).size.width * 0.03),
              child: FadeInImage.assetNetwork(
                placeholder: 'assets/loading3.gif',
                image: "${video.pictureId}",
                fit: BoxFit.cover,
                placeholderFit: BoxFit.fill,
                width: double.infinity,
              ),
            ),
            Column(
              children: [
                Container(
                  width: MediaQuery.of(context).size.width * 0.90,
                  alignment: Alignment.topLeft,
                  margin: EdgeInsets.symmetric(
                    vertical: MediaQuery.of(context).size.height * 0.01,
                    horizontal: MediaQuery.of(context).size.width * 0.01,
                  ),
                  padding: EdgeInsets.symmetric(
                    vertical: MediaQuery.of(context).size.height * 0.01,
                    horizontal: MediaQuery.of(context).size.width * 0.02,
                  ),
                  child: Text(
                    "  ${video.name}  ",
                    textAlign: TextAlign.left,
                    style: const TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                      fontWeight: FontWeight.w900,
                      backgroundColor: Color.fromARGB(100, 0, 0, 0),
                      letterSpacing: 1.3,
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * 0.02,
                    bottom: MediaQuery.of(context).size.height * 0.01,
                  ),
                  width: MediaQuery.of(context).size.height * 0.13,
                  height: MediaQuery.of(context).size.height * 0.07,
                  decoration: BoxDecoration(
                      color: const Color.fromARGB(100, 0, 0, 0),
                      borderRadius: BorderRadius.circular(5)),
                  child: Icon(
                    Icons.play_circle_outline,
                    color: Colors.white70,
                    size: MediaQuery.of(context).size.height * 0.05,
                  ),
                ),
                Expanded(
                  child: Container(
                      width: MediaQuery.of(context).size.width * 0.90,
                      margin: EdgeInsets.only(
                        bottom: MediaQuery.of(context).size.height * 0.01,
                        left: MediaQuery.of(context).size.width * 0.01,
                        right: MediaQuery.of(context).size.width * 0.01,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            " ${video.created} ",
                            textAlign: TextAlign.left,
                            style: const TextStyle(
                              fontSize: 18,
                              color: Colors.white,
                              fontWeight: FontWeight.w900,
                              backgroundColor: Color.fromARGB(125, 181, 79, 79),
                              letterSpacing: 1.3,
                            ),
                          ),
                          Text(
                            "  ${video.duration} min  ",
                            textAlign: TextAlign.left,
                            style: const TextStyle(
                              fontSize: 18,
                              color: Colors.white,
                              fontWeight: FontWeight.w900,
                              backgroundColor: Color.fromARGB(125, 181, 79, 79),
                              letterSpacing: 1.3,
                            ),
                          ),
                        ],
                      )),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  Future<void> ViewInformationVideo(context, information) async {
    late HttpResponse response;

    SharedPreferences prefs = await SharedPreferences.getInstance();
    String token = prefs.getString('token').toString();
    // Podriamos hacer la peticion aca y validar con un if

    response = await HttpExec.getResponse(
        endPoint: "https://api.cimos.mx/v1/VID?vid=${information['id']}",
        token: token);
    if (response.status == 200) {
      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => VideoDetailsScreen(
              information: response.body['video'],
            ),
          ));
    } else if (response.status == 401) {
      removeDataGlobal(context);
    }
  }
}
