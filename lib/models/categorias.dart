import 'dart:convert';

class Categorias {
  int? cat_id;
  String cat_nombre;

  Categorias({
    this.cat_id,
    required this.cat_nombre,
  });

  factory Categorias.fromJson(String str) => Categorias.fromMap(json.decode(str));
  String toJson() => json.encode(toMap());

  factory Categorias.fromMap(Map<String,dynamic> json) => Categorias(
    cat_id: json['cat_id'],
    cat_nombre: json['cat_nombre'],
  );

  Map <String, dynamic> toMap() => {
    "cat_id": this.cat_id,
    "cat_nombre": this.cat_nombre,
  };


  Categorias copy () => Categorias(
    cat_id: this.cat_id,
    cat_nombre: this.cat_nombre,
  );

}