import 'package:flutter/material.dart';

class AlertaScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/backgroundPaper.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                'TIENES UNA INASISTENCIA EN MATEMÁTICAS',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              // Agrega los botones "Ignorar" y "Aceptar"
              // y cualquier otro widget que necesites
            ],
          ),
        ),
      ),
    );
  }
}
