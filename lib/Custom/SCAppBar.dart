import 'package:flutter/material.dart';

class SCAppBar extends StatelessWidget{
   String sTituloBar;

   SCAppBar({Key? key,
     this.sTituloBar=" ",
   }):super (key: key);
  @override
  Widget build(BuildContext context) {
    // TODO: implement build

return  AppBar(
    title: Text('Mi Aplicación Flutter'),
    actions: <Widget>[
    IconButton(
    icon: Icon(Icons.search),
    onPressed: () {
    // Lógica para manejar la acción de búsqueda
    },
    ),
    IconButton(
    icon: Icon(Icons.settings),
    onPressed: () {
    // Lógica para manejar la acción de configuración
    },
    ),
    ],
    );
  }
}


//app creada utilizada
buildAppBar(String s) {
  return AppBar(
    title: Text(s),
    backgroundColor: Colors.black54,
    actions: <Widget>[
      IconButton(
        icon: Icon(Icons.search),
        onPressed: () {
          // Lógica para manejar la acción de búsqueda
        },
      ),
      IconButton(
        icon: Icon(Icons.settings),
        onPressed: () {
          // Lógica para manejar la acción de configuración
        },
      ),
    ],
  );
}

