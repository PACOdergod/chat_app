import 'dart:io';

import 'package:chat_app/widgets/message_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class ChatPage extends StatefulWidget {
  @override
  _ChatPageState createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> with TickerProviderStateMixin{

  final _textEditingController = TextEditingController();

  List<MessageWidget> _mensajes = [
    // MessageWidget(id: '1',text: 'hola mundo qwerqwerqweebiehnrjgiñobninsoiwfjqwpeomimtqmjxfpoqweijfoksdnv{ coisevfaierwh'),
    // MessageWidget(id: '1',text: 'hola mundo'),
    // MessageWidget(id: '1',text: 'hola mundo'),
    // MessageWidget(id: '2',text: 'hola mundo qwerqwerqweebiehnrjgiñobninsoiwfjqwpeomimtqmjxfpoqweijfoksdnv{ coisevfaierwh'),
    // MessageWidget(id: '2',text: 'hola mundo'),
    // MessageWidget(id: '2',text: 'hola mundo'),
    // MessageWidget(id: '2',text: 'hola mundo'),
  ];

  bool _estaEscribiendo = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(),

      body: Container(child: Column(children: [
        Flexible(child: ListView.builder(
          physics: BouncingScrollPhysics(),
          reverse: true,
          itemCount: _mensajes.length,
          itemBuilder: (_,  i) => _mensajes[i]
        ),),

        SizedBox(height: 5),

        Divider(height: 2,),

        Container(
          // TODO; caja de texto
          // height: 100,
          // color: Colors.amber[100],
          child: _inputChat(),
        ),

        SizedBox(height: 5,)
      ],),),
   );
  }

  final _focusnode = new FocusNode();

  Widget _inputChat(){
    return SafeArea(child: Container(
      margin: EdgeInsets.symmetric(horizontal: 8),
      child: Row(
        children: [

          // Caja de texto
          Flexible(child: TextField(
            controller: _textEditingController,
            onSubmitted: _handlerSubmit,
            onChanged: (texto){
              setState(() {
                _estaEscribiendo = true;
              });
            },
            decoration: InputDecoration.collapsed(hintText: 'Nuevo mensaje'),
            focusNode: _focusnode,
          )),

          // Boton enviar
          Container(
            margin: EdgeInsets.symmetric(horizontal: 4),
            child: Platform.isIOS 
              ? _enviarIOS()
              : _enviarAndroid()
          )

        ],
      ),
    ));
  }

  CupertinoButton _enviarIOS() {
    return CupertinoButton(
      child: Text('enviar'), 
      onPressed: _estaEscribiendo
        ? ()=> _handlerSubmit(_textEditingController.text)
        : null,
    );
  }

  Container _enviarAndroid() {
    return Container(child: IconTheme(
      data: IconThemeData(color: Colors.blue),
      child: IconButton(
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
        icon: Icon(Icons.send_rounded),
        onPressed: _estaEscribiendo
          ? ()=> _handlerSubmit(_textEditingController.text)
          : null,
      ),
    ),);
  }

  void _handlerSubmit(String texto){
    print(texto);
    _focusnode.requestFocus();
    _textEditingController.clear();

    final chat = MessageWidget(id: '1', text: texto, animationController: 
      AnimationController(vsync: this, duration: Duration(milliseconds: 300)),);

    chat.animationController.forward();

    setState(() {
      _estaEscribiendo = false;
      _mensajes.insert(0, chat);
    });
  }


  @override
  void dispose() { 
    super.dispose();

    // TODO: oof socket

    for (var chat in _mensajes) chat.animationController.dispose();
  }
}

Widget _appBar(){
  return AppBar(
    centerTitle: true,
    backgroundColor: Colors.white,
    title: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CircleAvatar(
          backgroundColor: Colors.blue[100],
          child: Text('Te', style: TextStyle(fontSize: 15, color: Colors.blue),),
        ),

        SizedBox(width: 10,),

        Text('Test', style: TextStyle(color: Colors.black),)
      ],
    ),
  );
}