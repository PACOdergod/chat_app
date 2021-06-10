import 'package:chat_app/models/usuario.dart';
import 'package:chat_app/models/usuarios.dart';
import 'package:flutter/material.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';


class UsuariosPage extends StatelessWidget {

  final usuarios = usuariosList;

  final _refreshController = RefreshController(initialRefresh: false);

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        title: Text('Usuarios', style: TextStyle(color: Colors.black87),),
        backgroundColor: Colors.white,
        elevation: 1,
        leading: IconButton(
          icon: Icon(Icons.exit_to_app, color: Colors.black87,), 
          onPressed: null
        ),

        actions: [Container(
          margin: EdgeInsets.only(right: 20),
          child: 
            Icon(Icons.offline_bolt, color: Colors.red,),
            // Icon(Icons.check_circle, color: Colors.green,),
        )],
      ),

      body: SmartRefresher(
        controller: _refreshController,
        enablePullDown: true,
        header: WaterDropHeader(
          complete: Icon(Icons.check_circle_outline, color: Colors.blue,),
          waterDropColor: Colors.blue,
        ),

        child: _listViewUsuarios(),
        onRefresh: _cargarUsuarios,
      )
    );
  }

  ListView _listViewUsuarios() {
    return ListView.separated(
      physics: BouncingScrollPhysics(),
      itemCount: usuarios.length,

      itemBuilder: (_, i) => _usuarioTile(usuarios[i]),

      separatorBuilder: (_, i) => Divider(), 
    );
  }

  ListTile _usuarioTile(Usuario usuario) {
    return ListTile(
        title: Text(usuario.nombre),
        leading: CircleAvatar(child: Text(usuario.nombre.substring(0,2)),),
        trailing: Container(
          height: 15, width: 15,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            // color: usuario.online ? Colors.green : Colors.red
          ),
        ),
    );
  }

  _cargarUsuarios() async {
    Future.delayed(Duration(seconds: 2));
    _refreshController.refreshCompleted();
  }
}