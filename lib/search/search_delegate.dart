import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '/http/http_exec.dart';
import '/models/http_response.dart';

import '/models/vods.dart' show CimosVODS;
import '/widgets/shared/shared_widgets.dart' show Loaders;

import '/widgets/widgets.dart'
    show CardVideos2, LoadingIcon, VideoPlayerText, CustomMessageToken;
import 'package:cimos_v1/theme/cimos_theme.dart';

class VideoSearchDelegate extends SearchDelegate {
  @override
  String get searchFieldLabel => 'Buscar Video';

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
          onPressed: () {
            close(context, null);
          },
          icon: const Icon(Icons.clear))
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return const Text('');
  }

  @override
  Widget buildResults(BuildContext context) {
    return VideosSearchResult(query: query);
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    if (query.isEmpty) {
      return const Center(
        child: Icon(
          Icons.search,
          color: CimosTheme.primary,
          size: 130,
        ),
      );
    }
    return const Text('');
  }
}

class VideosSearchResult extends StatefulWidget {
  final String query;
  const VideosSearchResult({Key? key, required this.query}) : super(key: key);

  @override
  State<VideosSearchResult> createState() => _VideosOnDemandState(query);
}

class _VideosOnDemandState extends State<VideosSearchResult> {
  bool _isLoading = true;
  bool anwerError = false;
  bool erroToken = false;
  late HttpResponse response;
  List<CimosVODS> vods = <CimosVODS>[];
  var numberVideosResponse = [];
  int numberPage = 1;
  final String query;
  _VideosOnDemandState(this.query);

  Future<void> _getVods() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String token = prefs.getString('token').toString();

    response = await HttpExec.getResponse(
      endPoint:
          'https://api.cimos.mx/v1/VOD?page=$numberPage&per_page=5&search=$query',
      token: token,
    );
    setState(() {
      if (response.status == 200) {
        for (var video in response.body['videos']) {
          vods.add(CimosVODS.fromJson(video));
          anwerError = true;
          numberVideosResponse = response.body['videos'];
        }
      } else if (response.status == 401) {
        erroToken = true;
        _isLoading = false;
        isLoadingScroll = false;
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
              scrollController.position.maxScrollExtent &&
          numberVideosResponse.length == 5 &&
          !erroToken) {
        fetchData();
        numberPage = numberPage + 1;
        _getVods();
      }
    });
  }

  void addElements() {
    if (numberVideosResponse.length == 5) {
      final lastId = numberElements.last;
      numberElements.addAll([1, 2, 3, 4].map((e) => lastId + e));
      setState(() {});
    }
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
    return _isLoading
        ? Center(
            child: Loaders.circular(),
          )
        : anwerError
            ? Stack(
                children: [
                  ListView.builder(
                      physics: const BouncingScrollPhysics(), // Rebote de iOS
                      controller: scrollController,
                      itemCount: numberElements.length,
                      itemBuilder: (BuildContext context, int index) {
                        return CardVideos2(video: vods[numberElements[index]]);
                      }),
                  if (isLoadingScroll)
                    Positioned(
                      bottom: 40,
                      left: size.width * 0.5 - 30,
                      child: const LoadingIcon(),
                    ),
                  if (erroToken)
                    const CustomMessageToken(
                        menssage:
                            'Otro dispositivo inicio sesion con su usuario, vuelva a iniciar sesion',
                        tittle: 'Vuelva a iniciar sesion')
                ],
              )
            : erroToken
                ? const CustomMessageToken(
                    menssage:
                        'Otro dispositivo inicio sesion con su usuario, vuelva a iniciar sesion',
                    tittle: 'Vuelva a iniciar sesion')
                : Center(
                    child: VideoPlayerText(
                    color: Colors.black,
                    size: 30,
                    value: 'No se encontraron resultados sobre "$query"',
                  ));
  }
}
