import 'package:cimos_v1/theme/cimos_theme.dart';
import 'package:flutter/material.dart';

import '/models/vods.dart';
import '/http/http_exec.dart';
import '/commons/constants.dart';
import '/models/http_response.dart';

import 'package:cimos_v1/widgets/widgets.dart'
    show CardVideos, CustomButtonBar, Loaders;

import 'package:cimos_v1/search/search_delegate.dart';

class VideosOnDemand extends StatefulWidget {
  const VideosOnDemand({Key? key}) : super(key: key);

  @override
  State<VideosOnDemand> createState() => _VideosOnDemandState();
}

class _VideosOnDemandState extends State<VideosOnDemand> {
  bool _isLoading = false;
  late HttpResponse response;
  List<CimosVODS> vods = <CimosVODS>[];
  int numberPage = 1;
  Future<void> _getVods() async {
    response = await HttpExec.getResponse(
        'https://api.cimos.mx/v1/VOD?page=$numberPage&per_page=5');
    setState(() {
      if (response.status == 200) {
        for (var video in response.body['videos']) {
          vods.add(CimosVODS.fromJson(video));
        }
      }

      _isLoading = false;
    });
  }

  // Controlador
  List<int> numberElements = [1, 2, 3, 4];
  final ScrollController scrollController = ScrollController();
  bool isLoadingScroll = false;

  @override
  void initState() {
    super.initState();
    _getVods();
    scrollController.addListener(() {
      if ((scrollController.position.pixels + 500) >=
          scrollController.position.maxScrollExtent) {
        fetchData();
        numberPage = numberPage + 1;
        _getVods();
      }
    });
  }

  void addElements() {
    final lastId = numberElements.last;
    numberElements.addAll([1, 2, 3, 4].map((e) => lastId + e));
    setState(() {});
  }

  Future fetchData() async {
    if (isLoadingScroll) return;

    isLoadingScroll = true;
    setState(() {});

    await Future.delayed(const Duration(seconds: 3));

    addElements();

    isLoadingScroll = false;
    setState(() {});

    scrollController.animateTo(scrollController.position.pixels + 120,
        duration: const Duration(microseconds: 300),
        curve: Curves.fastOutSlowIn);
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
        appBar: AppBar(
          title: const Text('VideosOnDemand'),
          backgroundColor: CimosTheme.primary,
          actions: [
            IconButton(
                onPressed: () => showSearch(
                    context: context, delegate: VideoSearchDelegate()),
                icon: const Icon(Icons.search))
          ],
        ),
        bottomNavigationBar: const CustomButtonBar(),
        body: _isLoading
            ? Center(
                child: Loaders.circular(),
              )
            : Stack(
                children: [
                  ListView.builder(
                      physics: const BouncingScrollPhysics(), // Rebote de iOS
                      controller: scrollController,
                      itemCount: numberElements.length,
                      itemBuilder: (BuildContext context, int index) {
                        return CardVideos(video: vods[numberElements[index]]);
                      }),
                  if (isLoadingScroll)
                    Positioned(
                      bottom: 40,
                      left: size.width * 0.5 - 30,
                      child: const _LoadingIcon(),
                    )
                ],
              ));
  }
}

class _LoadingIcon extends StatelessWidget {
  const _LoadingIcon({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      height: 60,
      width: 60,
      decoration:
          const BoxDecoration(color: Colors.white, shape: BoxShape.circle),
      child: const CircularProgressIndicator(color: CimosTheme.primary),
    );
  }
}

// SingleChildScrollView(
//                 child: Column(
//                   children: [
//                     for (CimosVODS v in vods)
//                       CardVideos(
//                         video: v,
//                       )
//                   ],
//                 ),
//               )
