import 'package:flutter/material.dart';

import 'package:chat_app/pages/chat_page.dart';
import 'package:chat_app/pages/login_page.dart';
import 'package:chat_app/pages/loading_page.dart';
import 'package:chat_app/pages/register_page.dart';
import 'package:chat_app/pages/usuarios_page.dart';

Map<String, Widget Function(BuildContext)> mapRoutes = {
  'usuarios': (_) => UsuariosPage(), 
  'login': (_) => LoginPage(), 
  'chat': (_) => ChatPage(), 
  'loading': (_) => LoadingPage(), 
  'register': (_) => RegisterPage(), 
};