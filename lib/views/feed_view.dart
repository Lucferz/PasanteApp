import 'package:flutter/material.dart';

class FeedView extends StatelessWidget {
  //const FeedView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: _feed_view(),
    );
  }
}

class _feed_view extends StatelessWidget {
  const _feed_view({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pagina de Inicio'),
        actions: [
          IconButton(
            onPressed: () {
              //authService.logout();
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
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          // productService.selectedProduct = new Productos(available: false, name: '', price: 0);
          Navigator.pushNamed(context, 'product');
        },
      ),
    );
  }
}