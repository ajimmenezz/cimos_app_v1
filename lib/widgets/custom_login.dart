import 'package:flutter/material.dart';
import 'package:cimos_v1/widgets/widgets.dart' show LoadingIcon;
import 'package:shared_preferences/shared_preferences.dart';

import '/models/http_response.dart';
import 'package:cimos_v1/http/http_exec.dart';

import 'package:cimos_v1/theme/cimos_theme.dart';

class CustomLogin extends StatefulWidget {
  const CustomLogin({Key? key}) : super(key: key);

  @override
  State<CustomLogin> createState() => _CustomLoginState();
}

// Inicializacion de UserData
String user = "";
String password = "";

class _CustomLoginState extends State<CustomLogin> {
  late HttpResponse response;
  bool access = false;
  bool login = false;
  bool mensaje = false;
  Future<void> _getVods(user, psw) async {
    response = await HttpExec.getResponse(
        endPoint: 'https://api.cimos.mx/v1/Login?usr=$user&pwd=$psw');

    setState(() {
      if (response.status == 200) {
        validationAccess(response);
        saveDataGlobal(response);
      } else {
        menssageError();
      }
    });
  }

  validationAccess(respon) async {
    login = true;
    await Future.delayed(const Duration(seconds: 3));
    login = false;
    Navigator.of(context).pop();
    Navigator.pushNamed(context, '/home');
  }

  menssageError() async {
    mensaje = true;
    await Future.delayed(const Duration(seconds: 3));
    mensaje = false;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Stack(children: [
      Column(
        children: [
          const SizedBox(height: 60),
          TextFormField(
              onChanged: (value) => {user = value},
              decoration: const InputDecoration(
                  hintText: 'Usuario o Email',
                  hintStyle:
                      TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                  suffixIcon: Icon(Icons.home, size: 40),
                  contentPadding:
                      EdgeInsets.only(left: 15, bottom: 11, top: 11, right: 15),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(10),
                      bottomRight: Radius.circular(10),
                    ),
                  ))),
          const SizedBox(height: 60),
          TextFormField(
              onChanged: (value) => {password = value},
              obscureText: true,
              decoration: const InputDecoration(
                  hintText: 'Contraseña',
                  hintStyle:
                      TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                  suffixIcon: Icon(Icons.password, size: 40),
                  contentPadding:
                      EdgeInsets.only(left: 15, bottom: 11, top: 11, right: 15),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(10),
                      bottomRight: Radius.circular(10),
                    ),
                  ))),
          const SizedBox(height: 50),
          ElevatedButton(
              style: ElevatedButton.styleFrom(
                  fixedSize: const Size(230, 50),
                  primary: CimosTheme.primary,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50))),
              onPressed: () {
                _getVods(user, password);
              },
              child: const Text('Ingresar', style: TextStyle(fontSize: 20))),
          const SizedBox(height: 20),
          if (login)
            Positioned(
              bottom: 30,
              top: 400,
              left: size.width * 0.5 - 30,
              child: const LoadingIcon(),
            ),
          if (mensaje)
            const AlertDialog(
              content: Text(
                'Usuario o Contraseña incorrectos',
                textAlign: TextAlign.center,
              ),
            )
        ],
      ),
    ]);
  }
}

saveDataGlobal(respon) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.setString('token', respon.body['user']['Token']);
  prefs.setString('email', respon.body['user']['Email']);
  prefs.setString('name', respon.body['user']['Name']);
  prefs.setString('short', respon.body['user']['Short']);
}
