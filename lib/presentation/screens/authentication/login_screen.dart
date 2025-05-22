import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:titulacion_app/presentation/shared/gradients.dart';
import 'package:titulacion_app/presentation/shared/textFieldForm.dart';
import 'package:titulacion_app/providers/auth/auth_provider.dart';
import 'package:titulacion_app/providers/login_provider.dart';
import 'package:titulacion_app/routes/app_router.dart';


import 'package:titulacion_app/services/navigation_service_go.dart';

class LoginScreen extends StatelessWidget {
  final VoidCallback onToggle;

  const LoginScreen({super.key, required this.onToggle});

  @override
  Widget build(BuildContext context) {
    // Definimos los controllers de los campos

    return LayoutBuilder(
      builder: (context, constraints) {
        // Si el ancho es menor a 600, ajustamos el tamaño de los elementos
        double containerHeight =
            constraints.maxWidth < 600 ? constraints.maxHeight : 450;

        return Container(
          height: containerHeight,
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                offset: const Offset(0, 5),
                blurRadius: 10,
                spreadRadius: 5,
              ),
            ],
            borderRadius: const BorderRadius.all(Radius.circular(20)),
          ),
          child: LayoutBuilder(
            builder: (context, constraints) {
              if (constraints.maxWidth < 600) {
                // Si el ancho es menor a 600, los elementos estarán uno encima del otro
                return SingleChildScrollView(
                  child: Column(
                    children: [
                      // Sección derecha (mensaje de bienvenida)
                      SizedBox(
                        height: 300,
                        child: Container(
                          decoration: borderRadius(
                              gradientCircular(),
                              const Color.fromARGB(255, 15, 66, 149),
                              const Radius.circular(15),
                              const Radius.circular(0),
                              const Radius.circular(15),
                              const Radius.circular(0)),
                          child: sectionRigthMessage(),
                        ),
                      ),
                      // Sección izquierda (formulario de inicio de sesión)
                      SizedBox(
                        height: constraints.maxHeight * 0.60,
                        child: Container(
                          decoration: borderRadius(
                              null,
                              const Color.fromARGB(255, 255, 255, 255),
                              const Radius.circular(0),
                              const Radius.circular(15),
                              const Radius.circular(0),
                              const Radius.circular(0)),
                          child: sectionLeftContent(context),
                        ),
                      ),
                    ],
                  ),
                );
              } else {
                // Si el ancho es mayor o igual a 600, los elementos estarán lado a lado
                return Row(
                  children: [
                    // Login de inicio de sesion
                    Expanded(
                      child: Container(
                        decoration: borderRadius(
                            null,
                            const Color.fromARGB(255, 255, 255, 255),
                            const Radius.circular(15),
                            const Radius.circular(15),
                            const Radius.circular(0),
                            const Radius.circular(0)),
                        child: sectionLeftContent(context),
                      ),
                    ),

                    // Message de registro
                    Expanded(
                      child: Container(
                        decoration: borderRadius(
                            gradientCircular(),
                            const Color.fromARGB(255, 15, 66, 149),
                            const Radius.circular(0),
                            const Radius.circular(0),
                            const Radius.circular(15),
                            const Radius.circular(15)),
                        child: sectionRigthMessage(),
                      ),
                    ),
                  ],
                );
              }
            },
          ),
        );
      },
    );
  }

  // Sección derecha de Inicio de sesión (mensaje de bienvenida)
  Widget sectionRigthMessage() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Mensaje de Bienvenida
          Text(
            "Bienvenido",
            style: GoogleFonts.poppins(
                fontSize: 35, color: Colors.white, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),

          // Mensaje pregunta
          Text(
            "¿No tienes una cuenta?",
            style: GoogleFonts.poppins(fontSize: 12, color: Colors.white),
          ),
          const SizedBox(height: 50),

          // Botón de Registro
          ElevatedButton(
            onPressed: onToggle,
            style: ElevatedButton.styleFrom(
                overlayColor: Colors.white,
                backgroundColor: Colors.transparent,
                side: const BorderSide(color: Colors.white, width: 0.6)),
            child: Padding(
              padding: const EdgeInsets.all(5.0),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "Registrate",
                  style: GoogleFonts.poppins(color: Colors.white),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  // Sección izquierda del formulario (login)
  Widget sectionLeftContent(BuildContext context) {
    final loginProvider = Provider.of<LoginProvider>(context);
    final auhtService = Provider.of<AuthService>(context);

    return SizedBox(
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.all(40.0),
        child: Form(
          key: loginProvider.formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Título
              Text(
                "Inicia Sesion",
                style: GoogleFonts.poppins(fontSize: 20, color: Colors.black),
              ),
              const SizedBox(height: 30),

              // Campo Email
              Text(
                "EMAIL",
                style: GoogleFonts.poppins(
                    fontSize: 14,
                    color: Colors.black,
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              SizedBox(
                height: 65,
                child: TextFormField(
                  onChanged: (value) => loginProvider.correo = value,
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return 'El correo es obligatorio';
                    }

                    if (!EmailValidator.validate(value)) {
                      return 'Introduce un correo valido';
                    }

                    return null;
                  },
                  decoration: builderInputDecoration("Email"),
                  style: const TextStyle(
                    fontSize: 14,
                  ),
                ),
              ),

              // Campo Password
              const SizedBox(height: 20),
              Text(
                "PASSWORD",
                style: GoogleFonts.poppins(
                    fontSize: 14,
                    color: Colors.black,
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              SizedBox(
                height: 65,
                child: TextFormField(
                  onChanged: (value) => (loginProvider.password = value),
                  validator: (value) => ((value == null || value.isEmpty)
                      ? "El password es obligatorio"
                      : null),
                  decoration: builderInputDecoration("Password"),
                  style: const TextStyle(
                    fontSize: 14,
                  ),
                  obscureText: true,
                ),
              ),

              // Botón Inicio de Sesión
              const SizedBox(height: 25),
              SizedBox(
                width: double.infinity,
                height: 45,
                child: ElevatedButton(
                  onPressed: () async {
                    // Acción de iniciar sesión
                    String? passed = loginProvider.passedValid();
                    if (passed == null) {
                      String? auth = await auhtService.login(
                          loginProvider.correo,
                          loginProvider.password,
                          context);
                         
                      if (auth == null) {
                       if(context.mounted){
                       
                         if (auhtService.role == 'user') {
                          NavigationServiceGo.navigateTo(context , '/estudiante');
                        } else if (auhtService.role == 'division') {
                          NavigationServiceGo.navigateTo(context , AppRouter.division);
                        } else if(auhtService.role == 'academico'){
                          NavigationServiceGo.navigateTo(context , AppRouter.academico);
                        }
                       }
                      }
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    overlayColor: Colors.white,
                    backgroundColor: const Color.fromARGB(255, 15, 66, 149),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(2.0),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        "Iniciar Sesion",
                        style: GoogleFonts.poppins(color: Colors.white),
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
