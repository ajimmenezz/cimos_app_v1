import 'package:flutter/material.dart';
import 'package:cimos_v1/screens/ProfilePage.dart';

class CustomMessageToken extends StatelessWidget {
  final String tittle;
  final String menssage;
  const CustomMessageToken(
      {Key? key, required this.menssage, required this.tittle})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color.fromRGBO(0, 0, 0, 0.1),
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: AlertDialog(
        elevation: 5,
        title: Text(tittle),
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadiusDirectional.circular(10)),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(menssage),
            const SizedBox(height: 10),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () {
              removeDataGlobal(context);
            },
            child: const Text('Ok'),
          ),
        ],
      ),
    );
  }
}