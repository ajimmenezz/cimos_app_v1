import 'package:flutter/material.dart';

class LogoContainer extends StatelessWidget {
  const LogoContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 300, 
      child: const FadeInImage(
        placeholder: NetworkImage('https://via.placeholder.com/200x300'),
        image: AssetImage('assets/logo5.png'),
      ),
    );
  }
}
