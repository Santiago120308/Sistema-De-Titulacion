import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:titulacion_app/presentation/shared/gradients.dart';
import 'package:titulacion_app/presentation/shared/textFieldForm.dart';
import 'package:titulacion_app/providers/auth/auth_provider.dart';
import 'package:titulacion_app/providers/carreras_provider.dart';
import 'package:titulacion_app/providers/register_provider.dart';
import 'package:titulacion_app/services/navigation_service_go.dart';


class RegisterScreen extends StatelessWidget {
  final VoidCallback onToggle;

  const RegisterScreen({super.key, required this.onToggle});
  @override
  Widget build(BuildContext context) {

    return LayoutBuilder(builder: (context, constraints) {

      double containerHeight =
          constraints.maxWidth < 600 ? constraints.maxHeight : 450;

      return Container(
          height: containerHeight, 
          width:
              double.infinity, // Para asegurar que no se colapse el contenedor
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
          child: LayoutBuilder(builder: (context, constraints) {

            if (constraints.maxWidth < 600) {
              return SingleChildScrollView(
                child: Column(
                  mainAxisSize:
                      MainAxisSize.min, // Ajusta el tamaño según el contenido
                  children: [
                    Container(
                      width: double.infinity, // Ocupa todo el ancho disponible
                      height: 300, // Tamaño fijo para la parte superior
                      decoration: borderRadius(
                        gradientCircular(),
                        const Color.fromARGB(255, 15, 66, 149),
                        const Radius.circular(15),
                        const Radius.circular(0),
                        const Radius.circular(15),
                        const Radius.circular(0),
                      ),
                      child: sectionRigthMessage(),
                    ),
                    Container(
                      height: constraints.maxHeight * 0.60,
                      width: double.infinity, // Ocupa todo el ancho
                      padding: const EdgeInsets.all(16), // Espacio interno
                      decoration: borderRadius(
                        null,
                        const Color.fromARGB(255, 255, 255, 255),
                        const Radius.circular(0),
                        const Radius.circular(15),
                        const Radius.circular(0),
                        const Radius.circular(15),
                      ),
                      child: sectionLeftContent(context),
                    ),
                  ],
                ),
              );
            } else {
              return Row(
                children: [
                  Expanded(
                    child: Container(
                      decoration: borderRadius(
                        gradientCircular(),
                        const Color.fromARGB(255, 15, 66, 149),
                        const Radius.circular(15),
                        const Radius.circular(15),
                        const Radius.circular(0),
                        const Radius.circular(0),
                      ),
                      child: sectionRigthMessage(),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.all(16),
                      decoration: borderRadius(
                        null,
                        const Color.fromARGB(255, 255, 255, 255),
                        const Radius.circular(0),
                        const Radius.circular(0),
                        const Radius.circular(15),
                        const Radius.circular(15),
                      ),
                      child: sectionLeftContent(context),
                    ),
                  ),
                ],
              );
            }
          }));
    });
  }

  // Seccion derecha de Inicio de sesion
  Widget sectionRigthMessage() {

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Mensaje de registro
          labelField("Registrate", 35, FontWeight.bold, Colors.white, 20, 10),

          // Mensaje pregunta
          labelField("¿Ya tienes una cuenta?", 12, FontWeight.normal,
              Colors.white, 10, 50),

          // Boton de Registro
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
                  "Inicia Sesion",
                  style: GoogleFonts.poppins(color: Colors.white),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget sectionLeftContent(
    BuildContext context

    ) {
      final authService = Provider.of<AuthService>(context);
      final registerProvider = Provider.of<RegisterProvider>(context);

    return SizedBox(
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.all(40.0),
        child: Column(
          children: [
            // Title
            labelField("Completa el Registro", 20, FontWeight.normal,
                Colors.black, 10, 40),

            Expanded(
              child: SingleChildScrollView(
                // Scroll para los elementos visibles si se necesita
                child: Form(
                  key: registerProvider.formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment
                        .start, // Cambiado a start para alineación
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Campo Nombre
                      labelField(
                          "NOMBRE", 14, FontWeight.bold, Colors.black, 0, 20),

                      SizedBox(
                        height: 65,
                        child: TextFormField(
                          onChanged: (value) => (registerProvider.nombre = value) ,
                           validator: (value)  => ((value == null || value.isEmpty) ? "El nombre es obligatorio" : null),
                          decoration: builderInputDecoration("Nombre"),
                          style: const TextStyle(
                            fontSize: 14,
                          ),
                        ) ,
                      ) ,
                  
                      // Campo Apellidos
                      labelField(
                          "APELLIDOS", 14, FontWeight.bold, Colors.black, 20, 20),
                      SizedBox(
                        height: 65,
                        child: TextFormField(
                          onChanged: (value) => (registerProvider.apellidos = value) ,
                          validator: (value)  => ((value == null || value.isEmpty) ? "Los apellidos son obligatorios" : null),
                          decoration: builderInputDecoration("Apellidos"),
                          style: const TextStyle(
                            fontSize: 14,
                          ),
                        ) ,
                      ) ,
                  
                      // Campo NumeroControl
                      labelField("NUMERO DE CONTROL", 14, FontWeight.bold,
                          Colors.black, 20, 25),
                      SizedBox(
                        height: 65,
                        child: TextFormField(
                          onChanged: (value) => (registerProvider.numeroControl = value) ,
                          validator: (value){

                            if (value == null || value.isEmpty) {
                              return "El numero de control es obligatorio";
                            }

                            if(num.tryParse(value) == null){
                              return 'El numero de control debe de ser un numero valido';
                            }

                            return null;
                          },
                          decoration: builderInputDecoration("Numero de control"),
                          style: const TextStyle(
                            fontSize: 14,
                          ),
                        ) ,
                      ) ,
                  
                      // Campo Carrera
                      labelField(
                          "CARRERA", 14, FontWeight.bold, Colors.black, 20, 20),

                      // Dropdown para seleccionar carrera
                      SizedBox(
                        width: double.infinity,
                        child: selectCareer(context) ,
                      ) ,
                  
                      // Campo Email
                      labelField(
                          "EMAIL", 14, FontWeight.bold, Colors.black, 20, 20),
                      SizedBox(
                        height: 65,
                        child: TextFormField(
                          onChanged: (value) => (registerProvider.correo = value) ,
                          validator: (value)  {

                            if(value == null || value.isEmpty) {
                              return "El correo es obligatorio";
                            }

                            if(!EmailValidator.validate(value)){
                              return 'Introduce un correo valido';
                            }

                            return null;

                          },
                          decoration: builderInputDecoration("Email"),
                          style: const TextStyle(
                            fontSize: 14,
                          ),
                        ) ,
                      ) ,
                  
                      // Campo Password
                      labelField(
                          "PASSWORD", 14, FontWeight.bold, Colors.black, 20, 20),
                      SizedBox(
                        height: 65,
                        child: TextFormField(
                          obscureText: true,
                          onChanged: (value) => (registerProvider.password = value) ,
                          validator: (value)  => ((value == null || value.isEmpty) ? "El password es obligatorio" : null),
                          decoration: builderInputDecoration("Password"),
                          style: const TextStyle(
                            fontSize: 14,
                          ),
                        ) ,
                      ) ,
                  
                      // Campo Password Confirm
                      labelField("CONFIRMAR PASSWORD", 14, FontWeight.bold,
                          Colors.black, 20, 20),
                      SizedBox(
                        height: 65,
                        child: TextFormField(
                          obscureText: true,
                          onChanged: (value) => (registerProvider.passwordConfirm = value) ,
                          validator: (value)  {
                            if(value == null || value.isEmpty){
                              return 'El password es obligatorio';
                            }
                            if(registerProvider.password != registerProvider.passwordConfirm){
                              return 'Los password no coinciden';
                            }
                            return null;
                          },
                          decoration: builderInputDecoration("Confirmar password"),
                          style: const TextStyle(
                            fontSize: 14,
                          ),
                        ) ,
                      ) ,
                  
                      // Botón de Registro
                      const SizedBox(height: 35),
                      SizedBox(
                        width: double.infinity,
                        height: 45,
                        child: ElevatedButton(
                          onPressed: ()  async {
                            String? response = '';
                            // TODO: ACCION DE REGISTRARSE
                            String? register = registerProvider.passedValid();
                            if(register == null){

                            response =  await authService.register(
                                  context ,
                                  registerProvider.correo, 
                                  registerProvider.password, 
                                  registerProvider.nombre , 
                                  registerProvider.carreraId , 
                                  registerProvider.apellidos , 
                                  registerProvider.numeroControl);
                            }

                            if(response == null){
                              if(context.mounted){
                                NavigationServiceGo.popAndPushTo(context,'/');
                              }
                            }
                            
                          },
                          style: ElevatedButton.styleFrom(
                            overlayColor: Colors.white,
                            backgroundColor:
                                const Color.fromARGB(255, 15, 66, 149),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(2.0),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                "Registrarse",
                                style: GoogleFonts.poppins(color: Colors.white),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  DropdownButtonFormField<String> selectCareer(BuildContext context) {

    final registerProvider = Provider.of<RegisterProvider>(context);
    final carrerasProvider = Provider.of<CarrerasProvider>(context);

    return DropdownButtonFormField<String>(
      validator: (value) => (value == null) ? "Selecciona una carrera" : null ,
      isExpanded: true,
      decoration: const InputDecoration(
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.transparent),                                                                                                        
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.transparent),
        ),
      ),
      value: carrerasProvider.carreraSeleccionada,// Valor predeterminado
      items: carrerasProvider.carreras.map((carrera){
        return DropdownMenuItem<String>(
                    value: carrera['id'],
                    child: Text(carrera['nombre']!),
                  );
      }).toList() ,
      onChanged: (carreraId) {
        registerProvider.carreraId = carreraId!;
        carrerasProvider.seleccionarCarrera(carreraId);
      },
    );
  }
}
