import 'package:flutter/material.dart';

class CustomInputSesion extends StatelessWidget {
  final String? hintext;
  final IconData? icon;
  final bool obscureText;
  late String? valueInit;
  CustomInputSesion({
    Key? key,
    this.hintext,
    this.icon,
    this.obscureText = false,
    this.valueInit,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
        onChanged: (value) => {
          valueInit = value
        },
        obscureText: obscureText,
        decoration: InputDecoration(
            hintText: hintext,
            hintStyle:
                const TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
            suffixIcon: Icon(icon, size: 40),
            contentPadding:
                const EdgeInsets.only(left: 15, bottom: 11, top: 11, right: 15),
            border: const OutlineInputBorder(
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(10),
                bottomRight: Radius.circular(10),
              ),
            )));
  }
}
