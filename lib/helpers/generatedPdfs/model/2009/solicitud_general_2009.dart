import 'package:titulacion_app/helpers/generatedPdfs/interfaces/datos_solicitud.dart';

class SolicitudGeneral2009 extends DatosSolicitud{

  final Map<String , dynamic> user;
  final Map<String , dynamic> carrera;
  final String telefono; 
  final String direccion; 
  final String proyecto; 
  final String metodoTitulacion; 
  final String correo;

  SolicitudGeneral2009({
      required this.user ,
      required this.carrera ,
      required this.telefono , 
      required this.direccion , 
      required this.proyecto , 
      required this.metodoTitulacion ,
      required this.correo
  });
}
