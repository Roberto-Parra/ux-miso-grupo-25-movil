import 'package:flutter/material.dart';
import 'dart:ui';
import 'main.dart';

// ignore: use_key_in_widget_constructors
class RecoverScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(24),
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/background.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                ClipRRect(
                  borderRadius: BorderRadius.circular(20.0),
                  child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          vertical: 18.0, horizontal: 18.0),
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.5),
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          const Text(
                            'Ingrese el correo',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 18,
                              fontStyle: FontStyle.italic,
                            ),
                          ),
                          const SizedBox(height: 32),
                          _buildTextFormField('Correo de recuperación'),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              _buildButton(context, 'Volver', Colors.white,
                                  Colors.black),
                              _buildButton(context, 'Siguiente', const
                                  Color(0xFF045CFC), Colors.white),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTextFormField(String label, {bool isPassword = false}) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 30.0),
      child: TextFormField(
        decoration: InputDecoration(
          labelText: label,
          alignLabelWithHint: true,
          labelStyle: TextStyle(color: Colors.black),
          contentPadding: const EdgeInsets.symmetric(horizontal: 10),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.0),
            borderSide: const BorderSide(color: Colors.black, width: 2.0),
          ),
          focusedBorder: const OutlineInputBorder(
      borderSide: BorderSide(color: Colors.black, width: 2.0),
    ),
        ),
        textAlign: TextAlign.center, 
        obscureText: isPassword,
      ),
    );
  }

  Widget _buildButton(
      BuildContext context, String text, Color bgColor, Color textColor) {
    return ElevatedButton(
      child: Text(text, style: TextStyle(color: textColor)),
      style: ElevatedButton.styleFrom(
        elevation: 0,
        foregroundColor: textColor, backgroundColor: bgColor, 
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.0)), 
        padding: const EdgeInsets.symmetric(
            horizontal: 32.0, vertical: 2.0), 
      ),
      onPressed: () {
        if (text == 'Siguiente') {
        _showRecoveryDialog(context); // Llama al diálogo de recuperación
      } else {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (_) => InicioSesionScreen()),
        );
      }
      },
    );
  }
  void _showRecoveryDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
        //titlePadding: const EdgeInsets.fromLTRB(24.0, 24.0, 24.0, 0),
        //contentPadding: const EdgeInsets.fromLTRB(24.0, 20.0, 24.0, 0),
        //actionsPadding: const EdgeInsets.symmetric(horizontal: 10.0),
        insetPadding: const EdgeInsets.all(10),
        buttonPadding: const EdgeInsets.all(0),
        title: Align(
          alignment: Alignment.topRight,
          child: IconButton(
            icon: const Icon(Icons.close),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ),
        content: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(
              Icons.check_circle_outline,
              color: Colors.black,
              size: 24,
            ),
            const SizedBox(width: 30), 
            Expanded(
              child: RichText(
                textAlign: TextAlign.left,
                text: TextSpan(
                  text: 'Se envió un mensaje al correo ',
                  style: TextStyle(color: Colors.black),
                  children: const <TextSpan>[
                    TextSpan(
                      text: 'Cesar@gmail.com',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
        actions: <Widget>[
          Center(
            child: TextButton(
              child: const Text('Aceptar', style: TextStyle(color: Colors.black)),
              onPressed: () {
                Navigator.of(context).pop(); 
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (_) => InicioSesionScreen()), 
                );
              },
            ),
          ),
        ],
      );
    },
  );
}


}
