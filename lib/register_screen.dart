import 'package:flutter/material.dart';
import 'dart:ui';
import 'main.dart';

// ignore: use_key_in_widget_constructors
class RegisterScreen extends StatelessWidget {
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
                            'Regístrate',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 18,
                              fontStyle: FontStyle.italic,
                            ),
                          ),
                          const SizedBox(height: 32),
                          _buildTextFormField('Nombre'), 
                          _buildTextFormField('Correo electrónico'), 
                          _buildTextFormField('Contraseña', isPassword: true), 
                          _buildTextFormField('Confirmar contraseña', isPassword: true), 
                          const SizedBox(height: 32),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              _buildButton(context, 'Volver', Colors.white,
                                  Colors.black),
                              _buildButton(context, 'Crear Cuenta', const
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
      padding: const EdgeInsets.only(bottom: 40.0),
      child: TextFormField(
        decoration: InputDecoration(
          labelText: label,
          alignLabelWithHint: true,
          contentPadding: const EdgeInsets.symmetric(horizontal: 10),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.0),
            borderSide: const BorderSide(color: Colors.blue, width: 2.0),
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
            horizontal: 32.0, vertical: 8.0), 
      ),
      onPressed: () {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (_) => InicioSesionScreen()),
        );
      },
    );
  }
}
