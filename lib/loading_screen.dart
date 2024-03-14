import 'package:flutter/material.dart';

class LoadScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/load.png'), // Cambia a la imagen de fondo deseada.
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}