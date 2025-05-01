import 'package:flutter/material.dart';
import 'package:titulacion_app/helpers/generatedPdfs/pdf_generator_factory.dart';

class SolicitudProvider extends ChangeNotifier{

   GlobalKey<FormState> formKey = GlobalKey<FormState>();

   String? passedValid() => formKey.currentState!.validate() ? null : '';

    Future<void> generarSolicitud(String periodo , String formaTitulacion , Map<String , dynamic> data) async {
    final generatorPdf = PdfGeneratorFactory.getGenerator(periodo, formaTitulacion);
    final dataSolicitud = PdfGeneratorFactory.getDatosSolicitud(periodo : periodo, formaTitulacion: formaTitulacion, data: data);
 
    if(generatorPdf != null && dataSolicitud != null){
      await generatorPdf.generatorPdf(dataSolicitud);
      notifyListeners();
    }
    
  }

}