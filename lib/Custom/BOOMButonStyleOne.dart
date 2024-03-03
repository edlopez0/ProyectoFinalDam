import 'package:flutter/material.dart';

class BOOMButtonStyleOne extends StatelessWidget {
  final Function onPressed;
  final String text;
  final Color textColor;
  final double padding;
  final double fontSize;
  final Color backgroundColor;
  final double borderRadius;

  BOOMButtonStyleOne({
    required this.onPressed,
    required this.text,
    this.textColor = Colors.white,
    this.padding = 16.0,
    this.fontSize = 16.0,
    this.backgroundColor = Colors.blue,
    this.borderRadius = 8.0,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(padding),
      child: ElevatedButton(
        onPressed: () => onPressed(),
        child: Text(
          text,
          style: TextStyle(
            color: textColor,
            fontSize: fontSize,
          ),
        ),
        style: ElevatedButton.styleFrom(
          backgroundColor: backgroundColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius),
          ),
        ),
      ),
    );
  }
}