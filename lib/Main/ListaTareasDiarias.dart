import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../FirestoreObjects/FbTarea.dart';
import '../Singletone/DataHolder.dart'; // Asegúrate de que la ruta de importación es correcta.

class ListaTareasDiarias extends StatefulWidget {
  @override
  _ListaTareasDiariasState createState() => _ListaTareasDiariasState();
}

class _ListaTareasDiariasState extends State<ListaTareasDiarias> {
  List<FbTarea> tareas = [];
  final TextEditingController descripcionController = TextEditingController();
  final TextEditingController nombreController = TextEditingController();
  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  // Aquí deberías tener una variable para el ID del usuario
  final String userId = DataHolder().firebaseAdmin.obtenerUserID().toString(); // Asegúrate de reemplazar esto con el ID de usuario real.

  @override
  void initState() {
    super.initState();
    _escucharTareas();
  }

  void _escucharTareas() {
    firestore.collection('usuarios/$userId/tareas').snapshots().listen((snapshot) {
      setState(() {
        tareas = snapshot.docs.map((doc) => FbTarea.fromFirestore(doc, null)).toList();
      });
    });
  }

  void _mostrarDialogoAgregarTarea() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Nueva Tarea'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: nombreController,
                decoration: InputDecoration(hintText: "Escribe el título de la tarea"),
              ),
              TextField(
                controller: descripcionController,
                decoration: InputDecoration(hintText: "Escribe la descripción de la tarea"),
              ),
            ],
          ),
          actions: <Widget>[
            TextButton(
              child: Text('Cancelar'),
              onPressed: () {
                Navigator.of(context).pop();
                nombreController.clear();
                descripcionController.clear();
              },
            ),
            TextButton(
              child: Text('Agregar'),
              onPressed: () {
                if (nombreController.text.isNotEmpty && descripcionController.text.isNotEmpty) {
                  _agregarTarea(nombreController.text, descripcionController.text);
                  Navigator.of(context).pop();
                  nombreController.clear();
                  descripcionController.clear();
                }
              },
            ),
          ],
        );
      },
    );
  }

  void _agregarTarea(String tituloTarea, String descripcion) async {
    await firestore.collection('usuarios/$userId/tareas').add({
      'titulo': tituloTarea,
      'descripcion': descripcion,
      'fechaCreacion': Timestamp.fromDate(DateTime.now()),
      'completada': false,
    });
  }

  void _eliminarTarea(String idTarea) async {
    await firestore.collection('usuarios/$userId/tareas').doc(idTarea).delete();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Lista de Tareas Diarias'),
      ),
      body: ListView.builder(
        itemCount: tareas.length,
        itemBuilder: (context, index) {
          final tarea = tareas[index];
          return ListTile(
            title: Text(tarea.titulo),
            subtitle: Text(tarea.descripcion),
            trailing: Checkbox(
              value: tarea.completada,
              onChanged: (bool? valor) {
                firestore.collection('usuarios/$userId/tareas').doc(tarea.id).update({'completada': valor});
              },
            ),
            //Se mantiene presionado
            onLongPress: () => _eliminarTarea(tarea.id),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _mostrarDialogoAgregarTarea,
        child: Icon(Icons.add),
        tooltip: 'Añadir Tarea',
      ),
    );
  }
}

