import 'dart:convert';

import 'package:pasante_app/models/models.dart';

class Convocatorias {
  int? conv_id;
  PersonasEmpresas fk_empresa;
  List<Categorias> fk_categoria;
  String conv_nombre;
  String conv_descripcion;
  var conv_fecha_c;
  var conv_fecha_mod;
  Estados conv_estado;

  Convocatorias ({
    this.conv_id,
    required this.fk_empresa,
    required this.fk_categoria,
    required this.conv_nombre,
    required this.conv_descripcion,
    required this.conv_estado,
  });

  factory Convocatorias.fromJson(String str) => Convocatorias.fromMap(json.decode(str));
  String toJson() => json.encode(toMap());

  factory Convocatorias.fromMap(Map<String,dynamic> json) => Convocatorias(
    conv_id: json['conv_id'],
    fk_empresa: json['fk_empresa'],
    fk_categoria: json['fk_categoria'],
    conv_nombre: json['conv_nombre'],
    conv_descripcion:json['conv_descripcion'] ,
    conv_estado: json['conv_estado'],
  );

  Map <String, dynamic> toMap() => {
    "conv_id": this.conv_id,
    "fk_empresa": this.fk_empresa,
    "fk_categoria": this.fk_categoria,
    "conv_nombre": this.conv_nombre,
    "conv_descripcion":this.conv_descripcion ,
    "conv_estado": this.conv_estado,
  };


  Convocatorias copy () => Convocatorias(
    conv_id: this.conv_id,
    fk_empresa: this.fk_empresa,
    fk_categoria: this.fk_categoria,
    conv_nombre: this.conv_nombre,
    conv_descripcion:this.conv_descripcion ,
    conv_estado: this.conv_estado,
  );
}