import 'package:flutter/material.dart';

class DBTextFieldBasic extends StatelessWidget {
  // Variables
  final String sHint;
  final TextEditingController tecUsuario;
  final bool blIsPassword;
  final double dPaddingV;
  final double dPaddingH;
  final Color fillColor;
  final TextStyle hintStyle;
  final Widget? suffixIcon;

  // Constructor con parámetros
  DBTextFieldBasic({
    Key? key,
    required this.tecUsuario,
    required this.sHint,
    this.blIsPassword = false,
    this.dPaddingH = 5.0,
    this.dPaddingV = 5.0,
    this.fillColor = Colors.white, // Valor predeterminado modificado aquí
    this.hintStyle = const TextStyle(color: Colors.black), // Valor predeterminado modificado aquí
    this.suffixIcon = const Icon(Icons.check_circle, color: Colors.black), // Valor predeterminado modificado aquí
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: dPaddingV, horizontal: dPaddingH),
      child: Row(
        children: [
          Image.asset("resources/images/fondoLogin.jpeg", width: 30, height: 30),
          Flexible(
            child: TextFormField(
              controller: tecUsuario,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20.0),
                  borderSide: BorderSide(width: 1),

                ),
                hintText: sHint,
                filled: true,
                fillColor: fillColor,
                hintStyle: hintStyle,
                suffixIcon: suffixIcon,
              ),
              obscureText: blIsPassword,
            ),
          ),
        ],
      ),
    );
  }
}