import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:pasante_app/models/models.dart';
import 'package:http/http.dart' as http;

class PersonaService extends ChangeNotifier{
  final String _baseUrl = 'https://pasanteapp-default-rtdb.firebaseio.com';
  final List<Personas> personas = [];

  late Personas selectedPerson;

  bool isLoading = true;
  bool isSaving = false;
  ProductService(){
    this.loadPersonas();
  }

  Future <List<Personas>> loadPersonas() async{

    this.isLoading = true;
    notifyListeners();

    final url = Uri.https(_baseUrl,'personas.json');

    final resp = await http.get(url);

    final Map<String, dynamic> productsMap = json.decode(resp.body);

    productsMap.forEach((key, value) {
      final tempPer = Personas.fromMap(value);
      tempPer.per_id= int.parse(key);
      this.personas.add(tempPer);
    });

    this.isLoading = false;
    notifyListeners();
    print(this.personas[0].per_nombre);
    return this.personas;
  }

  Future saveOrCreateProduct(Personas per) async {
    isSaving = true;
    notifyListeners();
    if(per.per_id == null){
      //crear
      await this.createPersona(per);
    }else{
      //actualizar
      await this.updatePersona(per);
    }

    isSaving = false;
    notifyListeners();
  }

  Future<String> updatePersona ( Personas per) async {
    final url = Uri.https(_baseUrl,'personas/${per.per_id}.json');

    final resp = await http.put(url, body: per.toJson());

    final decodeData = json.decode(resp.body);

    final index = this.personas.indexWhere((element)=>element.per_id == per.per_id);
    this.personas[index] = per;

    return per.per_nombre!;
  }

  Future<String> createPersona( Personas per) async{

    final url = Uri.https(_baseUrl,'personas.json');

    final resp = await http.post(url, body: per.toJson());

    final decodeData = json.decode(resp.body);

    per.per_id = decodeData['name'];

    this.personas.add(per);

    return per.per_nombre!;
  }

  Future<Personas> getPersonaByEmail (String email) async{
    final url = Uri.https(_baseUrl,'personas.json?orderBy="per_email"&equalTo="$email"');
    final resp = await http.get(url);

    return Personas.fromJson(resp.toString());

  }
}