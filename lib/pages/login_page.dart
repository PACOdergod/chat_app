import 'package:chat_app/services/auth_service.dart';
import 'package:chat_app/widgets/boton_widget.dart';
import 'package:chat_app/widgets/input_widget.dart';
import 'package:chat_app/widgets/labels_widget.dart';
import 'package:chat_app/widgets/logo_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class LoginPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],

      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Container(
          height: MediaQuery.of(context).size.height,

          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [

              SafeArea(child: crearLogo('Messenger')),

              Formulario(),

              Labels(text: 'No tienes cuenta?',ruta: 'register',),

              Container(
                margin: EdgeInsets.only(bottom: 10),
                child: Text('Terminos y condiciones de uso', style: TextStyle(fontWeight: FontWeight.w200),)
              ),

            ],
          ),
        ),
      )
   );
  }
}

class Formulario extends StatefulWidget {
  @override
  _FormState createState() => _FormState();
}

class _FormState extends State<Formulario> {

  final emailCtrl = TextEditingController();
  final passCtrl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 40),
      child: Column(children: [

        CustomInput(
          icon: Icons.mail_outline,
          placeholder: 'Correo',
          keyboardType: TextInputType.emailAddress,
          textController: emailCtrl,
        ),

        SizedBox(height: 10,),

        CustomInput(
          icon: Icons.lock_outline, 
          placeholder: 'Contraseña',
          isPassword: true,
          keyboardType: TextInputType.text,
          textController: passCtrl,
        ),

        SizedBox(height: 10,),

        CustomBotton(text: 'Ingrese',
          onPress: (){
            print(emailCtrl.text);
            print(passCtrl.text);
            final authService = Provider.of<AuthService>(context, listen: false);

            authService.login(emailCtrl.text, passCtrl.text);

          },
        )

      ],),
    );
  }
}