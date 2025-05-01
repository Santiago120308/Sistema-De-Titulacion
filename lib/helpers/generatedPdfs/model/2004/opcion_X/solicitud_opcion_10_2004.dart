import 'package:titulacion_app/helpers/generatedPdfs/interfaces/datos_solicitud.dart';

class SolicitudOpcionX2004 extends DatosSolicitud {
  final Map<String, dynamic> user;
  final Map<String, dynamic> carrera;
  final String direccion;
  final String telefono;
  final String opcion;
  final String metodoTitulacion;
  final String promedio;
  final String tema;

  SolicitudOpcionX2004(
      {required this.user,
      required this.carrera,
      required this.direccion,
      required this.telefono,
      required this.opcion,
      required this.metodoTitulacion,
      required this.promedio,
      required this.tema});
}
