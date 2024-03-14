import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: InicioSesionScreen(),
    );
  }
}

class InicioSesionScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          decoration: BoxDecoration(
              image: DecorationImage(
              image: AssetImage('assets/images/background.png'), // Reemplaza con tu ruta de imagen.
              fit: BoxFit.cover, // Esto asegurará que la imagen cubra toda la pantalla.
            ),
          ),
          child: Padding(
            padding: EdgeInsets.all(20.0),
            child: Column(
              children: <Widget>[
                SizedBox(height: 80),
                Text(
                  'CLASS HECK',
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 60),
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Correo electrónico',
                    // Aquí personalizas tu TextFormField
                  ),
                ),
                SizedBox(height: 20),
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Contraseña',
                    // Personaliza tu TextFormField
                  ),
                  obscureText: true,
                ),
                SizedBox(height: 20),
                Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                    child: Text('¿Olvidaste la contraseña?'),
                    onPressed: () {
                      // Lógica para olvidar la contraseña
                    },
                  ),
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  child: Text('Siguiente'),
                  onPressed: () {
                    // Lógica para el inicio de sesión
                  },
                ),
                TextButton(
                  child: Text('Crear cuenta'),
                  onPressed: () {
                    // Navegar a la pantalla de crear cuenta
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
