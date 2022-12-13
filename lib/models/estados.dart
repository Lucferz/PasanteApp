import 'dart:convert';

class Estados {
  int? e_id;
  String? e_codigo;
  String e_descipcion;

  Estados({
    this.e_id,
    required this.e_codigo,
    required this.e_descipcion,
  });

  factory Estados.fromJson(String str) => Estados.fromMap(json.decode(str));
  String toJson() => json.encode(toMap());

  factory Estados.fromMap(Map<String,dynamic> json) => Estados(
    e_id: json['e_id'],
    e_codigo: json['e_codigo'],
    e_descipcion: json['e_descipcion'],
  );

  Map <String, dynamic> toMap() => {
    "e_id": this.e_id,
    "e_codigo": this.e_codigo,
    "e_descipcion": this.e_descipcion,
  };


  Estados copy () => Estados(
    e_id: this.e_id,
    e_codigo: this.e_codigo,
    e_descipcion: this.e_descipcion,
  );

}