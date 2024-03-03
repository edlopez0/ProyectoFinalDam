import 'package:flutter/material.dart';

import 'package:firebase_auth/firebase_auth.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _auth = FirebaseAuth.instance;
  String email = '';
  String password = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Animator<double>(
              curve: Curves.easeIn,
              cycles: 1,
              duration: Duration(seconds: 1),
              tween: Tween<double>(begin: 0, end: 1),
              builder: (context, animatorState, child) => Opacity(
                opacity: animatorState.value,
                child: TextField(
                  onChanged: (value) => email = value,
                  decoration: InputDecoration(
                    hintText: 'Email',
                  ),
                ),
              ),
            ),
            Animator<double>(
              curve: Curves.easeIn,
              cycles: 1,
              duration: Duration(seconds: 1),
              tween: Tween<double>(begin: 0, end: 1),
              builder: (context, animatorState, child) => Opacity(
                opacity: animatorState.value,
                child: TextField(
                  obscureText: true,
                  onChanged: (value) => password = value,
                  decoration: InputDecoration(
                    hintText: 'Password',
                  ),
                ),
              ),
            ),
            SignInButton(
              Buttons.Email,
              text: "Iniciar sesión con Email",
              onPressed: () async {
                // Lógica para iniciar sesión con Email y Password
              },
            ),
            SignInButton(
              Buttons.Google,
              text: "Registrarse con Google",
              onPressed: () {
                // Lógica para registro con Google
              },
            ),
            SignInButton(
              Buttons.Facebook,
              text: "Registrarse con Facebook",
              onPressed: () {
                // Lógica para registro con Facebook
              },
            ),
          ],
        ),
      ),
    );
  }
}