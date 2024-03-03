import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../SCText.dart';


class DBDrawerFiveButtons extends StatelessWidget {
  final VoidCallback bClickClose;
  final VoidCallback bClickUsuario;
  final VoidCallback bClickFoto;
  final VoidCallback bClickSettings;
  final VoidCallback bClickHelp;
  final VoidCallback bClickAboutUs;

  DBDrawerFiveButtons ({
    required this.bClickClose,
    required this.bClickUsuario,
    required this.bClickFoto,
    required this.bClickSettings,
    required this.bClickHelp,
    required this.bClickAboutUs,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          Padding(padding: EdgeInsets.all(25)),
          Image.asset("resources/icons/usuario.png", height: 120, width: 120),
          Padding(padding: EdgeInsets.only(bottom: 100)),
          Column(
            children: [
              botonesDrawer(Icons.account_box, "Mi cuenta", bClickUsuario, Colors.yellowAccent),
              botonesDrawer(Icons.add_a_photo_rounded, "Añadir foto", bClickFoto, Colors.blue),
              botonesDrawer(Icons.settings, "Configuración", bClickSettings, Colors.green),
              botonesDrawer(Icons.help_outline, "Ayuda", bClickHelp, Colors.orange),
              botonesDrawer(Icons.info_outline, "Acerca de", bClickAboutUs, Colors.purple),
              botonesDrawer(Icons.close_rounded, "Cerrar Sesión", bClickClose, Colors.red),
            ],
          ),
        ],
      ),
    );
  }

  Widget botonesDrawer(IconData icon, String texto, VoidCallback onTap, Color color) {
    return InkWell(
      onTap: onTap,
      child: Row(
        children: [
          SizedBox(width: 10),
          Icon(icon, color: color, size: 40),
          SizedBox(width: 10),
          SCText(sTexto: texto,fontSize: 14,),
        ],
      ),
    );
  }
}