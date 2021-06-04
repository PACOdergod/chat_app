import 'package:flutter/material.dart';

class MessageWidget extends StatelessWidget {

  final String text;
  final String id;
  final AnimationController animationController;

  const MessageWidget({
    Key key, 
    @required this.text, 
    @required this.id, 
    @required this.animationController
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizeTransition(
      sizeFactor: this.animationController,
      child: id == '1'
        ? _myMessage()
        : _otherMessage(),
    );
  }


  Widget _myMessage(){
    return Align(
      alignment: Alignment.centerRight,
      child: Container(
        margin: EdgeInsets.only(
          top: 2, bottom: 2,
          left: 50, right: 5
        ),
        padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        child: Text(this.text, style: TextStyle(color: Colors.white),),
        decoration: BoxDecoration(
          color: Colors.blue,
          borderRadius: BorderRadius.circular(20)
        ),
      ),
    );
  }

  Widget _otherMessage(){
    return Align(
      alignment: Alignment.centerLeft,
      child: Container(
        margin: EdgeInsets.only(
          top: 2, bottom: 2,
          left: 5, right: 50
        ),
        padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        child: Text(this.text, style: TextStyle(color: Colors.white),),
        decoration: BoxDecoration(
          color: Colors.purple,
          borderRadius: BorderRadius.circular(20)
        ),
      ),
    );
  }
}
