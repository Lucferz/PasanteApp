import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:pasante_app/firebase_options.dart';
import 'package:pasante_app/services/services.dart';
import 'package:pasante_app/views/views.dart';
import 'package:provider/provider.dart';
 
void main() {
  Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(AppState());
}

class AppState extends StatelessWidget {
   const AppState({Key? key}) : super(key: key);
 
   @override
   Widget build(BuildContext context) {
     return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AuthService())
      ],
      child: MyApp(),
     );
   }
 }
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Pasante App',
      initialRoute: 'login',
      routes: {
        'login':( _ ) => LoginView(),
        'feed':( _ ) => FeedView(),
        'register_step1': (context) => RegisterViewFirstStep(),
      },
      scaffoldMessengerKey: NotificationService.messageKey,
      theme: ThemeData.light().copyWith(
        scaffoldBackgroundColor: Colors.grey[200],
      ),
    );
  }
}