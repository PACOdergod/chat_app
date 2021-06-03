import 'package:flutter/material.dart';


class CustomInput extends StatelessWidget {

  final IconData icon;
  final String placeholder;
  final TextEditingController textController;
  final TextInputType keyboardType;
  final bool isPassword;

  CustomInput({
    @required this.icon, 
    @required this.placeholder, 
    @required this.textController, 
    this.keyboardType = TextInputType.text,
    this.isPassword = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      
      padding: EdgeInsets.only(top: 2, bottom: 2,  left: 5, right: 20),

      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(30),
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            offset: Offset(0, 5),
            blurRadius: 5
          )
        ]
      ),

      child: TextField(
        autocorrect: false,
        keyboardType: this.keyboardType,
        obscureText: this.isPassword,

        controller: this.textController,

        decoration: InputDecoration(
          prefixIcon: Icon(this.icon),
          border: InputBorder.none,
          hintText: this.placeholder,
        ),
      ),

    );
  }
}