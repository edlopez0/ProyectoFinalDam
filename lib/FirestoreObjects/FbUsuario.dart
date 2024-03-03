import 'package:cloud_firestore/cloud_firestore.dart';

class FbUsuario{
  final String nombre;
  final int edad;
  final double altura;
  final String pais;

  //creacion de  constructor o el late
  FbUsuario({
required this.nombre,
required this.edad,
 required this.altura,
    required this.pais,
      });

  //metodo de firestore los ejecuta  (hace  el get )
  factory FbUsuario.fromFirestone(
      DocumentSnapshot<Map<String,dynamic>> snapshot,
      SnapshotOptions? options,
      )
  {
    final data=snapshot.data();
    return FbUsuario(
      nombre: data?['nombre'] ,
        edad: data?['edad'] !=null? data!['edad']:0,
        altura: data?['altura'] != null? data!['altura']:0,
        pais: data?['pais']!=null? data!['pais']:"sin asignar",
    );
  }

// parte  inversa  los envia los datos a firesto ( hace  el insert)
  Map<String, dynamic> toFirestore() {
    return {
      if (nombre != null) "nombre": nombre,
      if (edad != null) "edad": edad,
      if (altura != null) "altura": altura,
      if(pais!=null) "pais":pais,
    };
  }
}

