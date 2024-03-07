import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:proyecto_final/Singletone/DataHolder.dart';
import '../Custom/Drawer/DBDraweFiveButtons.dart';
import '../FirestoreObjects/FbUsuario.dart';

class HomeView extends StatefulWidget {

  @override
  State<HomeView> createState() => _HomeViewState();
}


class _HomeViewState extends State<HomeView> {

  @override
  void initState() {
    super.initState();
    cargarLocalizacion();


  }

  void  cargarLocalizacion() async{
    Position pocicion= await DataHolder().geolocatorAdmin.obtenerPosition();
    print("GEOLOCATOR====su pocicion actual es : "+pocicion.toString());
  }


  @override
  Widget build(BuildContext context) {

    void clickClose(){
      Navigator.pop(context);
    }
    void clickPhoto(){
      Navigator.popAndPushNamed(context, '/subirfoto');
    }
    void clickSettings(){
      Navigator.popAndPushNamed(context, '/settings');
    }
    void clickHelp(){
      Navigator.popAndPushNamed(context, '/help');
    }
    void clickAboutUs(){
      Navigator.popAndPushNamed(context, '/aboutus');
    }


    Future<void> mostrarDatosUsuario2() async {
      // Obtiene el ID del usuario actual
      String? userId = DataHolder().firebaseAdmin.obtenerUserID();

      if (userId == null) {
        // Si no se puede obtener un userId, maneja el caso adecuadamente.
        print('Error: No se pudo obtener el ID del usuario.');
        return;
      }

      // Descarga los datos del usuario de forma asíncrona
      FbUsuario? usuario = await DataHolder().firebaseAdmin.descargarUsuario(userId);

      // Comprueba si el usuario fue encontrado
      if (usuario != null) {
        // Muestra un diálogo con los datos del usuario
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text("Datos del Usuario"),
              content: SingleChildScrollView(
                child: ListBody(
                  children: <Widget>[
                    Text("Nombre: ${usuario.nombre}"),
                    Text("Edad: ${usuario.edad}"),
                    Text("Altura: ${usuario.altura}"),
                    Text("País: ${usuario.pais}"),
                    Text("Sexo: ${usuario.sexo}"),
                    Text("Peso: ${usuario.peso}"),
                    Text("Email: ${usuario.email}"),
                    Text("Ciudad: ${usuario.ciudad}"),
                    // Agrega más campos según necesites
                  ],
                ),
              ),
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
      } else {
        // Muestra un mensaje si el usuario no se encuentra
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text("Error"),
              content: SingleChildScrollView(
                child: ListBody(
                  children: <Widget>[
                    Text("Usuario no encontrado."),
                  ],
                ),
              ),
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
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('Mi Aplicación'),
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(Icons.refresh),
            onPressed: () {
              // Acción al pulsar el icono de configuración
            },
          ),
          IconButton(
            icon: Icon(Icons.settings),
            onPressed: () {
              // Acción al pulsar el icono de favorito
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
                CustomContainer(color: Colors.cyan, text: 'Gyfs', route: '/viewgif'),
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
          bClickClose: clickClose,
          bClickUsuario: mostrarDatosUsuario2,
          bClickFoto: clickPhoto,
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

