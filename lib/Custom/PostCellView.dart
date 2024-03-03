import 'package:flutter/material.dart';

class PostCellView extends StatelessWidget{
  final   String sText;
  final int iCodeColor;
  final double dFontSize;
  PostCellView({ super.key,
    required this.sText,
    required this.iCodeColor,
    required this.dFontSize,
  });
  @override
  Widget build(BuildContext context) {

  return Text(sText,
      style: TextStyle(color:Colors.yellow[iCodeColor],
      fontSize: dFontSize,
  ),
  );
  }

}