
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../Custom/SCText.dart';
import '../FirestoreObjects/FbUsuario.dart';

class SplashView extends StatefulWidget{  //use stateFullWidget vs statelesswidgert
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _SplashViewState();
  }
}
class _SplashViewState extends State<SplashView> {
  late BuildContext _context;
  FirebaseFirestore db=FirebaseFirestore.instance;
  @override
  void  initState(){
    super.initState();
    checkSeccion();

  }
  void checkSeccion() async {
    await Future.delayed(Duration(seconds: 4));
    if(FirebaseAuth.instance.currentUser!=null){
      metodoExistenDatosBaseDatos();
    }else{
      Navigator.of(_context).pushNamed('/loginview');
    }
  }
  //metodo que verifica  si existe el perfil del login

  Future<void> metodoExistenDatosBaseDatos() async {
    //el uid  lo asignavos a variable uid
    String uid=FirebaseAuth.instance.currentUser!.uid;
    //referencia  de en que parte de base datos se encuentra
    DocumentReference<FbUsuario> referencia=db.collection("Usuarios")
        .doc(uid)
    //como lo quiero descargar
        .withConverter
      (fromFirestore: FbUsuario.fromFirestone,
      toFirestore: (FbUsuario usuario, _) => usuario.toFirestore(),);
    //creamos un documento  Snap
    DocumentSnapshot<FbUsuario> docSnap=await referencia.get();
    FbUsuario usuario=docSnap.data()!;

    if(usuario!=null){
      print("los datos exixten***>>>>>"+usuario.nombre);
      Navigator.of(context).popAndPushNamed('/homeview');
    }else{
      print("los datos no exixten exixten***>>>>>");
      Navigator.of(context).popAndPushNamed("/perfilview");
    }
  }
  @override
  Widget build(BuildContext context) {
    _context=context;
    return Scaffold(body:
    Stack(
      children :[
        Image.asset("resources/images/fondoLogin.jpeg",
          fit: BoxFit.cover,
          height: double.infinity,
          width: double.infinity,
        ),

        Positioned(
            top: 700,left: (MediaQuery.of(context).size.width ) / 4,
            height: 12,width: 165,
            child:  ProgressIndicatorTheme(
                data: ProgressIndicatorThemeData(
                    color: Colors.black54,
                    linearMinHeight: double.infinity,
                    linearTrackColor: Colors.tealAccent
                ),
                child: LinearProgressIndicator()
            )
        ),

        Positioned(
          top: 100,left: 250,height: 100,width: 100,
          child: SCText(sTexto: "!!Hola!!",fontSize: 150,anchura: 3),),
      ],
    ),
    );
  }
}


