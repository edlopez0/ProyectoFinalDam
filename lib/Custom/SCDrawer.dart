import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'SCText.dart';

class SCDrawerOne extends StatelessWidget {
  final VoidCallback bClickClose;
  final VoidCallback bClickUsuario;
  final VoidCallback bClickFoto;

  SCDrawerOne ({
    required this.bClickClose,
    required this.bClickUsuario,
    required this.bClickFoto,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(

        children: [
          Padding(padding: EdgeInsets.all(25),),
          Image.asset("resources/icons/usuario.png",height: 120,width: 120,),
Padding(padding: EdgeInsets.only(bottom: 100)),
    Column(
    children: [
    InkWell(
    onTap: bClickUsuario, // Asigna la función al botón
    child: Row(
    children: [
    SizedBox(width: 10),
    Icon(Icons.account_box, color: Colors.yellowAccent, size: 40),
    SizedBox(width: 10),
    SCText(sTexto: "Mi cuenta"),
    ],
    ),
    ),

                Row(
                  children: [
                    InkWell(
                      onTap: bClickFoto, // Asigna la función al botón
                      child: Row(
                        children: [
                          SizedBox(width: 10),
                          Icon(Icons.add_a_photo_rounded, color: Colors.blue, size: 40),
                          SizedBox(width: 10),
                          SCText(sTexto:"Añadir foto"),
                        ],
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    SizedBox(width: 10),
                    InkWell(
                      onTap: bClickClose, // Asigna la función al botón
                      child: Row(
                        children: [
                          Icon(Icons.close_rounded, color: Colors.red, size: 40),
                          SizedBox(width: 10),
                          SCText(sTexto: "Cerrar Sesión"),
                          SizedBox(width: 10),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),

        ],
      ),
    );
  }
}