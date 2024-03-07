
import 'package:flutter/material.dart';


import '../Modelos/Gif.dart';
import '../Singletone/DataHolder.dart';

class Gyfs extends StatefulWidget {
  @override
  State<Gyfs> createState() => _GyfsState();
}

class _GyfsState extends State<Gyfs> {
 // Gyfs({super.key});
  List<Gifs> listaGifs=[];

  @override
  void initState() {
    super.initState();
    _loadGyfs();
  }

  Future<void> _loadGyfs() async {
    try {
      listaGifs = await DataHolder().adminHttp.obtenerGifs();
      listaGifs.forEach((gifs) {
        _listaGyfs(gifs as List<Gifs>);
        print(gifs.toString());
        print("cargado los gifs ");
      });
    } catch (error) {
      print("Error obteniendo la temperatura: $error");
      setState(() {
       listaGifs;
      });
    }
  }

  List<Widget> _listaGyfs(List<Gifs> data){
    List<Widget> gifs=[];
    for(var gif in data) {
      gifs.add(Card(
        child: Padding(
          padding: const EdgeInsets.all(8.0), // Ajusta el valor del margen según tus necesidades
          child: Column(
            children: [
              Image.network(gif.url,width: 1.1,height: 1.1,), // Elimina las propiedades width y height para dejar que Flutter determine el tamaño automáticamente
              Text(gif.title),
            ],
          ),
        ),
      ));
    }
    return gifs;
  }

  @override
  Widget build(BuildContext context) {
    //List<Gifs> listaDeGifs = []; // Aquí debes inicializar tu lista de Gifs

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Hola Mundo'),
        ),
        body: Center(
          child: Column(
            children: <Widget>[
              // Llama a la función _listaGyfs() y pasa la lista de Gifs como argumento
              Expanded(
                child: ListView(
                  children: _listaGyfs(listaGifs),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}