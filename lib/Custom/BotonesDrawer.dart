import 'package:flutter/material.dart';

class BotonesDrawer extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            customIconButton('Botón 1', Icons.home, () {
              print('Botón 1 presionado');
            }),
            customIconButton('Botón 2', Icons.settings, () {
              print('Botón 2 presionado');
            }),
            customIconButton('Botón 3', Icons.star, () {
              print('Botón 3 presionado');
            }),
            customIconButton('Botón 4', Icons.mail, () {
              print('Botón 4 presionado');
            }),
            customIconButton('Botón 5', Icons.phone, () {
              print('Botón 5 presionado');
            }),
          ],
        );
  }

  Widget customIconButton(String texto, IconData icono, VoidCallback onTap) {
    return ElevatedButton.icon(
      onPressed: onTap,
      icon: Icon(icono),
      label: Text(texto),
      style: ElevatedButton.styleFrom(
        foregroundColor: Colors.white, backgroundColor: Colors.blue, // Text Color (Foreground color)
      ),
    );
  }
}