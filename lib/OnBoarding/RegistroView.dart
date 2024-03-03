import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';


import '../Custom/SCText.dart';
import '../Custom/SCTextField.dart';
import '../Custom/SCTextRegistro.dart';

class RegistroView extends StatelessWidget {
  late BuildContext _context;
   TextEditingController tecUsername = TextEditingController();
   TextEditingController tecPass = TextEditingController();
   TextEditingController tecRepass = TextEditingController();

  //bptonnes
  void botonCancelar() {
    Navigator.of(_context).pushNamed('/loginview');
  }
  void registrarMovil() {
    Navigator.of(_context).pushNamed('/phoneverifica');
  }
  void botonRegistrar() async {
    if(tecPass.text==tecRepass.text){
    try {
       await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: tecUsername.text,
        password: tecPass.text,
      );

      Navigator.of(_context).pushNamed('/perfilview');

    } on FirebaseAuthException catch (e) {
      print("----->>>>>>>>>>> passs no coincide ");
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
      }
    } catch (e) {
      print(e);
    }
  }
  }
  @override
  Widget build(BuildContext context) {
    _context = context;

    return Scaffold(
      body: Stack(
        children: [
          // fondo de pantalla
          Image.asset(
            "resources/images/fondoLogin.jpeg",
            fit: BoxFit.cover,
            height: double.infinity,
            width: double.infinity,
          ),

          // posición del título
          Positioned(
            top: 55,
            left: 55,
            child: Column(
              children: [
                Text(
                  '¡Registrate ya !',
                  style: TextStyle(
                    fontSize: 40,
                    fontFamily: AutofillHints.birthdayDay,
                    color: Colors.black87,
                  ),
                ),
              ],
            ),
          ),

          // entrada de datos
          Positioned(
            top: 100,
            left: 15,
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 17, vertical: 15),
                  child: Container(
                    width: 300,
                    child: SCTextField(tecUsuario: tecUsername, sHint: "@gmail"),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 0, vertical: 0),
                  child: Container(
                    width: 300,
                    child: SCTextField(
                      tecUsuario: tecPass,
                      sHint: "password",
                      blIsPassword: true,
                      dPaddingV: 10,

                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 0, vertical: 0),
                  child: Container(
                    width: 300,
                    child: SCTextField(
                      tecUsuario: tecRepass,
                      sHint: "repeat password",
                      blIsPassword: true,
                      dPaddingV: 0,
                    ),
                  ),
                ),
              ],
            ),
          ),

          // botones animados
          Positioned(
            top: 400,
            left: 80,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                AnimatedOpacity(
                  opacity: 1.0,
                  duration: Duration(milliseconds: 500),
                  child: ElevatedButton(
                    onPressed:botonCancelar,
                    child: SCText(sTexto: "return"),
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.black,
                      backgroundColor: Colors.blue,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 20), // Añade un espacio entre los botones
                AnimatedOpacity(
                  opacity: 1.0,
                  duration: Duration(milliseconds: 500),
                  child: ElevatedButton(
                    onPressed: botonRegistrar,
                    child: SCText(sTexto: "Sing up"),
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.black,
                      backgroundColor: Colors.cyan,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                  ),
                ),

              ],
            ),
          ),
          Positioned(
            top: 600,
            left: 80,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(width: 20), // Añade un espacio entre los botones
                AnimatedOpacity(
                  opacity: 1.0,
                  duration: Duration(milliseconds: 1000),
                  child: ElevatedButton(
                    onPressed: registrarMovil,
                    child: SCTextRegistro(sTexto: "registro movil",fontSize: 19,),
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.black,
                      backgroundColor: Colors.cyanAccent,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                  ),
                ),

              ],
            ),
          ),
        ],
      ),
    );
  }
}








