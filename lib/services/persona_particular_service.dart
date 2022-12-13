import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:pasante_app/models/models.dart';
import 'package:http/http.dart' as http;

class PersonaParticularService extends ChangeNotifier{
  final String _baseUrl = 'https://pasanteapp-default-rtdb.firebaseio.com';
  final List<PersonasParticulares> personasParticulares = [];

  late PersonasParticulares selectedParticularPerson;

  bool isLoading = true;
  bool isSaving = false;
  PersonaParticularService(){
    this.loadPersonasParticulares();
  }

  Future <List<PersonasParticulares>> loadPersonasParticulares() async{

    this.isLoading = true;
    notifyListeners();

    final url = Uri.https(_baseUrl,'personas_particulares.json');

    final resp = await http.get(url);

    final Map<String, dynamic> productsMap = json.decode(resp.body);

    productsMap.forEach((key, value) {
      final tempPer = PersonasParticulares.fromMap(value);
      tempPer.perpar_id=key;
      this.personasParticulares.add(tempPer);
    });

    this.isLoading = false;
    notifyListeners();
    print(this.personasParticulares[0].fk_persona);
    return this.personasParticulares;
  }

  Future saveOrCreateProduct(PersonasParticulares perpar) async {
    isSaving = true;
    notifyListeners();
    if(perpar.perpar_id == null){
      //crear
      await this.createPersona(perpar);
    }else{
      //actualizar
      await this.updatePersona(perpar);
    }

    isSaving = false;
    notifyListeners();
  }

  Future<String> updatePersona ( PersonasParticulares perpar) async {
    final url = Uri.https(_baseUrl,'personas_particulares/${perpar.perpar_id}.json');

    final resp = await http.put(url, body: perpar.toJson());

    final decodeData = json.decode(resp.body);

    final index = this.personasParticulares.indexWhere((element)=>element.perpar_id == perpar.perpar_id);
    this.personasParticulares[index] = perpar;

    return perpar.perpar_id!;
  }

  Future<String> createPersona( PersonasParticulares perpar) async{

    final url = Uri.https(_baseUrl,'personas_particulares.json');

    final resp = await http.post(url, body: perpar.toJson());

    final decodeData = json.decode(resp.body);

    perpar.perpar_id = decodeData['name'];

    this.personasParticulares.add(perpar);

    return perpar.perpar_id!;
  }

  Future<PersonasParticulares> getPersonaByPerId (int per_id) async{
    final url = Uri.https(_baseUrl,'personas_particulares.json?orderBy="fk_persona"&equalTo=$per_id');
    final resp = await http.get(url);

    return PersonasParticulares.fromJson(resp.toString());

  }
}