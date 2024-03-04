import 'package:cloud_firestore/cloud_firestore.dart';

class FbUsuario{
  final String nombre;
  final int edad;
  final double altura;
  final String pais;
  final String sexo;
  final String peso;
  final String email;
  final String telefono;
  final String direccion;
  final String ciudad;
  final String fotoPerfil;


  //creacion de  constructor o el late
  FbUsuario({
    required this.nombre,
    required this.edad,
    required this.altura,
    required this.pais,
    required this.sexo,
    required this.peso,
    required this.email,
    required this.telefono,
    required this.direccion,
    required this.ciudad,
    required this.fotoPerfil,

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
      sexo: data?['sexo']!=null? data!['sexo']:"sin asignar",
      peso: data?['peso']!=null? data!['peso']:"sin asignar",
      email: data?['email']!=null? data!['email']:"sin asignar",
      telefono: data?['telefono']!=null? data!['telefono']:"sin asignar",
      direccion: data?['direccion']!=null? data!['direccion']:"sin asignar",
      ciudad: data?['ciudad']!=null? data!['ciudad']:"sin asignar",
      fotoPerfil: data?['fotoPerfil']!=null? data!['fotoPerfil']:'assets/images/fotoPerfilPorDefecto.png',

    );
  }

// parte  inversa  los envia los datos a firesto ( hace  el insert)
  Map<String, dynamic> toFirestore() {
    return {
      if (nombre != null) "nombre": nombre,
      if (edad != null) "edad": edad,
      if (altura != null) "altura": altura,
      if(pais!=null) "pais":pais,
      if(sexo!=null) "sexo":sexo,
      if(peso!=null) "peso":peso,
      if(email!=null) "email":email,
      if(telefono!=null) "telefono":telefono,
      if(direccion!=null) "direccion":direccion,
      if(ciudad!=null) "ciudad":ciudad,
      if(fotoPerfil!=null) "fotoPerfil":fotoPerfil,

    };
  }
}

