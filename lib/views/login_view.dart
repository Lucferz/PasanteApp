import 'package:flutter/material.dart';

import '../ui/input_decoration.dart';


class LoginView extends StatelessWidget {
  //const LoginView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: _loginForm(),
      ),
    );
  }
}

class _loginForm extends StatelessWidget {
  //const _loginForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Form(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            //SizedBox(height: 50,),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
              child: Center(
                child: Image.asset('img/logo_inicio.PNG'),
              ),
            ),
            //SizedBox(height: 200,),
            Container(
              width: 350,
              child: Column(
                children: [
                  TextFormField(
                    autocorrect: false,
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecorations.authInputDecoration(
                      hintText: "juan.perez@email.com", 
                      labelText: "Correo Electronico",
                      prefixIcon: Icons.alternate_email_sharp,
                    ),
                  ),
                  SizedBox(height: 35,),
                  TextFormField(
                    autocorrect: false,
                    obscureText: true,
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecorations.authInputDecoration(
                      hintText: "MiContraseña", 
                      labelText: "Contraseña",
                      prefixIcon: Icons.lock,
                    ),
                  ),
                ],
              ),
            ),
            //SizedBox(height: 100,),
            Padding(
             padding: const EdgeInsets.fromLTRB(0, 0, 0, 30),
              child: Container(
                child: Column(
                  children: [
                    MaterialButton(
                      onPressed: () {
                        print('Se quiso loguear');
                      },
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      minWidth: 300,
                      elevation: 0,
                      color: Colors.blueGrey[200],
                      child: Container(
                        padding: EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                        child: Text(
                          'Ingresar', 
                          style: TextStyle(
                            fontSize: 18,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 15,),
                    MaterialButton(
                      onPressed: () {
                        print('Va al primer paso de registro');
                        Navigator.pushNamed(context, 'register_step1');
                      },
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      hoverColor: Colors.transparent,
                      hoverElevation: 0,
                      minWidth: 300,
                      elevation: 0,
                      color: Colors.transparent,
                      child: Container(
                        padding: EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                        child: Text(
                          'Registrarse', 
                          style: TextStyle(
                            fontSize: 18,
                            decoration: TextDecoration.underline,
                            decorationThickness: double.parse('1.5'),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}