import 'package:flutter/material.dart';
import 'package:cimos_v1/widgets/widgets.dart';

class HomePageScreen extends StatelessWidget {
  const HomePageScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Cimos'), backgroundColor: Colors.red[900],),
     bottomNavigationBar: const CustomButtonBar(),
    );
  }
}