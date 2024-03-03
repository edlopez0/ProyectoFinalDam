import 'package:flutter/material.dart';


class DBDrawer extends StatefulWidget {
  @override
  _DBDrawerState createState() => _DBDrawerState();
}

class _DBDrawerState extends State<DBDrawer> with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 1),
      vsync: this,
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void navigateWithAnimation(BuildContext context, Widget destination) {
    _controller.forward(from: 0).then((_) {
      Navigator.of(context).push(MaterialPageRoute(builder: (context) => destination));
    });
  }

  Widget drawerButton(IconData icon, String label, Widget destination) {
    return ListTile(
      leading: Icon(icon),
      title: Text(label),
      onTap: () => navigateWithAnimation(context, destination),
    );
  }

  @override
  Widget build(BuildContext context) {
    return
      Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              child: Text('Encabezado'),
              decoration: BoxDecoration(
                color: Colors.lightGreenAccent,
              ),
            ),

            // Agrega más botones aquí
          ],
        ),
    );
  }
}



