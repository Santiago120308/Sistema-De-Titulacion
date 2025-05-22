import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:titulacion_app/providers/auth/auth_provider.dart';
import 'package:titulacion_app/services/navigation_service_go.dart';

class AcademicoHomeScreen extends StatelessWidget {
  const AcademicoHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {

     final authService = Provider.of<AuthService>(context);

    return Column(children: [
               Align(
                  alignment: Alignment.topRight,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromARGB(255, 162, 162, 162),
                      foregroundColor: Colors.white,
                    ),
                    onPressed: () async {
                     
                      await authService.logout();
                      if (context.mounted) {
                        NavigationServiceGo.popAndPushTo(context, '/');
                      }
                    },
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 10),
                      child: Text(
                        "Cerrar Sesión",
                        style: GoogleFonts.poppins(fontSize: 15),
                      ),
                    ),
                  ),
                ),
      const Center(child: Text('DEPARTAMENTO ACADEMICO'),)
    ]);
  }
}