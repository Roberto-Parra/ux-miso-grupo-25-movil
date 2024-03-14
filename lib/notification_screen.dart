import 'package:flutter/material.dart';
import 'dart:ui';
import 'loading_screen.dart';

// ignore: use_key_in_widget_constructors
class NotificationScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(24),
        decoration: const BoxDecoration(
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
                      padding: const EdgeInsets.symmetric(vertical: 18.0, horizontal: 18.0), 
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.5),
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          const Text(
                            'TIENES UNA INASISTENCIA EN',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 16,
                            ),
                          ),
                          const Text(
                            'MATEMÁTICAS',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 40,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 20), 
                          const Icon(
                            Icons.notifications_active,
                            size: 60.0,
                            color: Colors.black,
                          ),
                          const SizedBox(height: 32), 
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly, 
                            children: [
                              _buildButton(context, 'Ignorar', Colors.white, Colors.black), 
                              _buildButton(context, 'Aceptar', const Color(0xFF045CFC), Colors.white), 
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
      foregroundColor: textColor, backgroundColor: bgColor, 
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)), 
      padding: const EdgeInsets.symmetric(horizontal: 32.0, vertical: 8.0), 
    ),
    onPressed: () {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (_) => LoadScreen()),
      );
    },
  );
}
}
