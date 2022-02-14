import 'package:flutter/material.dart';

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
          children: [],
        ));
  }
}
