import 'package:titulacion_app/helpers/generatedPdfs/interfaces/datos_solicitud.dart';

class SolicitudGeneral2004 extends DatosSolicitud {
  final Map<String, dynamic> user;
  final Map<String, dynamic> carrera;

  final String telefono;
  final String direccion;
  final String nombreTema;
  final String producto;
  final String opcion;

  SolicitudGeneral2004(
      {required this.user,
      required this.carrera,
      required this.telefono,
      required this.direccion,
      required this.nombreTema,
      required this.producto,
      required this.opcion});
}
