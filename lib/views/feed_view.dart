import 'package:flutter/material.dart';
import 'package:pasante_app/models/models.dart';
import 'package:pasante_app/services/services.dart';
import 'package:pasante_app/widgets/widgets.dart';
import 'package:provider/provider.dart';

class FeedView extends StatelessWidget {
  //const FeedView({Key? key}) : super(key: key);
  final Personas? theUser;
  String? tipo_user;
  FeedView({
    super.key,
    this.theUser, 
  }): tipo_user = 'empresa';//tipo_user = theUser?.fk_per_tipo?.pt_tipo;


  @override
  Widget build(BuildContext context) {
    //se va a cambiar toda la interaccion con la base de datos a partir de ahora, dejar eso de momento, y centrarse en el disenho
    //var perpar = PersonaParticularService.getPersonaByPerId(theUser);

    return SafeArea(
      child:tipo_user == 'particular'? _feed_view_particular():tipo_user == 'empresa'?_feed_view_empresarial(): _error_view(),
    );
  }
}

class _feed_view_particular extends StatelessWidget {
  const _feed_view_particular({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Inicio'),
        backgroundColor: Color.fromARGB(255, 99, 99, 99),
        actions: [
          IconButton(
            onPressed: () {
              final authService = Provider.of<AuthService>(context, listen: false);
              authService.logout();
              Navigator.pushReplacementNamed(context, 'login')              ;
            }, 
            icon: Icon(Icons.login_outlined),
          ),
        ],
      ),
      body: ListView.builder(
        // itemCount: productService.productos.length,
        itemBuilder: (
          BuildContext context, int index)=> GestureDetector(
            onTap: () {
              // productService.selectedProduct = productService.productos[index].copy();
              Navigator.pushNamed(context, 'product');
            },
          //child: ProductCard(producto: productService.productos[index],),
        ),
      ),
    );
  }
}

class _feed_view_empresarial extends StatelessWidget {
const _feed_view_empresarial({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Inicio'),
        backgroundColor: Color.fromARGB(255, 99, 99, 99),
        actions: [
          IconButton(
            onPressed: () {
              final authService = Provider.of<AuthService>(context, listen: false);
              authService.logout();
              Navigator.pushReplacementNamed(context, 'login')              ;
            }, 
            icon: Icon(Icons.login_outlined),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(10, 10, 10, 5),
        child: ListView.builder(
          // itemCount: productService.productos.length,
          itemBuilder: (
            BuildContext context, int index)=> GestureDetector(
              onTap: () {
                // productService.selectedProduct = productService.productos[index].copy();
                Navigator.pushNamed(context, 'product');
              },
            //child: ProductCard(producto: productService.productos[index],),
            child: Posts(tipo_user: 'empresa',),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Color.fromARGB(255, 82, 106, 119),
        child: Icon(Icons.add),
        onPressed: () {
          // productService.selectedProduct = new Productos(available: false, name: '', price: 0);
          Navigator.pushNamed(context, 'product');
        },
      ),
    );
  }
}

class _error_view extends StatelessWidget{
  const _error_view({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('No se declaro ningun tipo de usuario')
        ],
      ),
    );
  }
}