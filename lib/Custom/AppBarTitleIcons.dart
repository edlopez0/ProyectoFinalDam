import 'package:flutter/material.dart';
class AppBarTitleIcons extends StatelessWidget implements PreferredSizeWidget {
  final String titulo;
  final VoidCallback butonIconBuscar;
  final VoidCallback butonIconAjuste;

  AppBarTitleIcons({
    Key? key,
    required this.titulo,
    required this.butonIconBuscar,
    required this.butonIconAjuste,
  }) : super(key: key);

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(titulo),
      backgroundColor: Colors.black54,
      actions: <Widget>[
        IconButton(
          icon: Icon(Icons.search),
          onPressed: butonIconBuscar,
        ),
        IconButton(
          icon: Icon(Icons.settings),
          onPressed: butonIconAjuste,focusColor: Colors.lime,
        ),
      ],
    );
  }
}

/*class AppBarTitleIcons extends StatelessWidget{
   String titulo;
   final VoidCallback butonClick;
   final VoidCallback butonClick2;

 /* AppBarTitleIcons({Key? key,
    required this.titulo,
    required this.butonClick,
    required this.butonClick2
  }) :super(key:key);*/

  AppBarTitleIcons ({super.key,
    required this.titulo,
    required this.butonClick,
    required this.butonClick2,
  });

  @override
  Widget build(BuildContext context) {
      return AppBar(
        title: Text(titulo),
        backgroundColor: Colors.black54,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search),
            onPressed: (){butonClick;},
          ),
          IconButton(
            icon: Icon(Icons.settings),
            onPressed: (){butonClick;},
          ),
        ],
      );
    }
  }*/