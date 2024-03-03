import 'package:flutter/material.dart';
import 'package:proyecto_final/Custom/Drawer/DBDraweAnimate.dart';

import '../Custom/Drawer/DBDraweFiveButtons.dart';


class HomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Mi Aplicación'),
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(Icons.settings),
            onPressed: () {
              // Acción al pulsar el icono de configuración
            },
          ),
          IconButton(
            icon: Icon(Icons.favorite),
            onPressed: () {
              // Acción al pulsar el icono de favorito
            },
          ),
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              // Acción al pulsar el icono de búsqueda
            },
          ),
        ],
      ),

      body: Column(
        children: [
          Expanded(
            child: GridView.count(
              crossAxisCount: 2,
              children: [
                CustomContainer(color: Colors.red, text: 'SALUD', route: '/salud'),
                CustomContainer(color: Colors.blue, text: 'TAREAS DIARIAS', route: '/tareas'),
                CustomContainer(color: Colors.green, text: 'POMODORO', route: '/pomodoro'),
                CustomContainer(color: Colors.orange, text: 'CALCULAR ÍNDICE', route: '/indice'),
                CustomContainer(color: Colors.purple, text: 'FRASE', route: '/frase'),
                CustomContainer(color: Colors.yellow, text: 'OTRO', route: '/otro'),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              'Descripción: Aquí encontrarás herramientas para mejorar tu salud, gestionar tareas diarias, aplicar la técnica Pomodoro, calcular índices y obtener inspiración con frases motivadoras.',
              style: TextStyle(fontSize: 16),
            ),
          ),
        ],
      ),
       drawer: DBDrawerFiveButtons(
          bClickClose: (){
            Navigator.pop(context);
          },
          bClickUsuario: () {
            Navigator.pop(context);
          },
          bClickFoto: () {
            Navigator.pop(context);
          },
          bClickSettings: () {
            Navigator.pop(context);
          },
          bClickHelp: () {
            Navigator.pop(context);
          },
          bClickAboutUs: () {
            Navigator.pop(context);
          },
        ),
    );

  }
}

class CustomContainer extends StatelessWidget {
  final Color color;
  final String text;
  final String route;

  const CustomContainer({required this.color, required this.text, required this.route});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, route);
      },
      child: Container(
        color: color,
        child: Center(
          child: Text(
            text,
            style: TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}

