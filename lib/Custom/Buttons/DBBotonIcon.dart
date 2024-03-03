import 'package:flutter/material.dart';

class DBBotonIcon extends StatelessWidget {
  final IconData icon;
  final String name;
  final Color textColor;
  final Color iconColor;
  final double fontSize;
  final double paddingRight;

  DBBotonIcon({
    Key? key,
    required this.icon,
    required this.name,
    this.textColor = Colors.black,
    this.iconColor = Colors.black,
    this.fontSize = 14,
    this.paddingRight = 8,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      onPressed: () {
        // Acción del botón
      },
      icon: Icon(
        icon,
        color: iconColor,
      ),
      label: Padding(
        padding: EdgeInsets.only(right: paddingRight),
        child: Text(
          name,
          style: TextStyle(
            color: textColor,
            fontSize: fontSize,
          ),
        ),
      ),
      style: ElevatedButton.styleFrom(
        foregroundColor: Colors.blue, primary: Colors.transparent, // Color del efecto ripple
        shadowColor: Colors.transparent, // Sin sombra
        elevation: 0, // Sin elevación
      ),
    );
  }
}