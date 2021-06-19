import 'dart:convert';

import 'package:chat_app/helpers/show_alert.dart';
import 'package:chat_app/models/usuario.dart';
import 'package:chat_app/services/type_res.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_secure_storage/flutter_secure_storage.dart';


import 'package:chat_app/global/enviroment.dart';
import 'package:chat_app/models/login_res.dart';

class AuthService with ChangeNotifier {

  Usuario usuario;

  bool _autenticando = false;
  bool get autenticando => _autenticando;
  set autenticando(bool value) {
    this._autenticando = value;
    notifyListeners();
  }
  
  Future<bool> login(String email, String password) async {

    this.autenticando = true;

    final data = {
      "email": email,
      "password": password
    };

    var _url = Uri.parse(Uri.encodeFull('${Enviroment.apiUrl}/login'));

    final res = await http.post( _url,
      body: jsonEncode(data),
      headers: {
        'Content-Type' : 'application/json'
      }
    );

    if (res.statusCode == 200) {
      final loginRes = loginResFromJson(res.body);
      this.usuario = loginRes.usuario;
      this.autenticando = false;

      await this._guardarToken(loginRes.token);

      return true;
    }

    this.autenticando = false;

    return false;
  }

  Future<TypeRes> register(
    String nombre, String email, String password, BuildContext context
  ) async {

    this.autenticando = true;

    final data = {
      'nombre': nombre,
      "email": email,
      "password": password
    };

    var _url = Uri.parse(Uri.encodeFull('${Enviroment.apiUrl}/login/new'));

    final res = await http.post( _url,
      body: jsonEncode(data),
      headers: {
        'Content-Type' : 'application/json'
      }
    );

    print(res.body);

    this.autenticando = false;

    if (res.statusCode == 200) {
      final loginRes = loginResFromJson(res.body);
      this.usuario = loginRes.usuario;

      await this._guardarToken(loginRes.token);

      return TypeRes.ok;
    }

    var resBody = jsonDecode(res.body);

    if (resBody['msg'] == "el correo ya esta registrado") {
      // ya existe el usuario
      showAlert(context, 'El correro ya esta registrado', '');

      return TypeRes.emailExist;
    }

    return TypeRes.serverError;
  }


  // Create storage
  final _storage = new FlutterSecureStorage();
  // Getter del token de forma estatica
  static Future<String> getToken() async {
    final _storage = FlutterSecureStorage();
    final token = _storage.read(key: 'token');
    return token;
  }
  static Future deleteToken() async {
    final _storage = FlutterSecureStorage();
    await _storage.delete(key: 'token');
  }


  //Verificar si tiene token
  Future<bool> isLoggedIn()async{
    final token = await this._storage.read(key: 'token');

    var _url = Uri.parse(Uri.encodeFull('${Enviroment.apiUrl}/login/renew'));

    final res = await http.get( _url,
      headers: {
        'Content-Type' : 'application/json',
        'x-token': token
      }
    );

    if (res.statusCode == 200) {
      final loginRes = loginResFromJson(res.body);
      this.usuario = loginRes.usuario;

      await this._guardarToken(loginRes.token);

      return true;
    }

    this.logauth();
    return false;
  }

  Future _guardarToken(String token)async{
    return await _storage.write(key: 'token', value: token);
  }

  Future logauth() async {
    return await _storage.delete(key: 'token');
  }
}