import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../Custom/SCAppBar.dart';
import '../Custom/SCText.dart';
import '../Custom/SCTextField.dart';
import '../Custom/TextField/DBTextFielsBasic.dart';
import '../FirestoreObjects/FbUsuario.dart';

class PerfilUsuario extends StatelessWidget {
  late BuildContext _context;
  TextEditingController tecNombre = TextEditingController();
  TextEditingController tecEdad = TextEditingController();
  TextEditingController tecAltura = TextEditingController();
  TextEditingController tecPais = TextEditingController();
  TextEditingController tecCiudad = TextEditingController();
  TextEditingController tecEmail = TextEditingController();
  TextEditingController tecFotoPerfil = TextEditingController();
  TextEditingController tecPeso = TextEditingController();
  TextEditingController tecSexo = TextEditingController();


  FirebaseFirestore db = FirebaseFirestore.instance;

  void botonAceptar() async {
    // Creación de objeto FbUsuario con los datos ingresados y valores predeterminados para los campos no proporcionados por este formulario
    FbUsuario usuario = FbUsuario(
        nombre: tecNombre.text,
        edad: int.parse(tecEdad.text),
        altura: double.parse(tecAltura.text),
        pais: tecPais.text,
        ciudad: tecCiudad.text,
        email: tecEmail.text,
        fotoPerfil: tecFotoPerfil.text,
        peso: tecPeso.text,
        sexo: tecSexo.text,
    );

    // Obtiene el ID del usuario actual para vincular los datos del perfil
    String uidUsuario = FirebaseAuth.instance.currentUser!.uid;

    // Guarda los datos del usuario en Firestore bajo la colección "Usuarios" con el ID del usuario actual
    await db.collection("usuarios").doc(uidUsuario).set(usuario.toFirestore());

    // Navega al view 'homeview' tras guardar los datos
    Navigator.of(_context).pushNamed('/homeview');
  }

  void botonCancelar() {
    // Navega al view 'loginview'
    Navigator.of(_context).pushNamed('/loginview');
  }

  @override
  Widget build(BuildContext context) {
    _context = context;
    return Scaffold(

      body: Stack(
        children: [
          // Fondo de pantalla
          Image.asset(
            "resources/images/fondoLogin.jpeg",
            fit: BoxFit.cover,
            height: double.infinity,
            width: double.infinity,
          ),
          // Posición del título
          const Positioned(
            top: 25,
            left: 50,
            child: Text(
              '¡Perfil!',
              style: TextStyle(
                  fontSize: 40,
                  fontFamily: AutofillHints.birthdayDay,
                  color: Colors.black87
              ),
            ),
          ),
          // Entrada de datos
          Positioned(
            top: 70,
            left: 12,
            child: Container(
              width: 290,
              child: Column(
                children: [
                  DBTextFieldBasic(tecUsuario: tecNombre, sHint: "Nombre"),
                  DBTextFieldBasic(tecUsuario: tecEdad, sHint: "Edad"),
                  DBTextFieldBasic(tecUsuario: tecAltura, sHint: "Altura"),
                  DBTextFieldBasic(tecUsuario: tecPais, sHint: "Pais"),
                  DBTextFieldBasic(tecUsuario: tecCiudad, sHint: "Ciudad"),
                  DBTextFieldBasic(tecUsuario: tecEmail, sHint: "Email"),
                  DBTextFieldBasic(tecUsuario: tecPeso, sHint: "Peso"),
                  DBTextFieldBasic(tecUsuario: tecSexo, sHint: "Sexo"),



                ],
              ),
            ),
          ),
          // Botones de acción
          Positioned(
            top: 620,
            left: 80,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton(
                  onPressed: botonCancelar,
                  child: SCText(sTexto: "Cancelar"),
                ),
                TextButton(
                  onPressed: botonAceptar,
                  child: SCText(sTexto: "Aceptar"),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}