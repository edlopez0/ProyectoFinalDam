import 'package:flutter/material.dart';
import '../../Singletone/DataHolder.dart';
import '../SCText.dart';

class DBDrawerFiveButtons extends StatefulWidget {
  final VoidCallback bClickClose;
  final VoidCallback bClickUsuario;
  final VoidCallback bClickFoto;
  final VoidCallback bClickSettings;
  final VoidCallback bClickHelp;
  final VoidCallback bClickAboutUs;

  const DBDrawerFiveButtons({
    Key? key,
    required this.bClickClose,
    required this.bClickUsuario,
    required this.bClickFoto,
    required this.bClickSettings,
    required this.bClickHelp,
    required this.bClickAboutUs,
  }) : super(key: key);

  @override
  _DBDrawerFiveButtonsState createState() => _DBDrawerFiveButtonsState();
}

class _DBDrawerFiveButtonsState extends State<DBDrawerFiveButtons> {
  String? rutaImg;

  @override
  void initState() {
    super.initState();
     cargarRutaImagenPerfil();

  }


  Future<void> cargarRutaImagenPerfil() async {

    final ruta = await DataHolder().firebaseAdmin.obtenerRutaImagenPerfil();
      setState(() {
        rutaImg = ruta;
        print('rutaImg: $ruta');
      });
    }


  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          Padding(padding: EdgeInsets.all(25)),
          if (rutaImg != null)
            CircleAvatar(
              radius: 80.0, // El radio del círculo
              backgroundImage: NetworkImage(rutaImg!),
              backgroundColor: Colors.transparent, // Si no hay imagen, muestra un color de fondo
            ),
          if (rutaImg == null)
            ClipOval(

              child: Image.asset("resources/icons/usuario.png",height: 50,width: 50,),
            ),
          Padding(padding: EdgeInsets.only(bottom: 100)),


          Column(
            children: [
              botonesDrawer(Icons.account_box, "Mi cuenta", widget.bClickUsuario, Colors.black87),
              botonesDrawer(Icons.add_a_photo_rounded, "Añadir foto", widget.bClickFoto, Colors.blue),
              botonesDrawer(Icons.settings, "Configuración", widget.bClickSettings, Colors.green),
              botonesDrawer(Icons.help_outline, "Ayuda", widget.bClickHelp, Colors.orange),
              botonesDrawer(Icons.info_outline, "Acerca de", widget.bClickAboutUs, Colors.purple),
              botonesDrawer(Icons.close_rounded, "Cerrar Sesión", widget.bClickClose, Colors.red),
            ],
          ),
        ],
      ),
    );
  }

  Widget botonesDrawer(IconData icon, String texto, VoidCallback onTap, Color color) {
    return InkWell(
      onTap: onTap,
      child: Row(
        children: [
          SizedBox(width: 10),
          Icon(icon, color: color, size: 40),
          SizedBox(width: 10),
          SCText(sTexto: texto, fontSize: 14),
        ],
      ),
    );
  }
}