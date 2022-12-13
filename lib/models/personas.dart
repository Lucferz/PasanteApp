import 'dart:convert';

class Personas {

  dynamic? per_id;
  String? per_nombre;
  String per_email;
  String per_senha;
  String? per_usuario;
  String? per_bio;
  var per_fecha_c;
  var per_fecha_mod;
  String? per_barrio;
  String? per_telefono;
  String? per_website;
  bool? per_estado = true;


  Personas({
    this.per_id,
    this.per_nombre,
    required this.per_email,
    required this.per_senha,
    this.per_usuario,
    this.per_bio,
    this.per_barrio,
    this.per_telefono,
    this.per_website,
    this.per_estado,
  });

  factory Personas.fromJson(String str) => Personas.fromMap(json.decode(str));
  String toJson() => json.encode(toMap());

  factory Personas.fromMap(Map<String,dynamic> json) => Personas(
    per_id: json['per_id'],
    per_nombre: json['per_nombre'],
    per_email: json['per_email'],
    per_senha:json['per_senha'] ,
    per_usuario: json['per_usuario'],
    per_bio: json['per_bio'],
    per_barrio: json['per_barrio'],
    per_telefono: json['per_telefono'],
    per_website: json['per_website'],
    per_estado: json['per_estado']=='true' || json['per_estado']==null || json['per_estado']=='null'? true:false,
  );

  Map <String, dynamic> toMap() => {
    "per_id": this.per_id,
    "per_nombre": this.per_nombre,
    "per_email": this.per_email,
    "per_senha":this.per_senha ,
    "per_usuario": this.per_usuario,
    "per_bio": this.per_bio,
    "per_barrio": this.per_barrio,
    "per_telefono": this.per_telefono,
    "per_website": this.per_website,
    "per_estado": this.per_estado,
  };


  Personas copy () => Personas(
    per_id: this.per_id,
    per_nombre: this.per_nombre,
    per_email: this.per_email,
    per_senha:this.per_senha ,
    per_usuario: this.per_usuario,
    per_bio: this.per_bio,
    per_barrio: this.per_barrio,
    per_telefono: this.per_telefono,
    per_website: this.per_website,
    per_estado: this.per_estado,
  );
}