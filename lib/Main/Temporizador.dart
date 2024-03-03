import 'dart:async';
import 'package:flutter/material.dart';

class Temporizador extends StatefulWidget {
  @override
  _TemporizadorState createState() => _TemporizadorState();
}

class _TemporizadorState extends State<Temporizador> {
  Timer? _timer;
  int _start = 10; // Inicia la cuenta regresiva desde 10 segundos

  void startTimer() {
    const oneSec = const Duration(seconds: 1);
    _timer = new Timer.periodic(
      oneSec,
          (Timer timer) {
        if (_start == 0) {
          setState(() {
            timer.cancel();
            _showDialog('¡Conseguido!', 'Has completado el tiempo.');
          });
        } else {
          setState(() {
            _start--;
          });
        }
      },
    );
  }

  void _showDialog(String title, String message) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: new Text(title),
          content: new Text(message),
          actions: <Widget>[
            new ElevatedButton(
              child: new Text("Cerrar"),
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
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cronómetro de cuenta regresiva'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Tiempo: $_start',
              style: TextStyle(fontSize: 48),
            ),
            TextButton(
              onPressed: () {
                startTimer();
              },
              child: Text('Iniciar'),
            ),
            TextButton(
              onPressed: () {
                if (_timer!.isActive) {
                  _timer!.cancel();
                  _showDialog('Descanso', 'Has pausado el cronómetro para un descanso.');
                }
              },
              child: Text('Parar Descanso'),
            ),
          ],
        ),
      ),
    );
  }
}