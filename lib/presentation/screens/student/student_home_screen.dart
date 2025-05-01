import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:titulacion_app/helpers/generatedPdfs/provider/datos_pdf_provider.dart';
import 'package:titulacion_app/helpers/generatedPdfs/provider/solicitud_provider.dart';
import 'package:titulacion_app/presentation/screens/division/widgets/mensajes.dart';
import 'package:titulacion_app/presentation/screens/student/student_file_uploader.dart';
import 'package:titulacion_app/presentation/shared/textFieldForm.dart';
import 'package:titulacion_app/providers/auth/auth_provider.dart';
import 'package:titulacion_app/providers/carreras_provider.dart';
import 'package:titulacion_app/providers/pdf_provider.dart';
import 'package:titulacion_app/providers/periodos_providers.dart';
import 'package:titulacion_app/services/navigation_service_go.dart';

class StudentHomeScreen extends StatefulWidget {
  const StudentHomeScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _StudentHomeScreenState createState() => _StudentHomeScreenState();
}

class _StudentHomeScreenState extends State<StudentHomeScreen> {
  final ScrollController _scrollController = ScrollController();
  //final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  // Nueva clave para el formulario
  final GlobalKey _formSectionKey = GlobalKey();

  // Clave para guiar a vinculacion
  final GlobalKey _uploadSectionKey = GlobalKey();

  void _scrollToSection(GlobalKey sectionKey) {
    if (sectionKey.currentContext != null) {
      Future.delayed(const Duration(milliseconds: 300), () {
        Scrollable.ensureVisible(
          sectionKey.currentContext!,
          duration: const Duration(milliseconds: 700),
          curve: Curves.easeInOut,
        );
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final authService = Provider.of<AuthService>(context);

    // Obtener el ancho de la pantalla
    double screenWidth = MediaQuery.of(context).size.width;

    // Establecer el tamaño de la fuente basado en el ancho de la pantalla
    double fontSize = screenWidth > 600 ? 70 : 40;

    return Scaffold(
      floatingActionButton:  FloatingActionButton(
            onPressed: () {

              //Todo : Mostrar los mensajes aqui 
              // Acción del botón
              mostrarDialogoDeMensajes(context);
            },
            child: Icon(Icons.message),
          ),
      body: SingleChildScrollView(
        controller: _scrollController,
        child: Padding(
          padding: const EdgeInsets.all(50.0),
          child: SizedBox(
            width: double.infinity,
            child: Column(
              children: [
                // Boton de cerrar sesion
                Align(
                  alignment: Alignment.topRight,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromARGB(255, 162, 162, 162),
                      foregroundColor: Colors.white,
                    ),
                    onPressed: () async {
                      // TODO: CERRAR SESION
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

                // Bienvenida
                Text(
                  "Bienvenid@ ${authService.nombre}",
                  style: GoogleFonts.poppins(
                    fontSize: fontSize,
                    color: const Color.fromARGB(255, 15, 66, 149),
                    fontWeight: FontWeight.bold,
                    decoration: TextDecoration.none,
                  ),
                ),

                // Leyenda
                const SizedBox(height: 20),
                Text(
                  "El primer paso hacia tu meta profesional empieza aquí. ¡Titúlate!",
                  style: GoogleFonts.poppins(
                      fontSize: 17,
                      color: Colors.black,
                      decoration: TextDecoration.none,
                      fontWeight: FontWeight.w600),
                ),

                const SizedBox(height: 55),

                SvgPicture.asset(
                  'assets/vectors/vector-buhos.svg',
                  width: 250,
                  height: 250,
                  fit: BoxFit.contain,
                ),

                const SizedBox(height: 100),

                // Botón para ir al formulario
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF0F4295),
                    foregroundColor: Colors.white,
                  ),
                  onPressed: () => _scrollToSection(_formSectionKey),
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Text(
                      "Iniciar Registro",
                      style: GoogleFonts.poppins(
                        fontSize: 20,
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 200),

                // Sección del formulario
                _formSection(context),
                const SizedBox(height: 300),

                _uploadSection(context),
                const SizedBox(height: 300),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _formSection(BuildContext context) {
    final periodosProvider = Provider.of<PeriodosProvider>(context);
    //final solicitudProvider = Provider.of<SolicitudTitulacionProvider>(context);
    final authService = Provider.of<AuthService>(context);
    final carrerasProvider = Provider.of<CarrerasProvider>(context);
    final camposProvider = Provider.of<DatosPdfProvider>(context);
    final solicitud = Provider.of<SolicitudProvider>(context);
    final width = MediaQuery.of(context).size.width;

    return Form(
      // TODO: LLAVE DEL FORMULARIO
      key: solicitud.formKey,
      child: Container(
        key: _formSectionKey,
        child: SizedBox(
          width: 700,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            key:
                _formSectionKey, // Asegúrate de usar el GlobalKey en el formulario
            children: [
              const SizedBox(height: 5),

              // Title
              labelField("Completa el Registro", 20, FontWeight.normal,
                  Colors.black, 10, 20),

              // Select Periodo
              Padding(
                padding: const EdgeInsets.only(top: 5),
                child: labelField(
                    "PERIODO", 14, FontWeight.bold, Colors.black, 0, 10),
              ),
              selectPeriodo(context),

              if (periodosProvider.titulaciones.isNotEmpty)
                Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      labelField(
                          "Opciones de titulacion para el periodo seleccionado",
                          14,
                          FontWeight.bold,
                          Colors.black,
                          0,
                          10),
                      selectTitulacion(context)
                    ],
                  ),
                ),

              const SizedBox(height: 30),

              GridView.count(
                shrinkWrap: true, // Para que se ajuste al contenido
                physics:
                    const NeverScrollableScrollPhysics(), // Para que no tenga scroll dentro de un `Column`
                crossAxisCount: width > 700 ? 2 : 1, // Número de columnas
                childAspectRatio: 3, // Ajusta la proporción de los elementos
                mainAxisSpacing: width > 700
                    ? 10
                    : width > 400
                        ? 5
                        : 0, // Espacio vertical entre elementos
                crossAxisSpacing: 15, // Espacio horizontal entre elementos
                children: camposProvider.datosFormulario!.keys.map((campo) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      labelField(campo.toUpperCase(), 14, FontWeight.bold,
                          Colors.black, 0, 10),
                      SizedBox(
                        height: width > 400 ? 65 : 60,
                        child: TextFormField(
                          validator: (value) => (value == null || value.isEmpty)
                              ? 'Campo Obligatorio'
                              : null,
                          onChanged: (value) =>
                              camposProvider.actualizarValor(campo, value),
                          decoration:
                              builderInputDecoration(campo.toUpperCase()),
                          style: const TextStyle(
                            fontSize: 14,
                          ),
                        ),
                      ),
                    ],
                  );
                }).toList(),
              ),

              //         ...camposProvider.datosFormulario!.keys.map((campo){
              //           return  Column(
              //             crossAxisAlignment: CrossAxisAlignment.start,
              //             children: [
              //               labelField(campo.toUpperCase(), 14, FontWeight.bold, Colors.black, 0, 10) ,
              //                    SizedBox(
              //                      height: 65,
              //                      child: TextFormField(
              //                        validator: (value) => (value == null || value.isEmpty) ? 'Campo Obligatorio' : null,
              //                        onChanged: (value) => camposProvider.actualizarValor(campo , value),
              //                        decoration: builderInputDecoration(campo.toUpperCase()),
              //                        style: const TextStyle(
              //                          fontSize: 14,
              //                        ),
              //                      ),
              //                    ),
              //             ],
              //           );
              //         } ) ,

              // boton para descargar la solicitud de titulacion
              const SizedBox(height: 10),

              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 15, 66, 149),
                    foregroundColor: Colors.white,
                  ),
                  onPressed: () async {
                    String? passed = solicitud.passedValid();

                    if (passed == null) {
                      Map<String, dynamic> user = await authService
                              .getUserInfoById(authService.user!.uid)
                          as Map<String, dynamic>;
                      Map<String, dynamic> carrera = await carrerasProvider
                              .obtenerCarreraPorId(user['carreraId'])
                          as Map<String, dynamic>;
                      String? opcion =
                          await periodosProvider.obtenerNumeroDeOpcion();
                      Map<String, dynamic> data =
                          camposProvider.datosFormulario!;
                      data['user'] = user;
                      data['carrera'] = carrera;
                      data['metodoTitulacion'] = camposProvider.formaTitulacion;
                      if (opcion != null) {
                        data['opcion'] = opcion;
                      }

                      solicitud.generarSolicitud(camposProvider.periodo!,
                          camposProvider.formaTitulacion!, data);
                      camposProvider.limpiarDatos();
                      periodosProvider.limpiarTitulaciones();

                      _scrollToSection(_uploadSectionKey);
                    }
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "Descargar Solicitud",
                      style: GoogleFonts.poppins(
                        fontSize: 18,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _uploadSection(BuildContext context) {
    final authService = Provider.of<AuthService>(context);
    final pdfProvider = Provider.of<PdfProvider>(context);
    final carrerasProvider = Provider.of<CarrerasProvider>(context);

    return SizedBox(
      width: 600,
      child: Column(
        key: _uploadSectionKey, // Asociamos la clave al Widget de carga de PDF
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Title cargar documento
          labelField("Cargar PDF a Vinculación", 18, FontWeight.bold,
              Colors.black, 0, 20),

          const StudentFileUploader(),

          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromARGB(255, 15, 66, 149),
                foregroundColor: Colors.white,
              ),
              onPressed: () async {
                if (pdfProvider.pdfFile != null) {
                  Map<String, dynamic> user =
                      await authService.getUserInfoById(authService.user!.uid)
                          as Map<String, dynamic>;

                  String? pdfUrl =
                      await pdfProvider.subirSolicitud(user['num_control']);

                  if (pdfUrl != null) {
                    if (context.mounted) {
                      await carrerasProvider.cargarSolicitud(
                          user['carreraId'], user['uid'], pdfUrl, context);
                    }
                  }
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                        backgroundColor: Colors.red,
                        content: Text(
                          'Cargar la solicitud es obligatorio',
                          style: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.bold),
                        )),
                  );
                }
              },
              child: Padding(
                padding: const EdgeInsets.all(5.0),
                child: Text(
                  "Almacenar Solicitud",
                  style: GoogleFonts.poppins(
                    fontSize: 20,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

DropdownButtonFormField<String> selectPeriodo(BuildContext context) {
  final periodosProvider = Provider.of<PeriodosProvider>(context);
  final camposProvider = Provider.of<DatosPdfProvider>(context);

  return DropdownButtonFormField<String>(
    validator: (value) => (value == null) ? "Selecciona un periodo" : null,
    isExpanded: true,
    decoration: const InputDecoration(
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.transparent),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.transparent),
      ),
    ),
    value: camposProvider.periodo, // Valor predeterminado
    items: periodosProvider.periodos.map((periodo) {
      return DropdownMenuItem<String>(
        value: periodo['id'],
        child: Text(periodo['nombre']),
      );
    }).toList(),
    onChanged: (selectedPeriodo) {
      periodosProvider.seleccionarPeriodo(selectedPeriodo);
      periodosProvider.cargarMetodosTitulacion(selectedPeriodo!);
      camposProvider.actualizarPeriodo(selectedPeriodo);
    },
  );
}

DropdownButtonFormField<String> selectTitulacion(BuildContext context) {
  final periodosProvider = Provider.of<PeriodosProvider>(context);
  //final solicitudProvider = Provider.of<SolicitudTitulacionProvider>(context);
  final camposProvider = Provider.of<DatosPdfProvider>(context);

  return DropdownButtonFormField<String>(
    validator: (value) =>
        (value == null) ? "Selecciona tu forma de titulacion" : null,
    isExpanded: true,
    decoration: const InputDecoration(
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.transparent),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.transparent),
      ),
    ),
    value: camposProvider.formaTitulacion, // Valor predeterminado
    items: periodosProvider.titulaciones.map((titulacion) {
      return DropdownMenuItem<String>(
        value: titulacion['nombre'],
        child: Text(titulacion['nombre']),
      );
    }).toList(),
    onChanged: (selectedTitulacion) {
      periodosProvider.seleccionarTitulacion(selectedTitulacion);
      periodosProvider.seleccionarTitulacionId(selectedTitulacion);
      //solicitudProvider.metodoTitulacion = selectedTitulacion!;
      camposProvider.actualizarFormaTitulacion(selectedTitulacion!);
    },
  );
}
