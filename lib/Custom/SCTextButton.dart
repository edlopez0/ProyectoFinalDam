import 'dart:ui';
import 'package:flutter/material.dart';

class SCTextButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String buttonText;
  final Color backgroundColor;
  final Color textColor;

  SCTextButton({
    required this.onPressed,
    required this.buttonText,
    this.backgroundColor = Colors.blue,
    this.textColor = Colors.white,
  });

  @override
  Widget build(BuildContext context) {
    return
      TextButton(onPressed: onPressed,
        style: ButtonStyle(
          minimumSize: MaterialStateProperty.all(Size(50, 50)), // Ajusta el tamaño deseado
          backgroundColor: MaterialStateProperty.all(Colors.blue), // Cambia el color de fondo
          textStyle: MaterialStateProperty.all(TextStyle(
            fontSize: 25, // Cambia el tamaño del texto
          )),
          shape: MaterialStateProperty.all(RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10), // Cambia el radio de borde
          )),
        ),
        child: Text("Mostrar datos grid view  1",style: TextStyle(color: Colors.white,
            fontFamily: Navigator.defaultRouteName),
        ),
      );

      /*
      TextButton(
      onPressed: onPressed,
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(backgroundColor),
        textStyle: MaterialStateProperty.all(TextStyle(
          color: textColor,
        )),
      ),
      child: Text(buttonText),
    );*/
  }
}

