
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../Custom/BOOMButonStyleOne.dart';
class PhoneLoginView extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => _PhoneLoginViewState();
}
//se inplente  en los statefullwidget
class _PhoneLoginViewState extends State<PhoneLoginView> {
  TextEditingController tecNumberPhone=TextEditingController();
  TextEditingController tecVerificacion=TextEditingController();
  String sVerificacionCodigo=" ";
  bool blMostrarVerification=false;

  void btVerificarNumero() async {
    String sTelefono =tecNumberPhone.text;

    await FirebaseAuth.instance.verifyPhoneNumber(
        phoneNumber: sTelefono,
        verificationCompleted: verificacionCompleta,
        verificationFailed: verificationFailed,
        codeSent: codeSent,
        codeAutoRetrievalTimeout: codeAutoRetrievalTimeout);
  }
//verifica  el codigo sms
  void btVerificarCodigo() async{
    String smsCode=tecVerificacion.text;
    PhoneAuthCredential credential = PhoneAuthProvider.credential(verificationId: sVerificacionCodigo, smsCode: smsCode);
    // Sign the user in (or link) with the credential
    await FirebaseAuth.instance.signInWithCredential(credential);
    Navigator.of(context).popAndPushNamed('/homeview');

  }
  void verificacionCompleta(PhoneAuthCredential credential) async{
    await FirebaseAuth.instance.signInWithCredential(credential);
    // Navigator.of(context).popAndPushNamed('/homeview');


  }
  void verificationFailed(FirebaseAuthException error) {
    if (error.code == 'invalid-phone-number') {
      print('The provided phone number is not valid.');
    }

  }
  void codeSent(String codigo, int? forceResendingToken) async {

    sVerificacionCodigo=codigo;
    setState(() {
      blMostrarVerification=true;
    });

  }
  void codeAutoRetrievalTimeout(String verificationId) {
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold

      (

      appBar: AppBar(
        title: Text('Verificación  por Phone'),
      ),
      body: Padding(

        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            TextField(
              controller: tecNumberPhone,
              decoration: InputDecoration(labelText: 'Número teléfono'),
            ),
            BOOMButtonStyleOne(onPressed: btVerificarNumero, text: "enviar código"),
            SizedBox(height: 6.0),
            if(blMostrarVerification)
              TextField(
                controller: tecVerificacion,
                decoration: InputDecoration(labelText: 'código verificación'),
              ),
            SizedBox(height: 4.0),
            if(blMostrarVerification)
              BOOMButtonStyleOne(onPressed: btVerificarCodigo, text: "verificar código"),
            //crear  a la subida y cargada  de laimagen

            //  child: Text('Registrar'),
            //),
          ],
        ),
      ),
    );

  }



}




