import 'package:flutter/material.dart';

import 'SCText.dart';

class UsuarioCellView extends StatelessWidget{
  final String sNombre;
  final int sEdad;
  final double sAltura;
  final int pocicion;
  final Function(int indice)? onPressedCeldView;

   UsuarioCellView({super.key,
    required this.sNombre,
    required this.sEdad,
    required this.sAltura,
    required this.onPressedCeldView,
     required this.pocicion,

  });

  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    return InkWell(
        // Asigna la función al botón

      child: Column(
          children: [
            Padding(padding: EdgeInsets.all(10)),
            SCText(sTexto: sNombre),
            SCText(sTexto: sEdad.toString()),
            SCText(sTexto: sAltura.toString()),
          ],
        ),
      //no entiendo porque  me  cojia  sin poner parentises
        //ojo  onTap abrir y cerrar parentisis {};
        onTap:(){ onPressedCeldView!(pocicion);}
      );

  }
}




