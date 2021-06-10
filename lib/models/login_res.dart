// To parse this JSON data, do
//
//     final loginRes = loginResFromJson(jsonString);

import 'dart:convert';

import 'package:chat_app/models/usuario.dart';

LoginRes loginResFromJson(String str) => LoginRes.fromJson(json.decode(str));

String loginResToJson(LoginRes data) => json.encode(data.toJson());

class LoginRes {
    LoginRes({
        this.ok,
        this.usuario,
        this.token,
    });

    bool ok;
    Usuario usuario;
    String token;

    factory LoginRes.fromJson(Map<String, dynamic> json) => LoginRes(
        ok: json["ok"],
        usuario: Usuario.fromJson(json["usuario"]),
        token: json["token"],
    );

    Map<String, dynamic> toJson() => {
        "ok": ok,
        "usuario": usuario.toJson(),
        "token": token,
    };
}