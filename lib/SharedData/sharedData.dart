import 'package:shared_preferences/shared_preferences.dart';

class Save {
  salvar(respon) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    Future<bool> email = prefs.setString('token', respon.body['user']['Token']);
  }
}
