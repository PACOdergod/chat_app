import 'dart:convert';

import 'package:chat_app/global/enviroment.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http; 

class AuthService with ChangeNotifier {
  
  Future login(String email, String password)async{

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

    print(res.body);
  }
}