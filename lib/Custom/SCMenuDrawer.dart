import 'package:flutter/material.dart';

import 'SCText.dart';

class SCMenuDrawe extends StatelessWidget{
  late VoidCallback bClickClose ;
Function(int indice)? botonOnPres;

SCMenuDrawe({super.key,
  required this.bClickClose,
 // required this.bClickUsuario,
}
);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(children: [
        Image.asset("resources/images/fondoLogin.jpeg"),
    InkWell(
      onTap: bClickClose,
      child:Column(
        children: [
      Row(
        children: [
          SizedBox(width: 10,),
          Icon(Icons.close,color: Colors.white,size: 40),

          SizedBox(width: 10,),
          SCText(sTexto: "Cerrar sesión"),
        ],
      ),
      Row(
        children: [
          SizedBox(width: 10,),
          Icon(Icons.account_box,color: Colors.deepOrange,size: 40),
          SizedBox(width: 10,),
          SCText(sTexto: "Mi usuario"),
        ],
      ),
    ],
    ),
    ),
      ],
      ),
      );
  }
}