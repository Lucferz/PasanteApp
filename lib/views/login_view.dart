import 'package:flutter/material.dart';
import 'package:pasante_app/providers/providers.dart';
import 'package:pasante_app/services/services.dart';
import 'package:provider/provider.dart';

import '../ui/input_decoration.dart';


class LoginView extends StatelessWidget {
  //const LoginView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child:ChangeNotifierProvider(
          create: (context) => LoginFormProvider(),
          child: _loginForm(),
        )
      ),
    );
  }
}

class _loginForm extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final loginForm = Provider.of<LoginFormProvider>(context);
    return Container(
      child: Form(
        key: loginForm.formkey,
        autovalidateMode: AutovalidateMode.onUserInteraction,
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
                    onChanged: (value) => loginForm.email = value,
                    validator: (value) {
                      String pattern = r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
            
                      RegExp regExp  = new RegExp(pattern);
            
                      return regExp.hasMatch(value?? '') ? null : 'Porfavor ingrese una direccion de correo electronico valida';
                    }
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
                    onChanged: (value) => loginForm.password = value,
                    validator: (value) {
                      if (value != null && value.length >=6) return null;
                      return 'La Contraseña debe ser mayor a 6 caracteres';
                    },
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
                      onPressed:loginForm.isLoading?null: () async {
                        FocusScope.of(context).unfocus();
                        final authService = Provider.of<AuthService>(context, listen: false);

                        if(!loginForm.isValidForm()){
                          print(loginForm.isValidForm());
                          return null;
                        }
                        loginForm.isLoading = true;
                        final String? errMsg = await authService.login(loginForm.email, loginForm.password);
                        print('El errMs es: $errMsg');
                        if(errMsg == null){
                          // final Personas person = personaService.getPersonaByEmail(loginForm.email);
                          // final dynamic theUser = personaService.getUserByPersona(person);
                          Navigator.popAndPushNamed(
                              context, 
                              'feed', 
                              // arguments: theUser
                              arguments: null
                          );
                        }else{
                          NotificationService.shawnSnakbar(errMsg);
                          print(errMsg);
                          loginForm.isLoading = false;
                        }
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