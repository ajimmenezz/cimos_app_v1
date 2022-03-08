import 'package:flutter/material.dart';

import 'package:flutter_to_airplay/flutter_to_airplay.dart';
import 'package:cimos_v1/theme/cimos_theme.dart';
import 'package:cimos_v1/widgets/widgets.dart' show CustomButtonBar;

class HomePageScreen extends StatelessWidget {
  const HomePageScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext _) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Cimos'),
          backgroundColor: CimosTheme.primary,
        ),
        bottomNavigationBar: const CustomButtonBar(),
        body: Column(
          children: const [
            AirPlayRoutePickerView(
              tintColor: CimosTheme.primary,
              activeTintColor: Colors.white,
              backgroundColor: Colors.transparent,
            ),
            FlutterAVPlayerView(
              urlString:
                  'https://flutter.github.io/assets-for-api-docs/assets/videos/butterfly.mp4',
            ),
          ],
        ));
  }
}
