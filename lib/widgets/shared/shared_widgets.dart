import 'package:flutter/material.dart';

class Alerts {
  static Container error(String message) {
    return Container(
      padding: EdgeInsets.all(20),
      child: Column(
        children: <Widget>[
          const Icon(
            Icons.error,
            color: Colors.red,
            size: 50,
          ),
          const SizedBox(
            height: 20,
          ),
          Text(
            message,
            style: const TextStyle(
              fontSize: 20,
              color: Colors.red,
            ),
          ),
        ],
      ),
    );
  }
}

class Loaders {
  static CircularProgressIndicator circular() {
    return const CircularProgressIndicator(
      backgroundColor: Colors.white,
      color: Color.fromRGBO(170, 89, 89, 1),
    );
  }
}
