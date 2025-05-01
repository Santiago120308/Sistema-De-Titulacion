import 'dart:typed_data';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';
import 'package:titulacion_app/helpers/generatedPdfs/interfaces/datos_solicitud.dart';
import 'package:titulacion_app/helpers/generatedPdfs/interfaces/pdf_generator.dart';
import 'package:titulacion_app/helpers/generatedPdfs/model/2004/opcion_VIII/solicitud_opcion_8_2004.dart';
import 'package:titulacion_app/helpers/nombre_mes.dart';

class GeneratedPdfOpcionVIII2004 extends PdfGenerator{
  @override
  Future<void> generatorPdf(DatosSolicitud solicitud) async {
   if(solicitud is SolicitudOpcionVIII2004){
    final pdf = pw.Document();
      DateTime now = DateTime.now();
      String formattedDate =
          "${now.day} de ${NombreMes.mesEnTexto(now.month)} del ${now.year}";

      //String fecha =  obtenerFechaActual();

      pdf.addPage(
        pw.Page(
          build: (pw.Context context) => pw
              .Column(mainAxisAlignment: pw.MainAxisAlignment.start, children: [
            pw.SizedBox(height: 20),
            pw.Container(
              width: double.infinity,
              padding: const pw.EdgeInsets.only(left: 10),
              child: pw.Text("ASUNTO: SE SOLICITA AUTORIZACION PARA TITULACION",
                  // ignore: prefer_const_constructors
                  style: pw.TextStyle(fontSize: 11, font: pw.Font.times())),
            ),
            pw.SizedBox(height: 40),
            pw.Row(children: [
              pw.Container(
                  padding: const pw.EdgeInsets.only(left: 10),
                  child: pw.Text('FECHA: ',
                      style: pw.TextStyle(font: pw.Font.times(), fontSize: 11),
                      textAlign: pw.TextAlign.start)),
              pw.Container(
                  width: double.infinity,
                  child: pw.Text(formattedDate,
                      style: pw.TextStyle(
                          font: pw.Font.times(),
                          fontSize: 11,
                          decoration: pw.TextDecoration.underline),
                      textAlign: pw.TextAlign.start)),
            ]),
            pw.SizedBox(height: 40),
            pw.Container(
                width: double.infinity,
                padding: const pw.EdgeInsets.only(left: 10),
                child: pw.Text(
                  'C._ PORFIRIO ROBERTO NÁJERA MEDINA',
                  style: pw.TextStyle(
                      font: pw.Font.times(),
                      fontSize: 11,
                      decoration: pw.TextDecoration.underline),
                  textAlign: pw.TextAlign.start,
                )),
            pw.Container(
                width: double.infinity,
                padding: const pw.EdgeInsets.only(left: 10),
                child: pw.Text(
                  'DIRECTOR DEL INSTITUTO TECNOLÓGICO',
                  style: pw.TextStyle(font: pw.Font.times(), fontSize: 11),
                  textAlign: pw.TextAlign.start,
                )),
            pw.Container(
                width: double.infinity,
                padding: const pw.EdgeInsets.only(left: 10),
                child: pw.Text(
                  'DE ZACATEPEC, MOR,',
                  style: pw.TextStyle(font: pw.Font.times(), fontSize: 11),
                  textAlign: pw.TextAlign.start,
                )),
            pw.Container(
                width: double.infinity,
                padding: const pw.EdgeInsets.only(left: 10),
                child: pw.Text(
                  'P R E S E N T E',
                  style: pw.TextStyle(font: pw.Font.times(), fontSize: 11),
                  textAlign: pw.TextAlign.start,
                )),
            pw.SizedBox(height: 40),
            pw.Container(
              width: double.infinity,
              padding: const pw.EdgeInsets.only(left: 10),
              child: pw.RichText(
                  text: pw.TextSpan(
                      style: pw.TextStyle(font: pw.Font.times(), fontSize: 11),
                      text: 'El (La) que suscribe ',
                      children: [
                    pw.TextSpan(
                        text:
                            '${solicitud.user['nombre']} ${solicitud.user['apellidos']} ',
                        style: const pw.TextStyle(
                            decoration: pw.TextDecoration.underline)),
                    const pw.TextSpan(text: 'Egresado  (a) de la carrera de '),
                    pw.TextSpan(
                        text: '${solicitud.carrera['nombre']} ',
                        style: const pw.TextStyle(
                            decoration: pw.TextDecoration.underline)),
                    const pw.TextSpan(text: 'con número de control, '),
                    pw.TextSpan(
                      text: '${solicitud.user['num_control']} ',
                      style: pw.TextStyle(
                          decoration: pw.TextDecoration.underline,
                          fontWeight: pw.FontWeight.bold),
                    ),
                    const pw.TextSpan(
                        text: 'habiendo obtenido un promedio general de '),
                    pw.TextSpan(
                      text: '${solicitud.promedio} ',
                      style: pw.TextStyle(
                          decoration: pw.TextDecoration.underline,
                          fontWeight: pw.FontWeight.bold),
                    ),
                    const pw.TextSpan(
                        text:
                            'en toda la carrera, me dirijo a Usted, para solicitar mi Titulación por medio de la opción '),
                    pw.TextSpan(
                        text: '${solicitud.opcion} ',
                        style: pw.TextStyle(
                            decoration: pw.TextDecoration.underline,
                            fontWeight: pw.FontWeight.bold)),
                    pw.TextSpan(
                        text: '( ${solicitud.metodoTitulacion} ) ',
                        style: pw.TextStyle(
                            decoration: pw.TextDecoration.underline,
                            fontWeight: pw.FontWeight.bold)),
                    const pw.TextSpan(
                        text:
                            'del procedimiento académico para obtener el título de licenciatura en los institutos tecnológicos.'),
                  ])),
            ),
            pw.SizedBox(height: 20),
            pw.Container(
                width: double.infinity,
                padding: const pw.EdgeInsets.only(left: 10),
                child: pw.RichText(
                    text: pw.TextSpan(
                        style:
                            pw.TextStyle(font: pw.Font.times(), fontSize: 11),
                        text: 'Dirección: ',
                        children: [
                      pw.TextSpan(
                          text: '"${solicitud.direccion}"',
                          style: const pw.TextStyle(
                              decoration: pw.TextDecoration.underline)),
                    ]))),
            pw.Container(
                width: double.infinity,
                padding: const pw.EdgeInsets.only(left: 10),
                child: pw.RichText(
                    text: pw.TextSpan(
                        style:
                            pw.TextStyle(font: pw.Font.times(), fontSize: 11),
                        text: 'Teléfono: ',
                        children: [
                      pw.TextSpan(
                          text: '"${solicitud.telefono}"',
                          style: const pw.TextStyle(
                              decoration: pw.TextDecoration.underline)),
                    ]))),
            pw.SizedBox(height: 40),
            pw.Container(
                width: double.infinity,
                padding: const pw.EdgeInsets.only(left: 10),
                child: pw.Text(
                  'Esperando una respuesta positiva a mi solicitud, reciba un cordial saludo.',
                  style: pw.TextStyle(font: pw.Font.times(), fontSize: 11),
                  textAlign: pw.TextAlign.start,
                )),
            pw.SizedBox(height: 30),
            pw.Container(
                width: double.infinity,
                padding: const pw.EdgeInsets.only(left: 10),
                child: pw.Text('ATENTAMENTE',
                    style: pw.TextStyle(font: pw.Font.times(), fontSize: 11),
                    textAlign: pw.TextAlign.start)),
            pw.SizedBox(height: 40),
            pw.Container(
                width: double.infinity,
                padding: const pw.EdgeInsets.only(left: 10),
                child: pw.Text(
                    '${solicitud.user['nombre']} ${solicitud.user['apellidos']}',
                    style: pw.TextStyle(
                        font: pw.Font.times(),
                        fontSize: 11,
                        decoration: pw.TextDecoration.underline),
                    textAlign: pw.TextAlign.start)),
            pw.SizedBox(height: 40),
            pw.Container(
                width: double.infinity,
                padding: const pw.EdgeInsets.only(left: 10),
                child: pw.Text(
                    'ANEXO: Constancia de calificaciones por semestre con promedio general y Copia del certificado de estudios de nivel licenciatura.',
                    style: pw.TextStyle(font: pw.Font.times(), fontSize: 11),
                    textAlign: pw.TextAlign.start)),
            pw.SizedBox(height: 40),
            pw.Container(
                width: double.infinity,
                padding: const pw.EdgeInsets.only(left: 10),
                child: pw.Text('c.c.p. Academia',
                    style: pw.TextStyle(font: pw.Font.times(), fontSize: 11),
                    textAlign: pw.TextAlign.start)),
            pw.Container(
                width: double.infinity,
                padding: const pw.EdgeInsets.only(left: 10),
                child: pw.Text('c.c.p. Interesado',
                    style: pw.TextStyle(font: pw.Font.times(), fontSize: 11),
                    textAlign: pw.TextAlign.start)),
          ]),
        ),
      );

      // Convierte el PDF en bytes
      Uint8List pdfBytes = await pdf.save();

      // Descarga el PDF en Flutter Web
      await Printing.sharePdf(
          bytes: pdfBytes,
          filename:
              "${solicitud.user['nombre']} ${solicitud.user['apellidos']} solicitud.pdf");
   }
  }
}