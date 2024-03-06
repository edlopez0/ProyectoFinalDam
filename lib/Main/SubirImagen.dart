import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';


import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../Custom/BOOMButonStyleOne.dart';

import '../FirestoreObjects/FbUsuario.dart';
import '../Singletone/DataHolder.dart';


class SubirImagenPerfil extends StatefulWidget {
  const SubirImagenPerfil({super.key});

  @override
  State<SubirImagenPerfil> createState() => _PostearView();
}

class _PostearView extends State<SubirImagenPerfil>{

  FirebaseFirestore db = FirebaseFirestore.instance;
  ImagePicker _picker=ImagePicker();
  File _imagePreview=File(" ");




  void btOnGaleria() async {
    XFile? img=await _picker.pickImage(source: ImageSource.gallery);
    if(img!=null) {
      setState(() {
        _imagePreview = File(img.path);
      });
    }
  }
  void btOnCamera() async {
    XFile? img=await _picker.pickImage(source: ImageSource.camera);
    if(img!=null) {
      setState(() {
        _imagePreview = File(img.path);
      });
    }
  }
  void publicadoOKSnackBar(BuildContext context) {
    final snackBar = SnackBar(
      content: Text('¡Publicado con éxito!'),
      backgroundColor: Colors.green,
      duration: Duration(seconds: 4),
    );

    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
  void subirImagenAndPerfil()async{
    //-----------INICIO SUBIR IMAGEN
    //creacion a storage referencia de la app
    final storaRef=FirebaseStorage.instance.ref();
//crea una referencia de la imagen
    String rutaNube="imgs/"+FirebaseAuth.instance.currentUser!.uid+
        "/imgPerfil/"+"fotoPerfil"+".jpg";
    final rutaFicheroNube=storaRef.child(rutaNube);
    try{
      await rutaFicheroNube.putFile(_imagePreview);
    }on FirebaseException catch(e){
      print("--->>>!!!EROOR   no se ha subido una imagen>>>>>>>>>");
    }
    print("------->>>>> SE HA SUBIDO LA  IMAGEN");
    //------------FIN SUBIR IMAGEN------------


//--------------INICIO DE SUBIR POST-------------
    //inicia la  descarga de la url de la imagen subida en aterior paso y lo guarda  eb una
    //variable string
    String imgUrlDescargada=await rutaFicheroNube.getDownloadURL();
    print("url de  descarga  es __>>>"+imgUrlDescargada);


    //
    String id=DataHolder().firebaseAdmin.obtenerUserID().toString();
    await FirebaseFirestore.instance.collection('usuarios').doc(id).update({
      'fotoPerfil': imgUrlDescargada,
    });


  }
  void btPublicar(){
    print('---->>>>> se ha  realizado   en inicio a publicar');
    //metodo sube  la imagen
    subirImagenAndPerfil();
    Navigator.popAndPushNamed(context, "/homeview");

  }

  void verificarExistenciaDatos() async {

    FbUsuario? usuario = await DataHolder().firebaseAdmin.existeUsuarioBaseDatos();

    if (usuario != null) {
      // Implementa la lógica si el usuario existe
      print("Datos del usuario existen: ${usuario.nombre}, Edad: ${usuario.edad}, Altura: ${usuario.altura}");
    } else {
      // Implementa la lógica si el usuario no existe
      print("No se encontraron datos del usuario en la base de datos.");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold
      (
      appBar: AppBar(
        title: Text('Subir imagen '),
      ),
      body:
      SingleChildScrollView(
        child:
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: <Widget>[
              Row(children: [

                BOOMButtonStyleOne(onPressed: btOnGaleria, text: "add.img.Galeria",fontSize: 10,backgroundColor: Colors.lightGreen,borderRadius: 20,textColor: Colors.black),
                BOOMButtonStyleOne(onPressed: btOnCamera, text: "add.img.Camera",fontSize: 10,backgroundColor: Colors.lightGreen,borderRadius: 20,textColor: Colors.black),
              ],),
              //Image.file( _imagePreview),

              SizedBox(height: 24.0),
              BOOMButtonStyleOne(onPressed: btPublicar, text: "Publicar"),
              //crear  a la subida y cargada  de laimagen

              //  child: Text('Registrar'),
              //),
            ],
          ),
        ),
      ),
    );
  }
}

