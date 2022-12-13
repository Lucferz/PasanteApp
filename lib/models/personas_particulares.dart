import 'dart:convert';
import 'package:pasante_app/models/models.dart';

class PersonasParticulares {
  dynamic? perpar_id;
  Personas fk_persona;
  PersonasTipo fk_per_tipo;
  Map<String, dynamic>? perpar_competencias;
  String? perpar_ci;

  PersonasParticulares({
    this.perpar_id,
    required this.fk_persona,
    required this.fk_per_tipo,
    this.perpar_competencias,
    this.perpar_ci,
  });

  factory PersonasParticulares.fromJson(String str) => PersonasParticulares.fromMap(json.decode(str));
  String toJson() => json.encode(toMap());

  factory PersonasParticulares.fromMap(Map<String,dynamic> json) => PersonasParticulares(
    perpar_id: json['perpar_id'],
    fk_persona: json['fk_persona'],
    fk_per_tipo: json['fk_per_tipo'],
    perpar_competencias:json['perpar_competencias'] ,
    perpar_ci: json['perpar_ci'],
  );

  Map <String, dynamic> toMap() => {
    "perpar_id": this.perpar_id,
    "fk_persona": this.fk_persona.toMap(),
    "fk_per_tipo": this.fk_per_tipo.toMap(),
    "perpar_competencias":this.perpar_competencias ,
    "perpar_ci": this.perpar_ci,
  };


  PersonasParticulares copy () => PersonasParticulares(
    perpar_id: this.perpar_id,
    fk_persona: this.fk_persona,
    fk_per_tipo: this.fk_per_tipo,
    perpar_competencias:this.perpar_competencias ,
    perpar_ci: this.perpar_ci,
  );

}