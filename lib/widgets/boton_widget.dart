import 'package:flutter/material.dart';

class CustomBotton extends StatelessWidget {

  final Color color;
  final String text;
  final Function onPress;

  CustomBotton({
    this.color = Colors.blue, 
    @required this.text, 
    @required this.onPress
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all<Color>(this.color),
        elevation: MaterialStateProperty.all<double>(2),
        shape: MaterialStateProperty.all<OutlinedBorder>(StadiumBorder())
      ),
      onPressed: this.onPress, 

      child: Container(
        height: 50,
        width: double.infinity,
        child: Center(
          child: Text(this.text, style: 
            TextStyle(color: Colors.white, fontSize: 18),),
        ),
      ),
    );
  }
}