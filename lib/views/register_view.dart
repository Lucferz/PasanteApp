import 'package:flutter/material.dart';
import 'package:pasante_app/models/models.dart';
import 'package:pasante_app/services/services.dart';
import 'package:pasante_app/widgets/widgets.dart';
import 'package:provider/provider.dart';
import '/ui/input_decoration.dart';

class RegisterViewFirstStep extends StatefulWidget {
  @override
  State<RegisterViewFirstStep> createState() => _RegisterViewFirstStepState();
}

class _RegisterViewFirstStepState extends State<RegisterViewFirstStep> {
  //const RegisterViewFirstStep({Key? key}) : super(key: key);

  final emailController = TextEditingController();
  final passController = TextEditingController();
  final passVerifyController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: _register_view1(emailController: emailController, passController: passController, passVerifyController: passVerifyController),
      ),
    );
  }
}

class RegisterViewSecondStep extends StatelessWidget {
  //const RegisterViewSecondStep({Key? key}) : super(key: key);
  final dynamic newPerson;
  
  const RegisterViewSecondStep({
    Key? key,
    required this.newPerson
  });
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Register_view2(newPerson: newPerson),
      ),
    );
  }
}

class RegisterViewEmpresa extends StatelessWidget {
  //const RegisterViewEmpresa({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: _register_empresa(),
      ),
    );
  }
}

class RegisterViewPersonal extends StatelessWidget {
  final PersonasParticulares newPersonaParticular;
  const RegisterViewPersonal({
    Key? key,
    required this.newPersonaParticular
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: _register_persona_optional(newPersonaParticular: newPersonaParticular),
      ),
    );
  }
}

class Register_view2 extends StatefulWidget {
  final dynamic newPerson;
  
  const Register_view2({
    Key? key,
    required this.newPerson
  });
  
    @override
    State<Register_view2> createState() => _register_view2(newPerson: newPerson);
}

class _register_view1 extends StatelessWidget {
  final TextEditingController emailController;
  final TextEditingController passController;
  final TextEditingController passVerifyController;
  const _register_view1({
    Key? key,
    required this.emailController,
    required this.passController,
    required this.passVerifyController

  });

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
                    controller: emailController,
                  ),
                  SizedBox(height: 35,),
                  TextFormField(
                    autocorrect: false,
                    obscureText: true,
                    keyboardType: TextInputType.visiblePassword,
                    decoration: InputDecorations.authInputDecoration(
                      hintText: "MiContraseña", 
                      labelText: "Contraseña",
                      prefixIcon: Icons.lock,
                    ),
                    controller: passController,
                  ),
                  SizedBox(height: 35,),
                  TextFormField(
                    autocorrect: false,
                    obscureText: true,
                    keyboardType: TextInputType.visiblePassword,
                    decoration: InputDecorations.authInputDecoration(
                      //hintText: "MiContraseña", 
                      hintText: '',
                      labelText: "Confirmar Contraseña",
                      prefixIcon: Icons.lock,
                    ),
                    controller: passVerifyController,
                  ),
                ],
              ),
            ),
            //SizedBox(height: ,),
            NavigationBtns(
              NextBtnFunc: () {
                String email = emailController.text;
                String pass;
                var newPerson;
                if (passController.text == passVerifyController.text){
                  pass = passController.text;
                  newPerson= Personas(per_email: email, per_senha: pass);
                }
                print('Va al segundo paso del Registro');
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => RegisterViewSecondStep(newPerson: newPerson),
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
  final dynamic newPerson;
  
  _register_view2({
    required this.newPerson
  });

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
                if(_datosDelRadio == DatosDelRadio.Personal){
                  PersonasParticulares particular = PersonasParticulares(
                    fk_persona: newPerson, 
                    fk_per_tipo: PersonasTipo(pt_tipo: "usuario particular", 
                    pt_id:1 )
                  );

                  print('Se registro como persona');
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => RegisterViewPersonal(newPersonaParticular: particular),
                    ),
                  );
                  
                }else{
                  print('Eligio Empresa');
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => RegisterViewEmpresa(),
                    ),
                  );
                }
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
//Para una nueva version, ahora ya es suficiente si dice que es una persona
class _register_persona_optional extends StatelessWidget {
  final PersonasParticulares newPersonaParticular;
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  _register_persona_optional({
    Key? key,
    required this.newPersonaParticular
  });



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
                    keyboardType: TextInputType.name,
                    decoration: InputDecorations.authInputDecoration(
                      hintText: "Juan Perez", 
                      labelText: "Nombre",
                      prefixIcon: Icons.person,
                    ),
                    controller: nameController,
                  ),
                  SizedBox(height: 35,),
                  TextFormField(
                    autocorrect: false,
                    obscureText: true,
                    keyboardType: TextInputType.phone,
                    decoration: InputDecorations.authInputDecoration(
                      //hintText: "MiContraseña", 
                      hintText: '+59599x xxx xxx',
                      labelText: "Telefono de contacto",
                      prefixIcon: Icons.phone_android,
                    ),
                    controller: phoneController,
                  ),
                ],
              ),
            ),
            //SizedBox(height: ,),
            NavigationBtns(NextBtnFunc: () async {
                print('Se registro como persona');
                newPersonaParticular.fk_persona.per_telefono = phoneController.text;
                newPersonaParticular.fk_persona.per_nombre = nameController.text;
                print(newPersonaParticular.toMap());
                final authService = Provider.of<AuthService>(context, listen: false);
                if(nameController.text != null && phoneController.text != null){
                  final String? errMsg = await authService.createUser(newPersonaParticular);
                  if ( errMsg == null){
                    Navigator.popAndPushNamed(
                      context, 
                      'feed', 
                      arguments: newPersonaParticular
                    );
                  } 
                }
                //funcion de registro con algun parametro que indique que se trata de una persona async
              },
              nextBtnText: "Crear",
            ),
          ],
        ),
      ),
    );
  }
}

class _register_empresa extends StatelessWidget {
  const _register_empresa({Key? key}) : super(key: key);

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
                    keyboardType: TextInputType.name,
                    decoration: InputDecorations.authInputDecoration(
                      hintText: "EL Sol S.A.", 
                      labelText: "Nombre de la Empresa",
                      prefixIcon: Icons.business_rounded,
                    ),
                  ),
                  SizedBox(height: 35,),
                  TextFormField(
                    autocorrect: false,
                    obscureText: true,
                    keyboardType: TextInputType.text,
                    decoration: InputDecorations.authInputDecoration(
                      hintText: "Santa Rita", 
                      labelText: "Ciudad donde reside la Empresa",
                      prefixIcon: Icons.location_city,
                    ),
                  ),
                  SizedBox(height: 35,),
                  TextFormField(
                    autocorrect: false,
                    obscureText: true,
                    keyboardType: TextInputType.phone,
                    decoration: InputDecorations.authInputDecoration(
                      //hintText: "MiContraseña", 
                      hintText: '+59599x xxx xxx',
                      labelText: "Telefono de contacto de la empresa",
                      prefixIcon: Icons.phone_android,
                    ),
                  ),
                ],
              ),
            ),
            //SizedBox(height: ,),
            NavigationBtns(NextBtnFunc: () {
                print('Se registro como Empresa');
                //funcion de registro con algun parametro que indique que se trata de una empresa async
              },
              nextBtnText: "Crear",
            ),
          ],
        ),
      ),
    );
  }
}


// hacer en el futuro, pq asi ya da
class _register_empresa_optional extends StatelessWidget {
  const _register_empresa_optional({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: null,
    );
  }
}