import 'package:flutter/material.dart';
import 'package:titulacion_app/presentation/screens/authentication/login_screen.dart';
import 'package:titulacion_app/presentation/screens/authentication/register_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool showLogin = true;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        // Calculamos el ancho
        double width =
            constraints.maxWidth < 900 ? constraints.maxWidth * 0.9 : 900;

        return Scaffold(
          backgroundColor: Colors.grey[200],
          body: Center(
            child: AnimatedSwitcher(
              duration: const Duration(milliseconds: 500),
              child: SizedBox(
                width: width, // Ancho dinámico
                // Altura fija
                child: showLogin
                    ? LoginScreen(onToggle: toggleForm)
                    : RegisterScreen(onToggle: toggleForm),
              ),
            ),
          ),
        );
      },
    );
  }

  void toggleForm() {
    setState(() {
      showLogin = !showLogin;
    });
  }
}
