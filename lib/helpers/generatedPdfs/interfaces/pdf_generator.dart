import 'package:titulacion_app/helpers/generatedPdfs/interfaces/datos_solicitud.dart';

abstract class PdfGenerator {
  Future<void> generatorPdf(DatosSolicitud solicitud);
}