import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;
import 'package:pasante_app/models/models.dart';

class AuthService extends ChangeNotifier{
  final String _baseUrl='identitytoolkit.googleapis.com';
  final String _firebaseToken = 'AIzaSyA4sqQ7iAwh4OE3Dlbx_B1HYA83qSTy8W4';
  final storage = new FlutterSecureStorage();
  final _auth = FirebaseAuth.instance;


  Future<String?> createUser(Personas per) async {
    final String email = per.per_email;
    final String password = per.per_senha;

    try {
      await _auth.createUserWithEmailAndPassword(email: email, password: password);
    }on FirebaseAuthException catch(e){
      print("llego en exception de firebase singup");
      print("${e.code} - ${e.message}");
      print(e.stackTrace);
      return "${e.message}";
    }catch (ex) {
      print("llego en exception de singup");
      print(ex.toString());
    }

    return null;


    // final Map<String, dynamic> authData = {
    //   'email' : email, 
    //   'password' : password
    // };

    // final url = Uri.https(_baseUrl, '/v1/accounts:signUp', {
    //   'key': _firebaseToken
    // });

    // final res = await http.post(
    //   url,
    //   body: json.encode(authData)
    // );

    // final Map<String, dynamic> decodeRes = json.decode(res.body);

    // if(decodeRes.containsKey('idToken')){
    //   return null;
    // }else{
    //   return decodeRes['error']['message'];
    // }
  }

  /*Revisar paquete flutter_secure_Storage en pub.dev*/

  Future<String?> login(String email, String password) async{
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
    }on FirebaseAuthException catch(e){
      print("llego en exception de firebase login");
      print("${e.code} - ${e.message}");
      print(e.stackTrace);
      return "${e.message}";
    }catch (ex) {
      print("llego en exception de login");
      print(ex.toString());
    }

    return null;

/*
    final Map<String, dynamic> authData = {
      'email' : email, 
      'password' : password
    };

    final url = Uri.https(_baseUrl, '/v1/accounts:signInWithPassword', {
      'key': _firebaseToken
    });

    final res = await http.post(
      url,
      body: json.encode(authData)
    );

    final Map<String, dynamic> decodeRes = json.decode(res.body);

    if(decodeRes.containsKey('idToken')){
      await storage.write(key: 'token', value: decodeRes['idToken']);
      return null;
    }else{
      return decodeRes['error']['message'];
    }*/
  }

  Future logout() async{
    await storage.delete(key: 'token');
    return null;
  }

  Future<String> readToken() async{
    return await storage.read(key: 'token')?? '';
  }
}