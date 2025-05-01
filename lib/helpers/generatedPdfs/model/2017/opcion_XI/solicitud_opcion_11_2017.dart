import 'package:titulacion_app/helpers/generatedPdfs/interfaces/datos_solicitud.dart';

class SolicitudOpcionXI2017 extends DatosSolicitud {
  final Map<String, dynamic> user;
  final Map<String, dynamic> carrera;
  final String telefono;
  final String direccion;
  final String areasExamen;
  final String metodoTitulacion;
  final String correo;

  SolicitudOpcionXI2017(
      {required this.user,
      required this.carrera,
      required this.telefono,
      required this.direccion,
      required this.areasExamen,
      required this.metodoTitulacion,
      required this.correo});
}
