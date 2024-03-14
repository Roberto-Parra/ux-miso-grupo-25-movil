import 'package:flutter/material.dart';
import 'notification_screen.dart';
import 'register_screen.dart';

void main() {
  runApp(MyApp());
}
// ignore: use_key_in_widget_constructors
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Login Design',
      debugShowCheckedModeBanner: false,
      home: InicioSesionScreen(),
    );
  }
}

// ignore: use_key_in_widget_constructors
class InicioSesionScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/background.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: SingleChildScrollView(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 40.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  SizedBox(height: MediaQuery.of(context).size.height * 0.1),
                  Container(
                    padding: const EdgeInsets.all(30),
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.36),
                      borderRadius: BorderRadius.circular(32),
                    ),
                    child: Column(
                      children: [
                        const Image(
                          image: AssetImage('assets/images/Logo1.png'),
                          width: 200, 
                          height: 50,),
                        const SizedBox(height: 40),
                        TextFormField(
                          decoration: InputDecoration(
                            hintText: 'Correo electrónico',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5.0),
                              borderSide: const BorderSide(color: Colors.black),
                            ),
                          ),
                        ),
                        const SizedBox(height: 20),
                        TextFormField(
                          obscureText: true,
                          decoration: InputDecoration(
                            hintText: 'Contraseña',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5.0),
                              borderSide: const BorderSide(color: Colors.black),
                            )
                          ),
                        ),
                        const SizedBox(height: 10),
                        TextButton(
                          child: const Text(
                            '¿Olvidaste la contraseña?',
                            style: TextStyle(color: Color(0xFF045CFC)),
                          ),
                          onPressed: () {
                            // TODO: Implementar funcionalidad
                          },
                        ),
                        const SizedBox(height: 20),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: TextButton(
                                child: const Text(
                                  'Crear cuenta',
                                  style: TextStyle(color: Color(0xFF045CFC)),
                                ),
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(builder: (context) => RegisterScreen()),
                                      );
                                },
                              ),
                            ),
                            const SizedBox(width: 20), 
                            Expanded(
                              child: ElevatedButton(
                                child: Text('Siguiente',
                                style: TextStyle(color: Colors.white)),
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: const Color(0xFF045CFC),
                                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
                                ),
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(builder: (context) => NotificationScreen()),
                                      );
                                },
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
