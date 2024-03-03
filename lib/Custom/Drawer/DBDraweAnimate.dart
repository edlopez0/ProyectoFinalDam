import 'package:flutter/material.dart';

import '../Buttons/DBBotonIcon.dart';

class DBDraweAnimate extends StatefulWidget {
  final List<Widget> drawerItems;

  DBDraweAnimate({Key? key, required this.drawerItems}) : super(key: key);

  @override
  _DBDraweAnimateState createState() => _DBDraweAnimateState();
}

class _DBDraweAnimateState extends State<DBDraweAnimate> with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 300),
    );
  }

  void toggleDrawer() => _controller.isDismissed ? _controller.forward() : _controller.reverse();

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Stack(
        children: <Widget>[
           Container(
              color: Colors.cyan,
              child: ListView(
                padding: EdgeInsets.zero,
                children: widget.drawerItems,
              ),
            ),
          GestureDetector(
            onTap: () {
              if (!_controller.isDismissed) {
                _controller.reverse();
              }
            },
            child:
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  height: MediaQuery.of(context).size.height * 0.1,
                  color: Colors.white,
                ),
      DBBotonIcon(icon: Icons.add,name: "Cerrar",
          textColor: Colors.black,iconColor: Colors.black,fontSize: 14,paddingRight: 8),


    ],
            ),
            )

        ],
      ),
    );


  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}