import 'package:flutter/material.dart';
import 'package:cimos_v1/widgets/widgets.dart';

class CustomRegister extends StatelessWidget {
  const CustomRegister({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 30),

        CustomInputSesion(
          hintext: 'Usuario o Email',
          icon: Icons.person,
        ),

        const SizedBox(height: 50),

        CustomInputSesion(
            hintext: 'Contraseña', icon: Icons.password, obscureText: true),

        const SizedBox(height: 50),

        CustomInputSesion(
            hintext: 'Confirmar Contraseña',
            icon: Icons.check,
            obscureText: true),

        const SizedBox(height: 50),

        ElevatedButton(
          style: ElevatedButton.styleFrom(
              fixedSize: const Size(230, 50),
              primary: Colors.red[900],
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50))),
          onPressed: () {},
          child: const Text(
            'Registrarse',
            style: TextStyle(fontSize: 20),
          ),
        ),

        const SizedBox(height: 50),

        const Text('Tambien puedes acceder por',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
        // Botones de correos facebook, google
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton(
                onPressed: () {},
                icon: const Icon(Icons.email),
                iconSize: MediaQuery.of(context).size.width * .15),
            IconButton(
                onPressed: () {},
                icon: const Icon(Icons.facebook),
                iconSize: MediaQuery.of(context).size.width * .15),
          ],
        )
      ],
    );
  }
}
