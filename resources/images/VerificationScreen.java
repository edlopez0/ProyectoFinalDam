class VerificationScreen extends StatefulWidget {
  @override
  _VerificationScreenState createState() => _VerificationScreenState();
}

class _VerificationScreenState extends State<VerificationScreen> {
  TextEditingController tecNumberPhone = TextEditingController();
  TextEditingController tecVerificacion = TextEditingController();
  bool blMostrarVerification = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Verificación por Teléfono'),
      ),
      body: Stack(
        fit: StackFit.expand,
        children: [
          // Fondo móvil
          Image.asset(
            "assets/background.jpg",
            fit: BoxFit.cover,
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                // Selección de país con bandera
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.flag), // Icono de bandera
                    SizedBox(width: 10),
                    DropdownButton<String>(
                      // Agrega aquí la lógica para seleccionar el país
                      items: <String>['+1', '+91', '+52', '+86']
                          .map((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                      onChanged: (String? newValue) {
                        // Agrega aquí la lógica para cambiar el país
                      },
                      // Valor predeterminado para mostrar
                      value: '+1',
                    ),
                  ],
                ),
                SizedBox(height: 16.0),
                // Entrada de número de teléfono centrada
                TextField(
                  controller: tecNumberPhone,
                  textAlign: TextAlign.center,
                  decoration: InputDecoration(
                    labelText: 'Número de teléfono',
                    alignLabelWithHint: true,
                  ),
                ),
                SizedBox(height: 16.0),
                // Botón para enviar código
                ElevatedButton(
                  onPressed: btVerificarNumero,
                  child: Text("Enviar código"),
                ),
                SizedBox(height: 16.0),
                // Entrada de código de verificación
                if (blMostrarVerification)
                  TextField(
                    controller: tecVerificacion,
                    textAlign: TextAlign.center,
                    decoration: InputDecoration(
                      labelText: 'Código de verificación',
                      alignLabelWithHint: true,
                    ),
                  ),
                SizedBox(height: 24.0),
                // Botón para verificar código
                if (blMostrarVerification)
                  ElevatedButton(
                    onPressed: btVerificarCodigo,
                    child: Text("Verificar código"),
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void btVerificarNumero() {
    // Agrega aquí la lógica para enviar el código al número de teléfono
    setState(() {
      blMostrarVerification = true;
    });
  }

  void btVerificarCodigo() {
    // Agrega aquí la lógica para verificar el código ingresado
  }
}