import 'package:flutter/material.dart';

import 'package:shared_preferences/shared_preferences.dart';

import 'package:cimos_v1/widgets/widgets.dart' show CustomButtonBar;
import 'package:cimos_v1/theme/cimos_theme.dart';

class ProfilePageScreen extends StatelessWidget {
  const ProfilePageScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Profile'),
          backgroundColor: CimosTheme.primary,
        ), bottomNavigationBar: const CustomButtonBar(),
        body: Center(
            child: Column(
          children: [
            CircleAvatar(
              child: Text('JJ'),
              backgroundColor: Colors.black,
            ),
            const Text('Edit profile'),
            ElevatedButton(
              child: const Text('Cerrar mi sesion'),
              style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all(CimosTheme.primary)),
              onPressed: () {
                removeDataGlobal();
                Navigator.of(context).pop();
                Navigator.pushNamed(context, '/login');
              },
            ),
          ],
        )));
  }
}

removeDataGlobal() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.remove('token');
  prefs.remove('email');
  prefs.remove('name');
  prefs.remove('short');
}

getDataGlobal() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  String short = prefs.getString('Short').toString();
  return short;
}
