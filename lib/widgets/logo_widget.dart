import 'package:flutter/material.dart';

Widget crearLogo(String titulo) {
  return Center(
    child: Container(
      margin: EdgeInsets.only(top: 30),
      width: 180,

      child: Column(
        children: [
          Image(image: AssetImage('assets/tag-logo.png')),
          Text(titulo, style: TextStyle(fontSize: 30),)
        ],
      ),
    ),
  );
}
