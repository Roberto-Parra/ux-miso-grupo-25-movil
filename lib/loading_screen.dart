import 'package:flutter/material.dart';
import 'alerts_screen.dart'; // Asegúrate de importar alerts_screen.dart correctamente

// ignore: use_key_in_widget_constructors
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
    await Future.delayed(const Duration(seconds: 1));
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(builder: (_) => AlertsScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/load.png'),
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
