import 'dart:convert';
import 'package:pasante_app/models/models.dart';

class PersonasEmpresas {
  dynamic? peremp_id;
  int fk_persona;
  int fk_per_tipo;
  Map<String, dynamic> peremp_teconologias;

  PersonasEmpresas({
    this.peremp_id,
    required this.fk_persona,
    required this.fk_per_tipo,
    required this.peremp_teconologias,
  });

  factory PersonasEmpresas.fromJson(String str) => PersonasEmpresas.fromMap(json.decode(str));
  String toJson() => json.encode(toMap());

  factory PersonasEmpresas.fromMap(Map<String,dynamic> json) => PersonasEmpresas(
    peremp_id: json['peremp_id'],
    fk_persona: json['fk_persona'],
    fk_per_tipo: json['fk_per_tipo'],
    peremp_teconologias:json['peremp_teconologias'] ,
  );

  Map <String, dynamic> toMap() => {
    "peremp_id": this.peremp_id,
    "fk_persona": this.fk_persona,
    "fk_per_tipo": this.fk_per_tipo,
    "peremp_teconologias":this.peremp_teconologias ,
  };


  PersonasEmpresas copy () => PersonasEmpresas(
    peremp_id: this.peremp_id,
    fk_persona: this.fk_persona,
    fk_per_tipo: this.fk_per_tipo,
    peremp_teconologias:this.peremp_teconologias ,
  );

}