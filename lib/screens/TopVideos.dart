import 'package:flutter/material.dart';

import '/models/vods.dart';
import '/http/http_exec.dart';
import '/commons/constants.dart';
import '/models/http_response.dart';

import 'package:cimos_v1/widgets/widgets.dart' show CardVideos, CustomButtonBar, Loaders;

class TopVideos extends StatefulWidget {
  const TopVideos({Key? key}) : super(key: key);

  @override
  State<TopVideos> createState() => _TopVideosState();
}

class _TopVideosState extends State<TopVideos> {
  bool _isLoading = true;
  late HttpResponse response;
  List<CimosVODS> vods = <CimosVODS>[];

  Future<void> _getVods() async {
    response = await HttpExec.getResponse(Constant.API_VIDEOS);
    setState(() {
      if (response.status == 200) {
        for (var video in response.body['videos']) {
          vods.add(CimosVODS.fromJson(video));
        }
      }

      _isLoading = false;
    });
  }

  @override
  void initState() {
    super.initState();
    _getVods();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('TopVideos'),
          backgroundColor: Colors.blue,
        ),
        bottomNavigationBar: const CustomButtonBar(),
        body: _isLoading
            ? Center(child: Loaders.circular())
            : Container(
                child: ListView(
                  padding: EdgeInsets.only(left: 4, right: 4),
                  children: [
                    for (CimosVODS v in vods)
                      CardVideos(
                        video: v,
                      )
                  ],
                ),
              ));
  }
}
