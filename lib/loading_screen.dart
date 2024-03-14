import 'package:flutter/material.dart';
import 'alerts_screen.dart'; // Asegúrate de importar alerts_screen.dart correctamente

class LoadScreen extends StatefulWidget {
  @override
  _LoadScreenState createState() => _LoadScreenState();
}

class _LoadScreenState extends State<LoadScreen> {

  @override
  void initState() {
    super.initState();
    _navigateToAlertsAfterDelay();
  }

  _navigateToAlertsAfterDelay() async {
    // Esperar 2 segundos
    await Future.delayed(Duration(seconds: 1));
    // Navegar a AlertsScreen después del retraso
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(builder: (_) => AlertsScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    // Pantalla de carga con la imagen de fondo
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/load.png'),
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
