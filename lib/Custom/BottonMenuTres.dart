import 'package:flutter/material.dart';

class BottonMenuTres extends StatelessWidget{
  Function(int indice)? onPressed;

  BottonMenuTres({Key? key,
    required this.onPressed,
  }):super(key:key);
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Row(
      children: [
        TextButton(onPressed: ()=> onPressed!(0), child:Icon(Icons.list_outlined),),
        TextButton(onPressed: ()=> onPressed!(1), child:Icon(Icons.ad_units_rounded),),
        TextButton(onPressed: ()=> onPressed!(2), child:Icon(Icons.add_home_work_outlined),),

      ],
    );
  }
}

