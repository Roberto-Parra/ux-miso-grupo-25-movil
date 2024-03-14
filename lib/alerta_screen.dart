import 'package:flutter/material.dart';
import 'dart:ui'; // Importar para usar ImageFilter.blur

class AlertaScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(24),
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/backgroundPaper.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                // Contenedor con efecto de desenfoque
                ClipRRect(
                  borderRadius: BorderRadius.circular(20.0),
                  child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                    child: Container(
                      padding: EdgeInsets.symmetric(vertical: 18.0, horizontal: 18.0), // Aumenta el espaciado
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.5),
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          Text(
                            'TIENES UNA INASISTENCIA EN',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 16,
                            ),
                          ),
                          Text(
                            'MATEMÁTICAS',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 40,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 20), // Espacio entre texto y campana
                          Icon(
                            Icons.notifications_active,
                            size: 60.0,
                            color: Colors.black,
                          ),
                          SizedBox(height: 32), // Espacio entre campana y botones
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly, // Distribuye el espacio uniformemente
                            children: [
                              _buildButton(context, 'Ignorar', Colors.white, Colors.black), // Botón Ignorar con texto negro
                              _buildButton(context, 'Aceptar', Color(0xFF045CFC), Colors.white), // Botón Aceptar con texto blanco
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

  Widget _buildButton(BuildContext context, String text, Color bgColor, Color textColor) {
    return ElevatedButton(
      child: Text(text, style: TextStyle(color: textColor)),
      style: ElevatedButton.styleFrom(
        foregroundColor: textColor, backgroundColor: bgColor, // Color del texto
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)), // Forma de los botones
        padding: EdgeInsets.symmetric(horizontal: 32.0, vertical: 8.0), // Padding interno de los botones
      ),
      onPressed: () {
        // TODO: Agregar funcionalidad de botón
      },
    );
  }
}
