import 'package:flutter/material.dart';

class SCTextField extends StatelessWidget{
  //variables
  final String sHint;
  TextEditingController tecUsuario;
  bool blIsPassword;
  double dPaddingV;
  double dPaddingH;
  //constructor parmetros
  SCTextField({Key? key,
    required this.tecUsuario,
    required this.sHint,
    this.blIsPassword=false,
    this.dPaddingH=15,
    this.dPaddingV=15,
  }):super(key:key);

  @override
  Widget build(BuildContext context) {
    return Padding(padding: EdgeInsets.symmetric(vertical: dPaddingV,horizontal: dPaddingH),
        child:
      Row(children: [
          Image.asset("resources/images/fondoLogin.jpeg", width: 55,height: 55,),
          Flexible(child:
          TextFormField(
            controller:tecUsuario,
            decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: sHint,
                filled: true,
                fillColor: Colors.white,
                hintStyle: TextStyle(color: Colors.black),
                suffixIcon: Icon(Icons.check_circle,color: Colors.black,)
            ),
            obscureText: blIsPassword,
          ),

          ),
        ],
        ),
      );
  }
}



