import 'package:flutter/material.dart';

class LogoContainer extends StatelessWidget {
  const LogoContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(40),
      width: double.infinity,
      height: 240,
      child: const FadeInImage(
        placeholder: AssetImage('assets/logo5.png'),
        image: AssetImage('assets/logo5.png'),
      ),
    );
  }
}
