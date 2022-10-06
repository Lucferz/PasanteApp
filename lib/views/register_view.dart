import 'package:flutter/material.dart';
import 'package:pasante_app/widgets/widgets.dart';
import '/ui/input_decoration.dart';

class RegisterViewFirstStep extends StatelessWidget {
  //const RegisterViewFirstStep({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: _register_view1(),
      ),
    );
  }
}

class RegisterViewSecondStep extends StatelessWidget {
  //const RegisterViewSecondStep({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Register_view2(),
      ),
    );
  }
}

class Register_view2 extends StatefulWidget {
    @override
    State<Register_view2> createState() => _register_view2();
}

class _register_view1 extends StatelessWidget {
  const _register_view1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Form(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
           // SizedBox(height: 50,),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
              child: Center(
                child: Image.asset('img/logo_inicio.PNG'),
              ),
            ),
           // SizedBox(height: 200,),
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
                  SizedBox(height: 35,),
                  TextFormField(
                    autocorrect: false,
                    obscureText: true,
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecorations.authInputDecoration(
                      //hintText: "MiContraseña", 
                      hintText: '',
                      labelText: "Confirmar Contraseña",
                      prefixIcon: Icons.lock,
                    ),
                  ),
                ],
              ),
            ),
            //SizedBox(height: ,),
            NavigationBtns(
              NextBtnFunc: () {
                print('Va al segundo paso del Registro');
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => RegisterViewSecondStep(),
                    ),
                  );
                },
              ),
          ],
        ),
      ),
    );
  }
}

class _register_view2 extends State<Register_view2> {
  DatosDelRadio? _datosDelRadio;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Form(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
           // SizedBox(height: 50,),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
              child: Center(
                child: Image.asset('img/logo_inicio.PNG'),
              ),
            ),
           // SizedBox(height: 200,),
           Container(
              height: 200,
              margin: EdgeInsets.all(30),
              child: Column(
                children: [
                  Text('Elige el tipo de Cuenta que mas te identifique', style: TextStyle(fontSize: 22),),
                  SizedBox(height: 50,),
                  RadioBtns(
                    fontSize: 18,
                    title: DatosDelRadio.Personal.name, 
                    value: DatosDelRadio.Personal, 
                    selectedDataRadio: _datosDelRadio, 
                    onChanged: (val) => {
                      setState(() => {
                        _datosDelRadio = val
                      },)
                    },
                  ),
                  RadioBtns(
                    fontSize: 18,
                    title: DatosDelRadio.Empresa.name, 
                    value: DatosDelRadio.Empresa, 
                    selectedDataRadio: _datosDelRadio, 
                    onChanged: (val) => {
                      setState(() => {
                        _datosDelRadio = val
                      },)
                    },
                  )
                ],
              ),
            ),
            //SizedBox(height: ,),
            NavigationBtns(NextBtnFunc: () {
              print('Va a la tercera parte del registro');
              if (_datosDelRadio != null) {
                print(_datosDelRadio);
              }else{
                print('no podes pasar sin escoger alguno');
              }
            },),
          ],
        ),
      ),
    );
  }
}