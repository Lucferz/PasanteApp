import 'dart:convert';

class PersonasTipo {
  int? pt_id;
  String pt_tipo;

  PersonasTipo({
    this.pt_id,
    required this.pt_tipo,
  });

  factory PersonasTipo.fromJson(String str) => PersonasTipo.fromMap(json.decode(str));
  String toJson() => json.encode(toMap());

  factory PersonasTipo.fromMap(Map<String,dynamic> json) => PersonasTipo(
    pt_id: json['pt_id'],
    pt_tipo: json['pt_tipo'],
  );

  Map <String, dynamic> toMap() => {
    "pt_id": this.pt_id,
    "pt_tipo": this.pt_tipo,
  };


  PersonasTipo copy () => PersonasTipo(
    pt_id: this.pt_id,
    pt_tipo: this.pt_tipo,
  );

}