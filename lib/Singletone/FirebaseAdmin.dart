import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../FirestoreObjects/FbUsuario.dart';

class FirebaseAdmin {

  final FirebaseFirestore db = FirebaseFirestore.instance;

// Asumiendo que estás en un StatefulWidget y que tienes el método setState.

  void descargarUsuarios(List<FbUsuario> usuarios) async {
    CollectionReference<FbUsuario> refUsurious = db.collection("Usuarios")
        .withConverter(fromFirestore: FbUsuario.fromFirestone,
      toFirestore: (FbUsuario usua, _) => usua.toFirestore(),);
    QuerySnapshot<FbUsuario> querySH = await refUsurious.get();

    usuarios.addAll(querySH.docs.map((e) => e.data()).toList());
  }

  Future <void> existenDatosBaseDatos() async {
    String uid = FirebaseAuth.instance.currentUser!.uid;
    DocumentReference<FbUsuario> ref = db.collection("usuarios").doc(uid)
        .withConverter(fromFirestore: FbUsuario.fromFirestone,
      toFirestore: (FbUsuario usuario, _) => usuario.toFirestore(),);
    DocumentSnapshot<FbUsuario> docSnap = await ref.get();
    FbUsuario usuario = docSnap.data()!;
    if (usuario!= null) {
      print("---->>>>>DATOS EXIXTEN YAAA" + usuario.nombre
          + " edad " + usuario.edad.toString()
          + " altura " + usuario.altura.toString());
    }
  }


  Future<FbUsuario?> existeUsuarioBaseDatos() async {
    try {
      String uid = FirebaseAuth.instance.currentUser!.uid;
      DocumentReference<FbUsuario> ref = db.collection("usuarios").doc(uid)
          .withConverter(
        fromFirestore: FbUsuario.fromFirestone,
        toFirestore: (FbUsuario usuario, _) => usuario.toFirestore(),
      );

      DocumentSnapshot<FbUsuario> docSnap = await ref.get();
      FbUsuario? usuario = docSnap.data();

      return usuario;
    } catch (error) {
      print(
          "Error al verificar la existencia de datos en la base de datos: $error");
      // Puedes manejar el error de la manera que prefieras, lanzando una excepción, etc.
      throw Exception(
          "Error al verificar la existencia de datos en la base de datos: $error");
    }
  }

}

