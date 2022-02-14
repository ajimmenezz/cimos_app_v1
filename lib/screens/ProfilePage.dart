import 'package:cimos_v1/main.dart';
import 'package:cimos_v1/providers/ui_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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
        ),
        bottomNavigationBar: const CustomButtonBar(),
        body: Center(
            child: Column(
          children: [
            const CircleAvatar(
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
                // removeDataGlobal();
                Navigator.of(context).pop();
                Navigator.pushNamed(context, '/login');
              },
            ),
          ],
        )));
  }
}

removeDataGlobal(context) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  await prefs.remove('token');
  await prefs.remove('email');
  await prefs.remove('name');
  await prefs.remove('short');
  Navigator.of(context).pop();
  Navigator.pushNamed(context, '/login');
}
