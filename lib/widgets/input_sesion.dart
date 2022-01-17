import 'package:flutter/material.dart';

class CustomInputSesion extends StatelessWidget {
  final String? hintext;
  final IconData? icon;
  final bool obscureText;
  const CustomInputSesion({
    Key? key,
    this.hintext,
    this.icon,
    this.obscureText = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
        obscureText: obscureText,
        decoration: InputDecoration(
            hintText: hintext,
            hintStyle:
                const TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
            suffixIcon: Icon(icon, size: 40),
            contentPadding: EdgeInsets.only(left: 15, bottom: 11, top: 11, right: 15),
            border: const OutlineInputBorder(
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(10),
                bottomRight: Radius.circular(10),
              ),
            )));
  }
}
