import 'package:flutter/material.dart';
import 'package:cimos_v1/widgets/widgets.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const LogoContainer(),
              const SizedBox(height: 5),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextButton(
                      onPressed: () {},
                      child: Text('Usuario o Email',
                          style:
                              TextStyle(fontSize: 20, color: Colors.red[900]))),
                  // TextButton(
                  //     onPressed: () {},
                  //     child: Text('Regitro',
                  //         style:
                  //             TextStyle(fontSize: 20, color: Colors.red[900]))),
                ],
              ),
              Column(
                children: [
                  Container(
                   // Mirar
                    margin: const EdgeInsets.only(bottom: 30),
                    width: double.infinity,
                    height: 500,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: [
                        // Contenedor de inicio de sesion
                        Container(
                          padding: const EdgeInsets.only(left: 10, right: 10),
                          color: Colors.white,
                          width: MediaQuery.of(context).size.width,
                          child:const Form(
                            child: CustomLogin(),
                          ),
                        ),
                        SizedBox(width: MediaQuery.of(context).size.width * .05), // Division
                        // Contenedor de registro
                        // Container(
                        //   padding: const EdgeInsets.only(left: 10, right: 10),
                        //   color: Colors.white,
                        //   width: MediaQuery.of(context).size.width,
                        //   child: const Form(
                        //     child: CustomRegister(),
                        //   ),
                        // ),
                      ],
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
