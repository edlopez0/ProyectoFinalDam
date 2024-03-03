import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../Custom/SCText.dart';
import '../Custom/SCTextField.dart';
import '../FirestoreObjects/FbUsuario.dart';
import '../Singletone/DataHolder.dart';

class LoginView extends StatelessWidget{
late BuildContext _context;
TextEditingController tecUsuario = TextEditingController();
TextEditingController tecPassword = TextEditingController();

  LoginView({super.key});
//FirebaseFirestore db=FirebaseFirestore.instance;

Future<void> botonEntrar() async {
  print("------->>>>>>login inicia  ${tecUsuario.text}");
  try {
    final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: tecUsuario.text,
      password:tecPassword.text,
    );
    print("*************>> logeado correo y pass logeado");
    Navigator.of(_context).popAndPushNamed('/homeview');
  } on FirebaseAuthException catch (e) {
    if (e.code == 'user-not-found') {
      print('No user found for that email.');
      //funcion verifica si hay datos
      existenDatosBaseDatos();

    } else if (e.code == 'wrong-password') {
      print('Wrong password provided for that user.');
    }
    Navigator.of(_context).popAndPushNamed('/registroview');
  }
}

void botonRegistrar() {
  print(">>>>>>>>>>>>>>!!!! entra  pantalla de registro");
  Navigator.of(_context).pushNamed('/registroview');
}
//metodo
void existenDatosBaseDatos() async {

  //DataHolder().firebaseAdmin.existenDatosBaseDatos();
  FbUsuario?  usuario = await DataHolder().firebaseAdmin.existeUsuarioBaseDatos();

  if (usuario != null) {
    // Implementa la lógica si el usuario existe
    print("Datos del usuario existen: ${usuario.nombre}, Edad: ${usuario.edad}, Altura: ${usuario.altura}");
  } else {
    // Implementa la lógica si el usuario no existe
    print("No se encontraron datos del usuario en la base de datos.");
    Navigator.of(_context).popAndPushNamed('/perfilview');
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
        const Positioned(
          top: 55,
          left: 55,
          child: Column(
            children: [
              Text(
                '¡Planea tu vida!',
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
          top: 230,
          left: 15,
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 17, vertical: 15),
                child: Container(
                  width: 300,
                  child: SCTextField(tecUsuario: tecUsuario, sHint: "@gmail"),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 0, vertical: 0),
                child: Container(
                  width: 250,
                  child: SCTextField(
                    tecUsuario: tecPassword,
                    sHint: "contraseña",
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
          top: 420,
          left: 80,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AnimatedOpacity(
                opacity: 1.0,
                // Agrega una variable para controlar la opacidad
                duration: Duration(milliseconds: 2200),
                // Establece la duración de la animación
                child: ElevatedButton(
                  onPressed: botonRegistrar,
                  child: SCText(sTexto: "Registrar"),
                  style: ElevatedButton.styleFrom(
                    // Personaliza el estilo del botón
                    foregroundColor: Colors.white, backgroundColor: Colors.blue, // Cambia el color del texto
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(
                          20), // Redondea los bordes
                    ),
                  ),
                ),
              ),
              SizedBox(width: 20), // Añade un espacio entre los botones
              AnimatedOpacity(
                opacity: 1.0,
                // Agrega una variable para controlar la opacidad
                duration: Duration(milliseconds: 500),
                // Establece la duración de la animación
                child: ElevatedButton(
                  onPressed: botonEntrar,
                  child: SCText(sTexto: "Aceptar"),
                  style: ElevatedButton.styleFrom(
                    // Personaliza el estilo del botón
                    foregroundColor: Colors.white, backgroundColor: Colors.green, // Cambia el color del texto
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(
                          20), // Redondea los bordes
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
}}