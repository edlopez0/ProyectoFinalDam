import 'package:flutter/material.dart';

class SCText extends StatelessWidget {
  final String sTexto;
  final double fontSize;
  final double anchura;
  final Color colorTexto;

  SCText({
    Key? key,
    required this.sTexto,
    this.fontSize = 23,
    this.anchura = 1.5,
    this.colorTexto = Colors.black, // Usar Color directamente, no String
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      sTexto,
      style: TextStyle(
        color: colorTexto, // Usar la variable colorTexto que es de tipo Color
        // fontFamily debe ser el nombre de la fuente como String. Si quieres usar la fuente por defecto, simplemente omite esta línea.
        backgroundColor: Colors.transparent,
        fontSize: fontSize,
        height: anchura,
      ),
    );
  }
}