import 'package:titulacion_app/helpers/generatedPdfs/interfaces/datos_solicitud.dart';

class SolicitudOpcionV1993 extends DatosSolicitud{

    final Map<String , dynamic> user;
    final Map<String , dynamic> carrera;
    final String nombreCurso;
    final String docente;
    final String diaInicio;
    final String mesInicio;
    final String yearInicio;
    final String diaCierre ;
    final String mesCierre;
    final String yearCierre;
    final String monografia;
    final String direccion;
    final String telefono;
    final String opcion;
    final String metodoTitulacion;

    SolicitudOpcionV1993({
      required this.user , 
      required this.carrera , 
      required this.nombreCurso , 
      required this.docente , 
      required this.diaInicio , 
      required this.mesInicio , 
      required this.yearInicio , 
      required this.diaCierre , 
      required this.mesCierre , 
      required this.yearCierre , 
      required this.monografia , 
      required this.direccion , 
      required this.telefono , 
      required this.opcion , 
      required this.metodoTitulacion
    });
}