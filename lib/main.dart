import 'package:flutter/material.dart';
import 'package:pasante_app/views/views.dart';
 
void main() => runApp(MyApp());
 
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      initialRoute: 'login',
      routes: {
        'login':( _ ) => LoginView(),
        'feed':( _ ) => FeedView(),
        'register_step1': (context) => RegisterViewFirstStep(),
      },
      theme: ThemeData.light().copyWith(
        scaffoldBackgroundColor: Colors.grey[200],
      ),
    );
  }
}