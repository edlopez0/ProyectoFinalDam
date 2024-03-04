
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class SubirImagen extends StatefulWidget {
  @override
  _UploadImageFormState createState() => _UploadImageFormState();
}

class _UploadImageFormState extends State<SubirImagen> {
  File? _image;

  // Método para seleccionar una imagen
  Future<void> _pickImage() async {
    final pickedFile = await ImagePicker().pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Subir Imagen'),
      ),
      body: Column(
        children: [
          if (_image != null)
            Image.file(_image!)
          else
            Text("No hay imagen seleccionada"),
          ElevatedButton(
            onPressed: _pickImage,
            child: Text('Seleccionar Imagen'),
          ),
          // Aquí puedes añadir el resto de tu formulario
        ],
      ),
    );
  }
}