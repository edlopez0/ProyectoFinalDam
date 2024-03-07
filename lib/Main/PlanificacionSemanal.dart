import 'package:flutter/material.dart';

import '../Custom/CustomButton.dart';



class PlanificacionSemanal extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    planificacionSemanal() {
      print('Planificación Semanal');
      Navigator.pushNamed(context, '/tareasdiarias');
    }


    return Scaffold(
      appBar: AppBar(
        title: Text('Tareas Semanales'),
        centerTitle: true,
        backgroundColor: Colors.teal,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.home),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          IconButton(
            icon: Icon(Icons.dark_mode),
            onPressed: () {
              //create method for dark mode


            },
          ),
        ],
      ),
      body: Center(

        child: Column(

          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(height: 30),
            CustomButton(
              onPressed: planificacionSemanal,
              buttonText: 'Botón 1',
              overlayImage: 'resources/images/fondo2.jpg', diasemana: 'Lunes', // Ruta de la imagen
            ),
            SizedBox(height: 20),
            CustomButton(
              onPressed: () {
                // Acción al pulsar el botón
                print('Botón 2 pulsado');
              },
              buttonText: 'Botón 2',
              overlayImage: 'resources/images/fondo2.jpg', diasemana: 'Martes', // Ruta de la imagen
            ),
            SizedBox(height: 20),
            CustomButton(
              onPressed: () {
                // Acción al pulsar el botón
                print('Botón 2 pulsado');
              },
              buttonText: 'Botón 2',
              overlayImage: 'resources/images/fondo2.jpg', diasemana: 'Miércoles', // Ruta de la imagen
            ),
            SizedBox(height: 20),
            CustomButton(
              onPressed: () {
                // Acción al pulsar el botón
                print('Botón 2 pulsado');
              },
              buttonText: 'Botón 2',
              overlayImage: 'resources/images/fondo2.jpg', diasemana: 'Jueves', // Ruta de la imagen
            ),
            SizedBox(height: 20),
            CustomButton(
              onPressed: () {
                // Acción al pulsar el botón
                print('Botón 2 pulsado');
              },
              buttonText: 'Botón 2',
              overlayImage: 'resources/images/fondo2.jpg', diasemana: 'Viernes', // Ruta de la imagen
            ),
            const SizedBox(height: 20),
            CustomButton(
              onPressed: () {
                // Acción al pulsar el botón
                print('Botón 2 pulsado');
              },
              buttonText: 'Botón 2',
              overlayImage: 'resources/images/fondo2.jpg', diasemana: 'Sábado', // Ruta de la imagen
            ),
            SizedBox(height: 20),
            CustomButton(
              onPressed: () {
                // Acción al pulsar el botón
                print('Botón 2 pulsado');
              },
              buttonText: 'Botón 2',
              overlayImage: 'resources/images/fondo2.jpg', diasemana: 'Domingo', // Ruta de la imagen
            ),
          ],
        ),
      ),
    );
  }
}

