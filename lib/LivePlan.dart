import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:proyecto_final/Main/HomeView.dart';
import 'package:proyecto_final/Main/SubirImagen.dart';
import 'package:proyecto_final/Main/Temporizador.dart';

import 'FirestoreObjects/PerfilUsuario.dart';
import 'Main/PlanificacionSemanal.dart';
import 'Main/Pomodoro.dart';
import 'OnBoarding/LoginView.dart';
import 'OnBoarding/PhoneLoginView.dart';
import 'OnBoarding/RegistroView.dart';
import 'Splash/SplashView.dart';

class LivePlan extends StatelessWidget {
  const LivePlan({super.key});

  @override
  Widget build(BuildContext context) {
    MaterialApp materialApp;
    if (kIsWeb) {
      materialApp = MaterialApp(
        title: "live_plan",
        routes: {
          '/loginview': (context) => LoginView(),
         '/registroview': (context) => RegistroView(),
          '/phoneverifica' : (context) => PhoneLoginView(),
          '/splashview': (context) => SplashView(),
        },
        initialRoute: '/loginview',
        theme: ThemeData.fallback(),
      );
    } else {
      materialApp = MaterialApp(
        title: "Live_plan",
        routes: {
          '/loginview': (context) => LoginView(),
          '/registroview': (context) => RegistroView(),
          '/phoneverifica' : (context) => PhoneLoginView(),
          '/splashview': (context) => SplashView(),
          '/homeview': (context) => HomeView(),
          '/pomodoro': (context) =>HomeScreen(),
          '/temporizador': (context) => Temporizador(),
          '/tareas' : (context) => PlanificacionSemanal(),
          '/subirfoto': (context) => SubirImagen(),
          '/perfil': (context) => PerfilUsuario(),

          /*              CustomContainer(color: Colors.red, text: 'SALUD', route: '/salud'),
                CustomContainer(color: Colors.blue, text: 'TAREAS DIARIAS', route: '/tareas'),
                CustomContainer(color: Colors.green, text: 'POMODORO', route: '/pomodoro'),
                CustomContainer(color: Colors.orange, text: 'CALCULAR ÍNDICE', route: '/indice'),
                CustomContainer(color: Colors.purple, text: 'FRASE', route: '/frase'),
                CustomContainer(color: Colors.yellow, text: 'OTRO', route: '/otro'),*/
        },
        initialRoute: '/homeview',

      );
    }

    return materialApp;
  }
}


