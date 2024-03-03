
import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../Custom/ButtonStyleOne.dart';




class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  bool isHovered = false; // Estado para controlar si se pasa por encima
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pomodoro'),
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
      body: Center(
        child: CountdownTimer(),
      ),
    );
  }
}

class CountdownTimer extends StatefulWidget {
  @override
  _CountdownTimerState createState() => _CountdownTimerState();
}

class _CountdownTimerState extends State<CountdownTimer> {
  Timer? _timer;
  int hours = 0;
  int minutes = 0;
  int seconds = 0;
  int _totalSeconds;

  _CountdownTimerState() : _totalSeconds = 0; // Inicializa _totalSeconds

  void iniicia() {
    // Calcula el total de segundos a partir de horas, minutos y segundos
    _totalSeconds = hours * 3600 + minutes * 60 + seconds;

    _timer?.cancel(); // Cancela cualquier temporizador existente
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      if (_totalSeconds > 0) {
        setState(() {
          _totalSeconds--;
          // Actualiza horas, minutos y segundos basado en _totalSeconds
          hours = _totalSeconds ~/ 3600;
          minutes = (_totalSeconds % 3600) ~/ 60;
          seconds = _totalSeconds % 60;
        });
      } else {
        timer.cancel();
        // Opcional: Mostrar un diálogo al finalizar
        _showDialog('¡Tiempo completado!', Icons.check_circle_outline);
      }
    });
  }

  void finalizar() {
    _timer?.cancel();
    // Opcional: Mostrar un diálogo indicando que el temporizador ha sido detenido
    _showDialog('Temporizador detenido', Icons.pause_circle_filled);
  }

  void _showDialog(String message, IconData icon) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(message),
          content: Icon(icon, size: 64.0),
          actions: <Widget>[
            TextButton(
              child: Text('Cerrar'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset("resources/android/gifs/relojVuela.gif",height: 200,width: 200,),
        Text(
          '$hours:${minutes.toString().padLeft(2, '0')}:${seconds.toString().padLeft(2, '0')}',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        Column(

          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            buildTimePicker('Hours', hours, (value) {
              setState(() {
                hours = value;
              });
            }),
            buildTimePicker('Minutes', minutes, (value) {
              setState(() {
                minutes = value;
              });
            }),
            buildTimePicker('Seconds', seconds, (value) {
              setState(() {
                seconds = value;
              });
            }),
            ButtonStyleOne(onPressed: iniicia,buttonText: "iniciar",),
            ButtonStyleOne(onPressed: finalizar,buttonText: "parar",),

          ],

        ),
      ],
    );
  }

  Widget buildTimePicker(String label, int value, ValueChanged<int> onChanged) {
    return Column(
      children: [
        Text(label),
        SizedBox(height: 8),
        Container(
          width: 200,
          child: Slider(
            value: value.toDouble(),
            min: 0,
            max: label == 'Hours' ? 24 : 59,
            onChanged: (double newValue) {
              onChanged(newValue.toInt()); // Corrección aquí
            },
            divisions: label == 'Hours' ? 24 : 59,
            label: value.toString(),
          ),
        ),
      ],
    );
  }
}