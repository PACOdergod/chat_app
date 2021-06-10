
// To parse this JSON data, do
//
//     final usuario = usuarioFromJson(jsonString);

import 'dart:convert';

Usuario usuarioFromJson(String str) => Usuario.fromJson(json.decode(str));

String usuarioToJson(Usuario data) => json.encode(data.toJson());

class Usuario {
    Usuario({
        this.id,
        this.nombre,
        this.email,
    });

    String id;
    String nombre;
    String email;

    factory Usuario.fromJson(Map<String, dynamic> json) => Usuario(
        id: json["id"],
        nombre: json["nombre"],
        email: json["email"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "nombre": nombre,
        "email": email,
    };
}
