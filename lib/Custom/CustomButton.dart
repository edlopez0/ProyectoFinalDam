import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String buttonText;
  final String overlayImage;

  const CustomButton({
    required this.onPressed,
    required this.buttonText,
    required this.overlayImage,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Container(
            width: 200,
            height: 50,
            color: Colors.blue,
            child: Center(
              child: Text(
                buttonText,
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
          Positioned.fill(
            child: Image.asset(
              overlayImage,
              fit: BoxFit.cover,
            ),
          ),
        ],
      ),
    );
  }
}