import 'dart:convert';

import 'package:pasante_app/models/models.dart';

class Postulaciones {
/* se van a ver de manera filtrada, los postulantes van a ver todas las 
postulaciones filtradas por su usuario y las empresas pueden ver todas
las postulaciones por el codigo unico de la convocatoria*/
  int? pos_id;
  PersonasParticulares fk_persona;
  Convocatorias fk_convocatoria;
  String pos_codigo;
  Estados pos_estado;
  var pos_fecha_c;
  var pos_fecha_mod;

  Postulaciones({
    this.pos_id,
    required this.fk_persona,
    required this.fk_convocatoria,
    required this.pos_codigo,
    required this.pos_estado,
  });

  factory Postulaciones.fromJson(String str) => Postulaciones.fromMap(json.decode(str));
  String toJson() => json.encode(toMap());

  factory Postulaciones.fromMap(Map<String,dynamic> json) => Postulaciones(
    pos_id: json['pos_id'],
    fk_persona: json['fk_persona'],
    fk_convocatoria: json['fk_convocatoria'],
    pos_codigo: json['pos_codigo'],
    pos_estado:json['pos_estado'] ,
  );

  Map <String, dynamic> toMap() => {
    "pos_id": this.pos_id,
    "fk_persona": this.fk_persona,
    "fk_convocatoria": this.fk_convocatoria,
    "pos_codigo": this.pos_codigo,
    "pos_estado":this.pos_estado ,
  };


  Postulaciones copy () => Postulaciones(
    pos_id: this.pos_id,
    fk_persona: this.fk_persona,
    fk_convocatoria: this.fk_convocatoria,
    pos_codigo: this.pos_codigo,
    pos_estado:this.pos_estado ,
  );
}