import 'dart:typed_data';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';
import 'package:titulacion_app/helpers/generatedPdfs/interfaces/datos_solicitud.dart';
import 'package:titulacion_app/helpers/generatedPdfs/interfaces/pdf_generator.dart';
import 'package:titulacion_app/helpers/generatedPdfs/model/2009/solicitud_general_2009.dart';
import 'package:titulacion_app/helpers/nombre_mes.dart';

class GeneratedPdf2009 extends PdfGenerator {
  @override
  Future<void> generatorPdf(DatosSolicitud solicitud) async {
    if (solicitud is SolicitudGeneral2009) {
      final pdf = pw.Document();
      DateTime now = DateTime.now();
      String formattedDate =
          "${now.day} de ${NombreMes.mesEnTexto(now.month)} del ${now.year}";

      //String fecha =  obtenerFechaActual();

      pdf.addPage(
        pw.Page(
          build: (pw.Context context) => pw
              .Column(mainAxisAlignment: pw.MainAxisAlignment.start, children: [
            pw.Container(
              width: double.infinity,
              padding: const pw.EdgeInsets.only(left: 10),
              child: pw.Text("ASUNTO: SE SOLICITA AUTORIZACION PARA TITULACION",
                  // ignore: prefer_const_constructors
                  style: pw.TextStyle(
                      fontSize: 12, fontWeight: pw.FontWeight.bold),
                  textAlign: pw.TextAlign.start),
            ),
            pw.SizedBox(height: 20),
            pw.Container(
              width: double.infinity,
              //padding: const pw.EdgeInsets.only(left: 200),
              child: pw.Text(formattedDate,
                  style: pw.TextStyle(
                      fontSize: 12, fontWeight: pw.FontWeight.bold),
                  textAlign: pw.TextAlign.end),
            ),
            pw.SizedBox(height: 50),
            pw.Container(
              width: double.infinity,
              padding: const pw.EdgeInsets.only(left: 10),
              child: pw.Text("C. LAURA ELENA RUEDA MATA",
                  // ignore: prefer_const_constructors
                  style: pw.TextStyle(
                      fontSize: 12,
                      fontWeight: pw.FontWeight.bold,
                      decoration: pw.TextDecoration.underline),
                  textAlign: pw.TextAlign.start),
            ),
            pw.Container(
              width: double.infinity,
              padding: const pw.EdgeInsets.only(left: 10),
              child: pw.Text(
                  "JEFE (A) DE LA DIVISION DE ESTUDIOS PROFESIONALES",
                  // ignore: prefer_const_constructors
                  style: pw.TextStyle(
                      fontSize: 12, fontWeight: pw.FontWeight.bold),
                  textAlign: pw.TextAlign.start),
            ),
            pw.Container(
              width: double.infinity,
              padding: const pw.EdgeInsets.only(left: 10),
              child: pw.Text("P R E S E N T E",
                  // ignore: prefer_const_constructors
                  style: pw.TextStyle(
                      fontSize: 12, fontWeight: pw.FontWeight.bold),
                  textAlign: pw.TextAlign.start),
            ),
            pw.SizedBox(height: 30),
            pw.Container(
              width: double.infinity,
              child: pw.Text("AT'N. M.T.I MARIA ISABEL VASQUEZ OCAMPO",
                  // ignore: prefer_const_constructors
                  style: pw.TextStyle(
                      fontSize: 12,
                      fontWeight: pw.FontWeight.bold,
                      decoration: pw.TextDecoration.underline),
                  textAlign: pw.TextAlign.end),
            ),
            pw.Container(
              width: double.infinity,
              child: pw.Text("COORDINADOR (A) DE APOYO A TITULACION",
                  // ignore: prefer_const_constructors
                  style: pw.TextStyle(
                    fontSize: 12,
                    fontWeight: pw.FontWeight.bold,
                  ),
                  textAlign: pw.TextAlign.end),
            ),
            pw.SizedBox(height: 30),
            pw.Container(
              width: double.infinity,
              padding: const pw.EdgeInsets.only(left: 10),
              child: pw.Text(
                  "Por medio del presente solicito autorizacion para iniciar tramite de registro del proyecto de titulacion integral",
                  // ignore: prefer_const_constructors
                  style: pw.TextStyle(
                    fontSize: 11,
                    fontWeight: pw.FontWeight.normal,
                  ),
                  textAlign: pw.TextAlign.start),
            ),
            pw.SizedBox(height: 20),
            pw.Table(
                columnWidths: {
                  0: const pw.FixedColumnWidth(
                      200), // Ancho fijo para la primera columna
                  1: const pw.FixedColumnWidth(
                      350), // Ancho fijo para la primera columna
                },
                border: pw.TableBorder.all(),
                children: [
                  pw.TableRow(children: [
                    pw.Padding(
                        padding: const pw.EdgeInsets.symmetric(horizontal: 10),
                        child: pw.Text("a) Nombre:",
                            style:
                                pw.TextStyle(fontWeight: pw.FontWeight.bold))),
                    pw.Padding(
                        padding: const pw.EdgeInsets.symmetric(horizontal: 10),
                        child: pw.Text(
                            "${solicitud.user['nombre'].toUpperCase()} ${solicitud.user['apellidos'].toUpperCase()}",
                            textAlign: pw.TextAlign.center,
                            style:
                                pw.TextStyle(fontWeight: pw.FontWeight.bold))),
                  ]),
                  pw.TableRow(children: [
                    pw.Padding(
                        padding: const pw.EdgeInsets.symmetric(horizontal: 10),
                        child: pw.Text("b) Carrera:",
                            style:
                                pw.TextStyle(fontWeight: pw.FontWeight.bold))),
                    pw.Padding(
                        padding: const pw.EdgeInsets.symmetric(horizontal: 10),
                        child: pw.Text(
                            solicitud.carrera['nombre'].toUpperCase(),
                            textAlign: pw.TextAlign.center,
                            style:
                                pw.TextStyle(fontWeight: pw.FontWeight.bold))),
                  ]),
                  pw.TableRow(children: [
                    pw.Padding(
                        padding: const pw.EdgeInsets.symmetric(horizontal: 10),
                        child: pw.Text("c) No. de Control:",
                            style:
                                pw.TextStyle(fontWeight: pw.FontWeight.bold))),
                    pw.Padding(
                        padding: const pw.EdgeInsets.symmetric(horizontal: 10),
                        child: pw.Text(solicitud.user['num_control'],
                            textAlign: pw.TextAlign.center,
                            style:
                                pw.TextStyle(fontWeight: pw.FontWeight.bold))),
                  ]),
                  pw.TableRow(children: [
                    pw.Padding(
                        padding: const pw.EdgeInsets.symmetric(horizontal: 10),
                        child: pw.Text("d) Nombre del proyecto: ",
                            style:
                                pw.TextStyle(fontWeight: pw.FontWeight.bold))),
                    pw.Padding(
                        padding: const pw.EdgeInsets.symmetric(horizontal: 10),
                        child: pw.Text(solicitud.proyecto.toUpperCase(),
                            textAlign: pw.TextAlign.center,
                            style:
                                pw.TextStyle(fontWeight: pw.FontWeight.bold))),
                  ]),
                  pw.TableRow(children: [
                    pw.Padding(
                        padding: const pw.EdgeInsets.symmetric(horizontal: 10),
                        child: pw.Text("e) Producto: ",
                            style:
                                pw.TextStyle(fontWeight: pw.FontWeight.bold))),
                    pw.Padding(
                        padding: const pw.EdgeInsets.symmetric(horizontal: 10),
                        child: pw.Text(solicitud.metodoTitulacion.toUpperCase(),
                            textAlign: pw.TextAlign.center,
                            style:
                                pw.TextStyle(fontWeight: pw.FontWeight.bold))),
                  ]),
                ]),
            pw.Container(
              width: double.infinity,
              padding: const pw.EdgeInsets.only(left: 10),
              child: pw.Text(
                  "En espera de la aceptacion de esta solicitud , quedo a sus ordenes.",
                  // ignore: prefer_const_constructors
                  style: pw.TextStyle(
                    fontSize: 11,
                    fontWeight: pw.FontWeight.bold,
                  ),
                  textAlign: pw.TextAlign.start),
            ),
            pw.SizedBox(height: 20),
            pw.Center(
              //padding: const pw.EdgeInsets.only(right: 115),
              child: pw.Text(
                "ATENTAMENTE: ",
                // ignore: prefer_const_constructors
                style: pw.TextStyle(
                  fontSize: 11,
                  fontWeight: pw.FontWeight.bold,
                ),
              ),
            ),
            pw.SizedBox(height: 60),
            pw.Center(
              //padding: const pw.EdgeInsets.only(right: 115),
              child: pw.Text(
                "${solicitud.user['nombre'].toUpperCase()} ${solicitud.user['apellidos'].toUpperCase()} ",
                // ignore: prefer_const_constructors
                style: pw.TextStyle(
                  fontSize: 11,
                  fontWeight: pw.FontWeight.bold,
                ),
              ),
            ),
            pw.Center(
              //padding: const pw.EdgeInsets.only(right: 115),
              child: pw.Text(
                "Nombre y Firma del Solicitante",
                // ignore: prefer_const_constructors
                style: pw.TextStyle(
                  fontSize: 11,
                  fontWeight: pw.FontWeight.bold,
                ),
              ),
            ),
            pw.SizedBox(height: 5),
            pw.Table(
                columnWidths: {
                  0: const pw.FixedColumnWidth(
                      200), // Ancho fijo para la primera columna
                  1: const pw.FixedColumnWidth(350),
                },
                border: pw.TableBorder.all(),
                children: [
                  pw.TableRow(children: [
                    pw.Padding(
                        padding: const pw.EdgeInsets.symmetric(horizontal: 10),
                        child: pw.Text("Direccion:",
                            style:
                                pw.TextStyle(fontWeight: pw.FontWeight.bold))),
                    pw.Padding(
                        padding: const pw.EdgeInsets.symmetric(horizontal: 10),
                        child: pw.Text(solicitud.direccion.toUpperCase(),
                            textAlign: pw.TextAlign.center,
                            style:
                                pw.TextStyle(fontWeight: pw.FontWeight.bold))),
                  ]),
                  pw.TableRow(children: [
                    pw.Padding(
                        padding: const pw.EdgeInsets.symmetric(horizontal: 10),
                        child: pw.Text("Teléfono Particular o de contacto: ",
                            style:
                                pw.TextStyle(fontWeight: pw.FontWeight.bold))),
                    pw.Padding(
                        padding: const pw.EdgeInsets.symmetric(horizontal: 10),
                        child: pw.Text(solicitud.telefono,
                            textAlign: pw.TextAlign.center,
                            style:
                                pw.TextStyle(fontWeight: pw.FontWeight.bold))),
                  ]),
                  pw.TableRow(children: [
                    pw.Padding(
                        padding: const pw.EdgeInsets.symmetric(horizontal: 10),
                        child: pw.Text("Correo Electronico del Estudiante",
                            style:
                                pw.TextStyle(fontWeight: pw.FontWeight.bold))),
                    pw.Padding(
                        padding: const pw.EdgeInsets.symmetric(horizontal: 10),
                        child: pw.Text(solicitud.correo,
                            textAlign: pw.TextAlign.center,
                            style:
                                pw.TextStyle(fontWeight: pw.FontWeight.bold))),
                  ]),
                ]),
            pw.SizedBox(height: 20),
            pw.Container(
              width: double.infinity,
              padding: const pw.EdgeInsets.only(left: 10),
              child: pw.Text("ANEXO",
                  // ignore: prefer_const_constructors
                  style: pw.TextStyle(
                    fontSize: 11,
                    fontWeight: pw.FontWeight.bold,
                  ),
                  textAlign: pw.TextAlign.start),
            ),
            pw.Container(
              width: double.infinity,
              padding: const pw.EdgeInsets.only(left: 10),
              child: pw.Text("Objetivo, Indice y Bibliografia",
                  // ignore: prefer_const_constructors
                  style: pw.TextStyle(
                    fontSize: 11,
                    fontWeight: pw.FontWeight.normal,
                  ),
                  textAlign: pw.TextAlign.start),
            ),
            pw.SizedBox(height: 20),
            pw.Container(
              width: double.infinity,
              padding: const pw.EdgeInsets.only(left: 10),
              child: pw.Text("c.c.p. Academia",
                  // ignore: prefer_const_constructors
                  style: pw.TextStyle(
                    fontSize: 11,
                    fontWeight: pw.FontWeight.normal,
                  ),
                  textAlign: pw.TextAlign.start),
            ),
            pw.Container(
              width: double.infinity,
              padding: const pw.EdgeInsets.only(left: 10),
              child: pw.Text("c.c.p. Interesado",
                  // ignore: prefer_const_constructors
                  style: pw.TextStyle(
                    fontSize: 11,
                    fontWeight: pw.FontWeight.normal,
                  ),
                  textAlign: pw.TextAlign.start),
            ),
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
