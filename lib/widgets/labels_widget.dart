
import 'package:flutter/material.dart';

class Labels extends StatelessWidget {

  final String text;
  final String ruta;

  const Labels({
    @required this.text, 
    @required this.ruta
  });

  @override
  Widget build(BuildContext context) {
    return Container(child: Column(children: [

    GestureDetector(
      child: Text(this.text, 
        style: TextStyle(color: Colors.blue[600], fontSize: 18, fontWeight: FontWeight.bold),
      ),

      onTap: (){
        Navigator.pushReplacementNamed(context, this.ruta);
      },
    ),

  ],),);
  }
}