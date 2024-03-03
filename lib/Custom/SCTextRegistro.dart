
import 'package:flutter/material.dart';


class SCTextRegistro extends StatelessWidget{
  String sTexto;
  double fontSize;
  double anchura;
  SCTextRegistro({Key? key,
    required this.sTexto,
    this.fontSize=23,
    this.anchura=1.5,
  }) :super(key:key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return
      Text(sTexto,
        style: TextStyle(color: Colors.black,
          fontFamily: Navigator.defaultRouteName,
          backgroundColor: Colors.transparent,
          //decoration: TextDecoration.underline,
          fontSize: fontSize,
          height: anchura,
        ),
      );

  }


}