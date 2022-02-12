import 'package:shared_preferences/shared_preferences.dart';

  removeDataGlobal() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove('token');
    prefs.remove('email');
    prefs.remove('name');
    prefs.remove('short');
  }

