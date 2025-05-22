import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:titulacion_app/providers/auth/auth_provider.dart';
import 'package:titulacion_app/providers/carreras_provider.dart';
import 'package:titulacion_app/providers/reporte_academico_provider.dart';
import 'package:titulacion_app/routes/app_router.dart';
import 'package:titulacion_app/services/navigation_service_go.dart';
//import 'package:url_launcher/url_launcher.dart';

class CarreraAcademicoScreen extends StatelessWidget {
  final String text;
  const CarreraAcademicoScreen({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    final carrerasProvider = Provider.of<CarrerasProvider>(context);
    final screenWidth = MediaQuery.of(context).size.width;

    return carrerasProvider.solicitudesAcademicas.isEmpty
        ? Center(
            child: Text('SIN SOLICITUDES PARA ESTA CARRERA',
                style: GoogleFonts.kanit(
                    fontSize: 18, fontWeight: FontWeight.w600)),
          )
        : ConstrainedBox(
            constraints:
                BoxConstraints(maxWidth: (screenWidth > 1500) ? 2500 : 1500),
            child: Container(
              color: Colors.grey[200],
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 20.0),
                    child: Text(
                      text,
                      textAlign: TextAlign.center,
                      style: GoogleFonts.kanit(
                          fontSize: 30, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Expanded(
                    child: ListView.builder(
                      itemCount: carrerasProvider.solicitudesFiltradasAcademicas.length,
                      itemBuilder: (context, index) {
                        final soli =
                            carrerasProvider.solicitudesFiltradasAcademicas[index];
                        return Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 10),
                          child: Card(
                              elevation: 2,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10)),
                              child: Padding(
                                padding: const EdgeInsets.all(20),
                                child: screenWidth > 820
                                    ? Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: dataUser(soli)),
                                          Row(
                                              children: buttons(context, soli,
                                                  btn1: 110))
                                        ],
                                      )
                                    : Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: dataUser(soli),
                                          ),
                                          const SizedBox(height: 20),
                                          if (screenWidth < 400)
                                            Column(
                                                children: buttons(
                                              context,
                                              soli,
                                              btn1: double.infinity,
                                              btn2: double.infinity,
                                            ))
                                          else
                                            Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.end,
                                                children: buttons(context, soli,
                                                    btn1: 110))
                                        ],
                                      ),
                              )),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          );
  }

  List<Widget> dataUser(Map<String, dynamic> soli) {
    return [
      // Nombre User
      Text(
        '${soli['usuario']['nombre']} ${soli['usuario']['apellidos']}',
        style: textStyleCard(17, FontWeight.w700),
      ),
      // Correo
      Text(
        'Correo: ${soli['usuario']['correo']}',
        style: textStyleCard(14, FontWeight.w500, color: Colors.grey),
      ),

      // Numero de control
      Text(
        'NC: ${soli['usuario']['num_control']}',
        style: textStyleCard(14, FontWeight.w500, color: Colors.grey),
      )
    ];
  }

  List<Widget> buttons(BuildContext context, Map<String, dynamic> soli,
      {double btn1 = 60, double btn2 = 110}) {
    final carrerasProvider = Provider.of<CarrerasProvider>(context);
    final datosReporteAcademicoProvider = Provider.of<ReporteAcademicoProvider>(context);

    return [
      SizedBox(
        width: btn1,
        height: 35,
        child: TextButton(
            onPressed: () {
              NavigationServiceGo.navigatePush(
                  context, '/pdf/${soli['usuario']['num_control']}');
            },
            style: OutlinedButton.styleFrom(
                shape: RoundedRectangleBorder(
                    side: BorderSide.none,
                    borderRadius: BorderRadius.circular(5)),
                backgroundColor: const Color(0xFF0F4295)),
            child: const Text(
              "Ver",
              style: TextStyle(color: Colors.white),
            )),
      ),
      SizedBox(
        width: 10,
        height: (btn1 != 60) ? 5 : 0,
      ),
      SizedBox(
        width: btn2,
        height: 35,
        child: TextButton(
            onPressed: () {
              carrerasProvider.modificarStatusDeSolicitudAcademica(
                  carreraId: soli['usuario']['carreraId'],
                  solicitudId: soli['id'],
                  valor: !soli['revisionAcademica']);
            },
            style: OutlinedButton.styleFrom(
                shape: RoundedRectangleBorder(
                    side: BorderSide.none,
                    borderRadius: BorderRadius.circular(5)),
                backgroundColor: soli['revisionAcademica']
                    ? const Color(0xFF696773)
                    : const Color.fromARGB(255, 149, 26, 15)),
            child: Text(
              soli['revisionAcademica'] ? "Revisada" : "No Revisada",
              style: const TextStyle(color: Colors.white),
            )),
      ),

      //TODO : HACER RESPONSIVO EL NUEVO BOTON Y AGREGARLE ESTILOS
      SizedBox(
        width: 10,
        height: (btn1 != 60) ? 5 : 0,
      ),

      SizedBox(
        width: 140,
        height: 35,
        child: TextButton(
            onPressed: () async {
              //TODO : MOSTRAR EL MODAL PARA ENVIAR MENSAJE

              await mostrarDialogo(context, soli);
            },
            style: OutlinedButton.styleFrom(
                shape: RoundedRectangleBorder(
                    side: BorderSide.none,
                    borderRadius: BorderRadius.circular(5)),
                backgroundColor: const Color.fromARGB(255, 149, 26, 15)),
            child: const Text(
              "Enviar mensaje",
              style: TextStyle(color: Colors.white),
            )),
      ),


       SizedBox(
        width: 10,
        height: (btn1 != 60) ? 5 : 0,
      ),

            SizedBox(
        width: 140,
        height: 35,
        child: TextButton(
            onPressed: () async {
              //TODO : ENVIARLO A LA PAGINA PARA GENERAR EL REPORTE
              print(soli);

              Map<String, dynamic> carrera = await carrerasProvider
                              .obtenerCarreraPorId(soli['usuario']['carreraId'])
                          as Map<String, dynamic>;
                     
              datosReporteAcademicoProvider.carrera = carrera['nombre'];
              datosReporteAcademicoProvider.formaTitulacion = soli['usuario']['formaTitulacion'];
              datosReporteAcademicoProvider.nombre = '${soli['usuario']['nombre']} ${soli['usuario']['apellidos']}';
              datosReporteAcademicoProvider.numeroControl = soli['usuario']['num_control'];
              datosReporteAcademicoProvider.nombreProyecto = soli['usuario']['nombreProyecto'];

              if(context.mounted){
                NavigationServiceGo.navigatePush(context, AppRouter.academicoReporte);
              }
              
            },
            style: OutlinedButton.styleFrom(
                shape: RoundedRectangleBorder(
                    side: BorderSide.none,
                    borderRadius: BorderRadius.circular(5)),
                backgroundColor: const Color.fromARGB(255, 149, 26, 15)),
            child: const Text(
              "Generar Reporte",
              style: TextStyle(color: Colors.white),
            )),
      ),
      
    ];
  }

  Future<Object?> mostrarDialogo(
      BuildContext context, Map<String, dynamic> soli) async {
    return showGeneralDialog(
      context: context,
      barrierDismissible: true,
      barrierLabel: MaterialLocalizations.of(context).modalBarrierDismissLabel,
      barrierColor: Colors.black.withOpacity(0.5),
      transitionDuration: const Duration(milliseconds: 300),
      pageBuilder: (context, __, ___) {
        final authProvider = Provider.of<AuthService>(context);

        return Center(
          child: Material(
            type: MaterialType.transparency,
            child: AlertDialog(
              title: Text(
                'Enviar mensaje a ${soli['usuario']['nombre']} ${soli['usuario']['apellidos']}',
              ),
              content: SizedBox(
                width: MediaQuery.of(context).size.width * 0.4, // Más adaptable
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize
                        .min, // Importante para que no crezca infinito
                    children: [
                      TextFormField(
                        onChanged: (value) {
                          authProvider.mensaje = value;
                        },
                        
                        decoration: InputDecoration(
                          hintText: 'Escribe tu mensaje aquí...',
                          border: const OutlineInputBorder(),
                          suffixIcon: IconButton(
                            icon: const Icon(Icons.send),
                            onPressed: () async {
                              if (authProvider.mensaje.isNotEmpty) {
                                await authProvider.sendMessage(soli, context , 'mensajesAcademicos');
                                if(context.mounted){
                                  Navigator.of(context).pop();
                                }
                                authProvider.setearMensajeVacio(false);
                              } else {
                                authProvider.setearMensajeVacio(true);
                              }
                            },
                          ),
                        ),
                        minLines: 1,
                        maxLines: 5,
                      ),
                      const SizedBox(height: 10),
                      if (authProvider.mensajeVacio)
                        const Text(
                          "El mensaje es obligatorio",
                          style: TextStyle(color: Colors.red),
                        ),
                    ],
                  ),
                ),
              ),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                     authProvider.setearMensajeVacio(false);
                  },
                  child: const Text('Cerrar'),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  TextStyle textStyleCard(double fontSize, FontWeight fontWeight,
      {Color color = Colors.black}) {
    return TextStyle(
      fontSize: fontSize,
      fontWeight: fontWeight,
      color: color,
    );
  }
}
