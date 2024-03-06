import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../FirestoreObjects/FbUsuario.dart';

class FirebaseAdmin {

  final FirebaseFirestore db = FirebaseFirestore.instance;

// Asumiendo que estás en un StatefulWidget y que tienes el método setState.

  void descargarUsuarios(List<FbUsuario> usuarios) async {
    CollectionReference<FbUsuario> refUsurious = db.collection("usuarios")
        .withConverter(fromFirestore: FbUsuario.fromFirestone,
      toFirestore: (FbUsuario usua, _) => usua.toFirestore(),);
    QuerySnapshot<FbUsuario> querySH = await refUsurious.get();

    usuarios.addAll(querySH.docs.map((e) => e.data()).toList());
  }

  Future<FbUsuario?> descargarUsuario(String userId) async {
    var refUsuario = FirebaseFirestore.instance.collection("usuarios")
        .doc(
        userId) // Asume que userId es el identificador del documento para el usuario
        .withConverter<FbUsuario>(
      fromFirestore: FbUsuario.fromFirestone,
      toFirestore: (FbUsuario usuario, _) => usuario.toFirestore(),
    );

    var docSnapshot = await refUsuario.get();
    return docSnapshot.exists ? docSnapshot.data() : null;
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

  String? obtenerUserID() {
    final FirebaseAuth auth = FirebaseAuth.instance;

    // Obtén el usuario actual
    User? usuario = auth.currentUser;

    // Verifica si el usuario está autenticado
    if (usuario != null) {
      // Si el usuario está autenticado, obtén y retorna su ID
      String userID = usuario.uid;
      print("El ID del usuario es: $userID");
      return userID;
    } else {
      // No hay usuario autenticado, retorna null
      print("No hay usuario autenticado.");
      return null;
    }
  }

  Future<String?> obtenerRutaImagenPerfil() async {
    // Obtiene el ID del usuario actualmente autenticado
    final userId = await FirebaseAuth.instance.currentUser?.uid;

    // Verifica si el usuario está autenticado
    if (userId == null) {
      print('Usuario no autenticado');
      return null;
    }

    try {
      // Obtiene el documento del usuario desde Firestore
      final docSnapshot = await FirebaseFirestore.instance.collection(
          'usuarios').doc(userId).get();

      // Verifica si el documento existe y contiene el campo 'fotoPerfil'
      if (docSnapshot.exists && docSnapshot.data()!.containsKey('fotoPerfil')) {
        // Devuelve la URL (ruta) de la imagen de perfil
        return docSnapshot.data()!['fotoPerfil'] as String;
      } else {
        print('El documento del usuario no tiene una foto de perfil.');
        return null;
      }
    } catch (e) {
      print('Error al obtener la ruta de la foto de perfil: $e');
      return null;
    }
  }

}

