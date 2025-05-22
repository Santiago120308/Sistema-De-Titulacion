import 'dart:typed_data';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:flutter/material.dart';
import 'package:printing/printing.dart';
import 'package:titulacion_app/helpers/nombre_mes.dart';
import 'package:flutter/services.dart' show rootBundle;

class ReporteAcademicoProvider extends ChangeNotifier {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  //Datos dinamicos
  String nombre = '';
  String numeroControl = '';
  String carrera = '';
  String formaTitulacion = '';
  String nombreProyecto = '';

  //Datos solicitados
  String precidente = '';
  String secretario = '';
  String vocal = '';
  String suplente = '';

  bool isValidForm() {
    return formKey.currentState?.validate() ?? false;
  }

  Future<void> generatorPdf() async {
    final pdf = pw.Document();
    DateTime now = DateTime.now();
    String formattedDate =
        "${now.day} de ${NombreMes.mesEnTexto(now.month)} del ${now.year}";

    //String fecha =  obtenerFechaActual();

    //TODO : PRIMERA PAGINA

    // Carga de la imagen
    final Uint8List imageBytes = await rootBundle
        .load('assets/educacion.png')
        .then((value) => value.buffer.asUint8List());
    final pw.MemoryImage image = pw.MemoryImage(imageBytes);

    final Uint8List imageBytes2 = await rootBundle
        .load('assets/mujer.png')
        .then((value) => value.buffer.asUint8List());
    final pw.MemoryImage imageMujer = pw.MemoryImage(imageBytes2);

    final Uint8List imageBytes3 = await rootBundle
        .load('assets/indigena.png')
        .then((value) => value.buffer.asUint8List());
    final pw.MemoryImage imagenIndigena = pw.MemoryImage(imageBytes3);

    final Uint8List imageBytes4 = await rootBundle
        .load('assets/laboral.png')
        .then((value) => value.buffer.asUint8List());
    final pw.MemoryImage imagenLaboral = pw.MemoryImage(imageBytes4);

    final Uint8List imageBytes5 = await rootBundle
        .load('assets/itz.png')
        .then((value) => value.buffer.asUint8List());
    final pw.MemoryImage imagenItz = pw.MemoryImage(imageBytes5);

    final Uint8List imageBytes6 = await rootBundle
        .load('assets/plastico.png')
        .then((value) => value.buffer.asUint8List());
    final pw.MemoryImage imagenPlastico = pw.MemoryImage(imageBytes6);

    final Uint8List imageBytes7 = await rootBundle
        .load('assets/ar.png')
        .then((value) => value.buffer.asUint8List());
    final pw.MemoryImage imagenAr = pw.MemoryImage(imageBytes7);

    final Uint8List imageBytes8 = await rootBundle
        .load('assets/ar14.png')
        .then((value) => value.buffer.asUint8List());
    final pw.MemoryImage imagenAr14 = pw.MemoryImage(imageBytes8);

    pdf.addPage(
      pw.Page(
        margin: const pw.EdgeInsets.all(25),
        build: (pw.Context context) =>
            pw.Column(mainAxisAlignment: pw.MainAxisAlignment.start, children: [
          pw.Row(children: [
            pw.Align(
              alignment: pw.Alignment.topLeft,
              child: pw.Image(
                image,
                width: 200,
                height: 200,
              ),
            ),
            pw.SizedBox(width: 60),
            pw.Align(
              alignment: pw.Alignment.centerRight,
              child: pw.Row(children: [
                pw.SizedBox(width: 210),
                pw.Image(
                  imageMujer,
                  width: 100,
                  height: 100,
                ),
              ]),
            ),
          ]),
          pw.SizedBox(height: 10),
          pw.Align(
            alignment: pw.Alignment.centerRight,
            child: pw.Container(
              child: pw.Text("Instituto Tecnologico de Zacatepec",
                  // ignore: prefer_const_constructors
                  style: pw.TextStyle(
                      fontSize: 10, fontWeight: pw.FontWeight.bold)),
            ),
          ),
          pw.Align(
            alignment: pw.Alignment.centerRight,
            child: pw.Container(
              child: pw.Text("Departamento de Sistemas y Computación ",
                  // ignore: prefer_const_constructors
                  style: pw.TextStyle(
                    fontSize: 8.5,
                  )),
            ),
          ),

          pw.SizedBox(height: 20),
          pw.Align(
            alignment: pw.Alignment.centerRight,
            child: pw.Container(
              child: pw.Text(
                  "Asunto: Registro de Proyecto para la titulacion integral",
                  // ignore: prefer_const_constructors
                  style: pw.TextStyle(fontSize: 11)),
            ),
          ),
          pw.SizedBox(height: 25),
          pw.Align(
            alignment: pw.Alignment.centerLeft,
            child: pw.Container(
              child: pw.Text("C. LAURA ELENA RUEDA MATA",
                  // ignore: prefer_const_constructors
                  style: pw.TextStyle(
                      fontSize: 11, fontWeight: pw.FontWeight.bold)),
            ),
          ),
          pw.Align(
            alignment: pw.Alignment.centerLeft,
            child: pw.Container(
              child: pw.Text("JEFA DE LA DIVISION DE ESTUDIOS PROFESIONALES",
                  // ignore: prefer_const_constructors
                  style: pw.TextStyle(
                      fontSize: 11, fontWeight: pw.FontWeight.bold)),
            ),
          ),
          pw.Align(
            alignment: pw.Alignment.centerLeft,
            child: pw.Container(
              child: pw.Text("PRESENTE",
                  // ignore: prefer_const_constructors
                  style: pw.TextStyle(
                      fontSize: 11, fontWeight: pw.FontWeight.bold)),
            ),
          ),
          pw.SizedBox(height: 25),
          pw.Align(
            alignment: pw.Alignment.centerLeft,
            child: pw.Container(
              child: pw.Text("Departamento de: Sistemas y Computación ",
                  // ignore: prefer_const_constructors
                  style: pw.TextStyle(fontSize: 11)),
            ),
          ),
          pw.Row(
              mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
              children: [
                pw.RichText(
                  text: const pw.TextSpan(
                    style: pw.TextStyle(fontSize: 11), // Estilo general
                    children: [
                      pw.TextSpan(
                        text: 'Lugar: ',
                      ),
                      pw.TextSpan(
                        text: 'Zacatepec, Morelos',
                        style: pw.TextStyle(
                          decoration: pw
                              .TextDecoration.underline, // Solo aquí subrayado
                        ),
                      ),
                    ],
                  ),
                ),
                pw.RichText(
                  text: pw.TextSpan(
                    style: const pw.TextStyle(fontSize: 11), // Estilo general
                    children: [
                      const pw.TextSpan(
                        text: 'Fecha: ',
                      ),
                      pw.TextSpan(
                        text: formattedDate,
                        style: const pw.TextStyle(
                          decoration: pw
                              .TextDecoration.underline, // Solo aquí subrayado
                        ),
                      ),
                    ],
                  ),
                ),
              ]),
          pw.SizedBox(height: 25),
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
                      padding: const pw.EdgeInsets.symmetric(
                          horizontal: 10, vertical: 20),
                      child: pw.Text(
                        style: const pw.TextStyle(fontSize: 11),
                        "Nombre del proyecto:",
                      )),
                  pw.Padding(
                      padding: const pw.EdgeInsets.symmetric(
                          horizontal: 10, vertical: 20),
                      child: pw.Text(
                        style: const pw.TextStyle(fontSize: 11),
                        nombreProyecto,
                        textAlign: pw.TextAlign.center,
                      )),
                ]),
                pw.TableRow(children: [
                  pw.Padding(
                      padding: const pw.EdgeInsets.symmetric(
                          horizontal: 10, vertical: 3),
                      child: pw.Text(
                        style: const pw.TextStyle(fontSize: 11),
                        "Nombre del Asesor:",
                      )),
                  pw.Padding(
                      padding: const pw.EdgeInsets.symmetric(
                          horizontal: 10, vertical: 3),
                      child: pw.Text(
                        style: const pw.TextStyle(fontSize: 11),
                        precidente,
                        textAlign: pw.TextAlign.center,
                      )),
                ]),
                pw.TableRow(children: [
                  pw.Padding(
                      padding: const pw.EdgeInsets.symmetric(
                          horizontal: 10, vertical: 3),
                      child: pw.Text(
                        style: const pw.TextStyle(fontSize: 11),
                        "Numero de estudiantes:",
                      )),
                  pw.Padding(
                      padding: const pw.EdgeInsets.symmetric(
                          horizontal: 10, vertical: 3),
                      child: pw.Text(
                        style: const pw.TextStyle(fontSize: 11),
                        '1',
                        textAlign: pw.TextAlign.center,
                      )),
                ]),
              ]),
          pw.SizedBox(height: 25),
          pw.Align(
            alignment: pw.Alignment.centerLeft,
            child: pw.Container(
              child: pw.Text("Datos del estudiante:",
                  // ignore: prefer_const_constructors
                  style: pw.TextStyle(fontSize: 11)),
            ),
          ),
          pw.Table(
              columnWidths: {
                0: const pw.FixedColumnWidth(
                    300), // Ancho fijo para la primera columna
                1: const pw.FixedColumnWidth(
                    200), // Ancho fijo para la primera columna
                2: const pw.FixedColumnWidth(
                    300), // Ancho fijo para la primera columna
              },
              border: pw.TableBorder.all(),
              children: [
                pw.TableRow(children: [
                  pw.Padding(
                      padding: const pw.EdgeInsets.symmetric(
                          horizontal: 10, vertical: 3),
                      child: pw.Text(
                        style: const pw.TextStyle(fontSize: 11),
                        "Nombre:",
                        textAlign: pw.TextAlign.center,
                      )),
                  pw.Padding(
                      padding: const pw.EdgeInsets.symmetric(
                          horizontal: 10, vertical: 3),
                      child: pw.Text(
                        style: const pw.TextStyle(fontSize: 11),
                        "Numero de control:",
                        textAlign: pw.TextAlign.center,
                      )),
                  pw.Padding(
                      padding: const pw.EdgeInsets.symmetric(
                          horizontal: 10, vertical: 3),
                      child: pw.Text(
                        style: const pw.TextStyle(fontSize: 11),
                        "Carrera:",
                        textAlign: pw.TextAlign.center,
                      )),
                ]),
                pw.TableRow(children: [
                  pw.Padding(
                      padding: const pw.EdgeInsets.symmetric(
                          horizontal: 10, vertical: 6),
                      child: pw.Text(
                        style: const pw.TextStyle(fontSize: 11),
                        nombre,
                        textAlign: pw.TextAlign.center,
                      )),
                  pw.Padding(
                      padding: const pw.EdgeInsets.symmetric(
                          horizontal: 10, vertical: 6),
                      child: pw.Text(
                        style: const pw.TextStyle(fontSize: 11),
                        numeroControl,
                        textAlign: pw.TextAlign.center,
                      )),
                  pw.Padding(
                      padding: const pw.EdgeInsets.symmetric(
                          horizontal: 10, vertical: 6),
                      child: pw.Text(
                        style: const pw.TextStyle(fontSize: 11),
                        carrera,
                        textAlign: pw.TextAlign.center,
                      )),
                ]),
              ]),
          pw.SizedBox(height: 10),
          pw.Table(
              columnWidths: {
                0: const pw.FixedColumnWidth(
                    300), // Ancho fijo para la primera columna
                1: const pw.FixedColumnWidth(
                    200), // Ancho fijo para la primera columna
                2: const pw.FixedColumnWidth(
                    300), // Ancho fijo para la primera columna
              },
              border: pw.TableBorder.all(),
              children: [
                pw.TableRow(children: [
                  pw.Column(children: [
                    pw.Padding(
                        padding: const pw.EdgeInsets.symmetric(
                            horizontal: 10, vertical: 3),
                        child: pw.Text(
                          style: const pw.TextStyle(fontSize: 11),
                          "Observaciones : Se autoriza el registro del Proyecto de Titulación Integral bajo el producto.",
                          textAlign: pw.TextAlign.center,
                        )),
                    pw.Padding(
                        padding: const pw.EdgeInsets.only(top: 12, bottom: 2),
                        child: pw.Text(
                          style: const pw.TextStyle(fontSize: 11),
                          formaTitulacion,
                          textAlign: pw.TextAlign.center,
                        )),
                  ])
                ]),
              ]),
          pw.SizedBox(height: 30),
          pw.Align(
            alignment: pw.Alignment.center,
            child: pw.Container(
              child: pw.Text("A T E N T A M E N T E ",
                  // ignore: prefer_const_constructors
                  style: pw.TextStyle(fontSize: 11)),
            ),
          ),
          pw.Align(
            alignment: pw.Alignment.center,
            child: pw.Container(
              child: pw.Text("Excelencia en Educación Tecnológica",
                  // ignore: prefer_const_constructors
                  style: pw.TextStyle(fontSize: 8.5)),
            ),
          ),
          pw.Align(
            alignment: pw.Alignment.center,
            child: pw.Container(
              child: pw.Text("Por la Independencia Tecnológica de Mexico",
                  // ignore: prefer_const_constructors
                  style: pw.TextStyle(fontSize: 8)),
            ),
          ),
          pw.SizedBox(height: 35),
          pw.Align(
            alignment: pw.Alignment.center,
            child: pw.Container(
              child: pw.Text(
                  "___________________________________________________",
                  // ignore: prefer_const_constructors
                  style: pw.TextStyle(
                      fontSize: 10, fontWeight: pw.FontWeight.bold)),
            ),
          ),
          pw.Align(
            alignment: pw.Alignment.center,
            child: pw.Container(
              child: pw.Text("OFELIA ESPINOSA BACA",
                  // ignore: prefer_const_constructors
                  style: pw.TextStyle(
                      fontSize: 11, fontWeight: pw.FontWeight.bold)),
            ),
          ),
          pw.Align(
            alignment: pw.Alignment.center,
            child: pw.Container(
              child: pw.Text("JEFA DEL DEPTO. DE SISTEMAS Y COMPUTACION",
                  // ignore: prefer_const_constructors
                  style: pw.TextStyle(
                      fontSize: 11, fontWeight: pw.FontWeight.bold)),
            ),
          ),

          pw.SizedBox(height: 20),

          pw.Align(
            alignment: pw.Alignment.centerLeft,
            child: pw.Container(
              child: pw.Text("ccp. Expediente",
                  // ignore: prefer_const_constructors
                  style: pw.TextStyle(fontSize: 10)),
            ),
          ),

          pw.Align(
            alignment: pw.Alignment.centerLeft,
            child: pw.Container(
              child: pw.Text("OEB/Ada*",
                  // ignore: prefer_const_constructors
                  style: pw.TextStyle(fontSize: 10)),
            ),
          ),

          pw.SizedBox(height: 35),

          //TODO : FOOTER IMAGENES
          pw.Row(children: [
            pw.Align(
              alignment: pw.Alignment.bottomLeft,
              child: pw.Image(
                imagenIndigena,
                width: 150,
                height: 100,
              ),
            ),
            pw.SizedBox(width: 4),
            pw.Column(children: [
              pw.Row(children: [
                pw.Column(
                    mainAxisAlignment: pw.MainAxisAlignment.start,
                    crossAxisAlignment: pw.CrossAxisAlignment.start,
                    children: [
                      pw.Align(
                        alignment: pw.Alignment.center,
                        child: pw.Container(
                          child: pw.Text("Calzada Tecnológico Colonia Centro",
                              // ignore: prefer_const_constructors
                              style: pw.TextStyle(
                                  fontSize: 7, fontWeight: pw.FontWeight.bold)),
                        ),
                      ),
                      pw.Align(
                        alignment: pw.Alignment.center,
                        child: pw.Container(
                          child: pw.Text(
                              "C.P. 62780 Zacatepec, Morelos. Tel. 7343432110 y 7343432111",
                              // ignore: prefer_const_constructors
                              style: pw.TextStyle(
                                  fontSize: 7, fontWeight: pw.FontWeight.bold)),
                        ),
                      ),
                      pw.Align(
                        alignment: pw.Alignment.center,
                        child: pw.Container(
                          child: pw.Text("e-mail: isc@zacatepec.tecnm.mx",
                              // ignore: prefer_const_constructors
                              style: pw.TextStyle(
                                  fontSize: 7, fontWeight: pw.FontWeight.bold)),
                        ),
                      ),
                      pw.Align(
                        alignment: pw.Alignment.center,
                        child: pw.Container(
                          child: pw.Text("www.zacatepec.tecnm.mx",
                              // ignore: prefer_const_constructors
                              style: pw.TextStyle(
                                  fontSize: 7, fontWeight: pw.FontWeight.bold)),
                        ),
                      ),
                    ]),
                pw.SizedBox(width: 7),
                pw.Align(
                  alignment: pw.Alignment.bottomLeft,
                  child: pw.Image(
                    imagenItz,
                    width: 40,
                    height: 40,
                  ),
                ),
                pw.SizedBox(width: 1),
                pw.Align(
                  alignment: pw.Alignment.bottomLeft,
                  child: pw.Image(
                    imagenLaboral,
                    width: 40,
                    height: 40,
                  ),
                ),
                pw.SizedBox(width: 1),
                pw.Align(
                  alignment: pw.Alignment.bottomLeft,
                  child: pw.Image(
                    imagenPlastico,
                    width: 40,
                    height: 40,
                  ),
                ),
                pw.SizedBox(width: 1),
                pw.Align(
                  alignment: pw.Alignment.bottomLeft,
                  child: pw.Image(
                    imagenAr,
                    width: 40,
                    height: 40,
                  ),
                ),
                pw.SizedBox(width: 1),
                pw.Align(
                  alignment: pw.Alignment.bottomLeft,
                  child: pw.Image(
                    imagenAr14,
                    width: 40,
                    height: 40,
                  ),
                ),
              ]),
              pw.Container(
                width: 412, // Largo de la línea (en puntos)
                height: 4, // Grosor de la línea
                color: PdfColors.black, // Color de la línea
              )
            ])
          ])
        ]),
      ),
    );

    //TODO : SEGUNDA PAGINA

    pdf.addPage(pw.Page(
        margin: const pw.EdgeInsets.all(25),
        build: (pw.Context context) =>
            pw.Column(mainAxisAlignment: pw.MainAxisAlignment.start, children: [
              pw.Row(children: [
                pw.Align(
                  alignment: pw.Alignment.topLeft,
                  child: pw.Image(
                    image,
                    width: 200,
                    height: 200,
                  ),
                ),
                pw.SizedBox(width: 60),
                pw.Align(
                  alignment: pw.Alignment.centerRight,
                  child: pw.Row(children: [
                    pw.SizedBox(width: 210),
                    pw.Image(
                      imageMujer,
                      width: 100,
                      height: 100,
                    ),
                  ]),
                ),
              ]),
              pw.SizedBox(height: 10),
              pw.Align(
                alignment: pw.Alignment.centerRight,
                child: pw.Container(
                  child: pw.Text("Instituto Tecnologico de Zacatepec",
                      // ignore: prefer_const_constructors
                      style: pw.TextStyle(
                          fontSize: 10, fontWeight: pw.FontWeight.bold)),
                ),
              ),
              pw.Align(
                alignment: pw.Alignment.centerRight,
                child: pw.Container(
                  child: pw.Text("Departamento de Sistemas y Computación ",
                      // ignore: prefer_const_constructors
                      style: pw.TextStyle(
                        fontSize: 8.5,
                      )),
                ),
              ),
              pw.SizedBox(height: 20),
              pw.Align(
                alignment: pw.Alignment.centerRight,
                child: pw.Container(
                  child: pw.RichText(
                    text: pw.TextSpan(
                      style: const pw.TextStyle(fontSize: 11), // Estilo general
                      children: [
                        const pw.TextSpan(
                          text: 'Lugar y Fecha: ',
                        ),
                        pw.TextSpan(
                          text:
                              'Zacatepec, Morelos, ${formattedDate.split(' ')[0]}/${formattedDate.split(' ')[2]}/${formattedDate.split(' ')[4]}',
                          style: const pw.TextStyle(
                            decoration: pw.TextDecoration
                                .underline, // Solo aquí subrayado
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              pw.Align(
                alignment: pw.Alignment.centerRight,
                child: pw.Container(
                  child: pw.Text(
                      "Asunto: Registro de Proyecto para la titulacion integral",
                      // ignore: prefer_const_constructors
                      style: pw.TextStyle(fontSize: 11)),
                ),
              ),
              pw.SizedBox(height: 25),
              pw.Align(
                alignment: pw.Alignment.centerLeft,
                child: pw.Container(
                  child: pw.Text("C. LAURA ELENA RUEDA MATA",
                      // ignore: prefer_const_constructors
                      style: pw.TextStyle(
                          fontSize: 11, fontWeight: pw.FontWeight.bold)),
                ),
              ),
              pw.Align(
                alignment: pw.Alignment.centerLeft,
                child: pw.Container(
                  child: pw.Text(
                      "JEFA DE LA DIVISION DE ESTUDIOS PROFESIONALES",
                      // ignore: prefer_const_constructors
                      style: pw.TextStyle(
                          fontSize: 11, fontWeight: pw.FontWeight.bold)),
                ),
              ),
              pw.Align(
                alignment: pw.Alignment.centerLeft,
                child: pw.Container(
                  child: pw.Text("PRESENTE",
                      // ignore: prefer_const_constructors
                      style: pw.TextStyle(
                          fontSize: 11, fontWeight: pw.FontWeight.bold)),
                ),
              ),
              pw.SizedBox(height: 20),
              pw.Align(
                alignment: pw.Alignment.centerLeft,
                child: pw.Container(
                  child: pw.Text(
                      "Por este medio informo que ha sido liberado el siguiente proyecto para la titulación integral:",
                      // ignore: prefer_const_constructors
                      style: pw.TextStyle(fontSize: 11)),
                ),
              ),
              pw.SizedBox(height: 20),
              pw.Table(
                  columnWidths: {
                    0: const pw.FixedColumnWidth(
                        280), // Ancho fijo para la primera columna
                    1: const pw.FixedColumnWidth(
                        350), // Ancho fijo para la primera columna
                  },
                  border: pw.TableBorder.all(),
                  children: [
                    pw.TableRow(children: [
                      pw.Padding(
                          padding: const pw.EdgeInsets.symmetric(
                              horizontal: 10, vertical: 3),
                          child: pw.Text(
                            style: const pw.TextStyle(fontSize: 11),
                            "Nombre del estudiante y/o egresado:",
                          )),
                      pw.Padding(
                          padding: const pw.EdgeInsets.symmetric(
                              horizontal: 10, vertical: 3),
                          child: pw.Text(
                            style: const pw.TextStyle(fontSize: 11),
                            nombre,
                            textAlign: pw.TextAlign.center,
                          )),
                    ]),
                    pw.TableRow(children: [
                      pw.Padding(
                          padding: const pw.EdgeInsets.symmetric(
                              horizontal: 10, vertical: 3),
                          child: pw.Text(
                            style: const pw.TextStyle(fontSize: 11),
                            "Carrera:",
                          )),
                      pw.Padding(
                          padding: const pw.EdgeInsets.symmetric(
                              horizontal: 10, vertical: 3),
                          child: pw.Text(
                            style: const pw.TextStyle(fontSize: 11),
                            carrera,
                            textAlign: pw.TextAlign.center,
                          )),
                    ]),
                    pw.TableRow(children: [
                      pw.Padding(
                          padding: const pw.EdgeInsets.symmetric(
                              horizontal: 10, vertical: 3),
                          child: pw.Text(
                            style: const pw.TextStyle(fontSize: 11),
                            "Nu. De control:",
                          )),
                      pw.Padding(
                          padding: const pw.EdgeInsets.symmetric(
                              horizontal: 10, vertical: 3),
                          child: pw.Text(
                            style: const pw.TextStyle(fontSize: 11),
                            numeroControl,
                            textAlign: pw.TextAlign.center,
                          )),
                    ]),
                    pw.TableRow(children: [
                      pw.Padding(
                          padding: const pw.EdgeInsets.symmetric(
                              horizontal: 10, vertical: 12),
                          child: pw.Text(
                            style: const pw.TextStyle(fontSize: 11),
                            "Nombre del proyecto:",
                          )),
                      pw.Padding(
                          padding: const pw.EdgeInsets.symmetric(
                              horizontal: 10, vertical: 12),
                          child: pw.Text(
                            style: const pw.TextStyle(fontSize: 11),
                            nombreProyecto,
                            textAlign: pw.TextAlign.center,
                          )),
                    ]),
                    pw.TableRow(children: [
                      pw.Padding(
                          padding: const pw.EdgeInsets.symmetric(
                              horizontal: 10, vertical: 3),
                          child: pw.Text(
                            style: const pw.TextStyle(fontSize: 11),
                            "Producto:",
                          )),
                      pw.Padding(
                          padding: const pw.EdgeInsets.symmetric(
                              horizontal: 10, vertical: 3),
                          child: pw.Text(
                            style: const pw.TextStyle(fontSize: 11),
                            formaTitulacion,
                            textAlign: pw.TextAlign.center,
                          )),
                    ]),
                  ]),
              pw.SizedBox(height: 20),
              pw.Align(
                alignment: pw.Alignment.centerLeft,
                child: pw.Container(
                  child: pw.Text(
                      "Agradezco de antemano su valioso apoyo en esta importante actividad para la formacion profesional de nuestros egresados.",
                      // ignore: prefer_const_constructors
                      style: pw.TextStyle(fontSize: 11)),
                ),
              ),
              pw.SizedBox(height: 30),
              pw.Align(
                alignment: pw.Alignment.center,
                child: pw.Container(
                  child: pw.Text("A T E N T A M E N T E ",
                      // ignore: prefer_const_constructors
                      style: pw.TextStyle(fontSize: 11)),
                ),
              ),
              pw.Align(
                alignment: pw.Alignment.center,
                child: pw.Container(
                  child: pw.Text("Excelencia en Educación Tecnológica",
                      // ignore: prefer_const_constructors
                      style: pw.TextStyle(fontSize: 8.5)),
                ),
              ),
              pw.Align(
                alignment: pw.Alignment.center,
                child: pw.Container(
                  child: pw.Text("Por la Independencia Tecnológica de Mexico",
                      // ignore: prefer_const_constructors
                      style: pw.TextStyle(fontSize: 8)),
                ),
              ),
              pw.SizedBox(height: 35),
              pw.Align(
                alignment: pw.Alignment.center,
                child: pw.Container(
                  child: pw.Text(
                      "___________________________________________________",
                      // ignore: prefer_const_constructors
                      style: pw.TextStyle(
                          fontSize: 10, fontWeight: pw.FontWeight.bold)),
                ),
              ),
              pw.Align(
                alignment: pw.Alignment.center,
                child: pw.Container(
                  child: pw.Text("OFELIA ESPINOSA BACA",
                      // ignore: prefer_const_constructors
                      style: pw.TextStyle(
                          fontSize: 11, fontWeight: pw.FontWeight.bold)),
                ),
              ),
              pw.Align(
                alignment: pw.Alignment.center,
                child: pw.Container(
                  child: pw.Text("JEFA DEL DEPTO. DE SISTEMAS Y COMPUTACION",
                      // ignore: prefer_const_constructors
                      style: pw.TextStyle(
                          fontSize: 11, fontWeight: pw.FontWeight.bold)),
                ),
              ),
              pw.SizedBox(height: 20),
              pw.Table(
                  columnWidths: {
                    0: const pw.FixedColumnWidth(
                        200), // Ancho fijo para la primera columna
                    1: const pw.FixedColumnWidth(
                        200), // Ancho fijo para la primera columna
                    2: const pw.FixedColumnWidth(
                        200), // Ancho fijo para la primera columna
                  },
                  border: pw.TableBorder.all(),
                  children: [
                    pw.TableRow(children: [
                      pw.Padding(
                          padding: const pw.EdgeInsets.symmetric(
                              horizontal: 10, vertical: 13),
                          child: pw.Text(
                            style: const pw.TextStyle(fontSize: 11),
                            precidente,
                          )),
                      pw.Padding(
                          padding: const pw.EdgeInsets.symmetric(
                              horizontal: 10, vertical: 13),
                          child: pw.Text(
                            style: const pw.TextStyle(fontSize: 11),
                            '',
                            textAlign: pw.TextAlign.center,
                          )),
                      pw.Padding(
                          padding: const pw.EdgeInsets.symmetric(
                              horizontal: 10, vertical: 13),
                          child: pw.Text(
                            style: const pw.TextStyle(fontSize: 11),
                            '',
                            textAlign: pw.TextAlign.center,
                          )),
                    ]),
                    pw.TableRow(children: [
                      pw.Padding(
                          padding: const pw.EdgeInsets.symmetric(
                              horizontal: 10, vertical: 3),
                          child: pw.Text(
                            style: const pw.TextStyle(fontSize: 11),
                            "Nombre y Firma del asesor:",
                          )),
                      pw.Padding(
                          padding: const pw.EdgeInsets.symmetric(
                              horizontal: 10, vertical: 3),
                          child: pw.Text(
                            style: const pw.TextStyle(fontSize: 11),
                            'Nombre y Firma del Revisor *',
                            textAlign: pw.TextAlign.center,
                          )),
                      pw.Padding(
                          padding: const pw.EdgeInsets.symmetric(
                              horizontal: 10, vertical: 3),
                          child: pw.Text(
                            style: const pw.TextStyle(fontSize: 11),
                            'Nombre y Firma de la Revisora *',
                            textAlign: pw.TextAlign.center,
                          )),
                    ]),
                  ]),
              pw.Align(
                alignment: pw.Alignment.centerLeft,
                child: pw.Container(
                  child: pw.Text("*solo aplica para el caso de tesis o tesina",
                      // ignore: prefer_const_constructors
                      style: pw.TextStyle(
                          fontSize: 11, fontWeight: pw.FontWeight.bold)),
                ),
              ),
              pw.SizedBox(height: 5),
              pw.Align(
                alignment: pw.Alignment.centerLeft,
                child: pw.Container(
                  child: pw.Text("ccp. Expediente",
                      // ignore: prefer_const_constructors
                      style: pw.TextStyle(fontSize: 11)),
                ),
              ),
              pw.Align(
                alignment: pw.Alignment.centerLeft,
                child: pw.Container(
                  child: pw.Text("OEB/Ada*",
                      // ignore: prefer_const_constructors
                      style: pw.TextStyle(fontSize: 11)),
                ),
              ),
              //TODO : FOOTER
              pw.SizedBox(height: 35),
              pw.Row(children: [
                pw.Align(
                  alignment: pw.Alignment.bottomLeft,
                  child: pw.Image(
                    imagenIndigena,
                    width: 150,
                    height: 100,
                  ),
                ),
                pw.SizedBox(width: 4),
                pw.Column(children: [
                  pw.Row(children: [
                    pw.Column(
                        mainAxisAlignment: pw.MainAxisAlignment.start,
                        crossAxisAlignment: pw.CrossAxisAlignment.start,
                        children: [
                          pw.Align(
                            alignment: pw.Alignment.center,
                            child: pw.Container(
                              child: pw.Text(
                                  "Calzada Tecnológico Colonia Centro",
                                  // ignore: prefer_const_constructors
                                  style: pw.TextStyle(
                                      fontSize: 7,
                                      fontWeight: pw.FontWeight.bold)),
                            ),
                          ),
                          pw.Align(
                            alignment: pw.Alignment.center,
                            child: pw.Container(
                              child: pw.Text(
                                  "C.P. 62780 Zacatepec, Morelos. Tel. 7343432110 y 7343432111",
                                  // ignore: prefer_const_constructors
                                  style: pw.TextStyle(
                                      fontSize: 7,
                                      fontWeight: pw.FontWeight.bold)),
                            ),
                          ),
                          pw.Align(
                            alignment: pw.Alignment.center,
                            child: pw.Container(
                              child: pw.Text("e-mail: isc@zacatepec.tecnm.mx",
                                  // ignore: prefer_const_constructors
                                  style: pw.TextStyle(
                                      fontSize: 7,
                                      fontWeight: pw.FontWeight.bold)),
                            ),
                          ),
                          pw.Align(
                            alignment: pw.Alignment.center,
                            child: pw.Container(
                              child: pw.Text("www.zacatepec.tecnm.mx",
                                  // ignore: prefer_const_constructors
                                  style: pw.TextStyle(
                                      fontSize: 7,
                                      fontWeight: pw.FontWeight.bold)),
                            ),
                          ),
                        ]),
                    pw.SizedBox(width: 7),
                    pw.Align(
                      alignment: pw.Alignment.bottomLeft,
                      child: pw.Image(
                        imagenItz,
                        width: 40,
                        height: 40,
                      ),
                    ),
                    pw.SizedBox(width: 1),
                    pw.Align(
                      alignment: pw.Alignment.bottomLeft,
                      child: pw.Image(
                        imagenLaboral,
                        width: 40,
                        height: 40,
                      ),
                    ),
                    pw.SizedBox(width: 1),
                    pw.Align(
                      alignment: pw.Alignment.bottomLeft,
                      child: pw.Image(
                        imagenPlastico,
                        width: 40,
                        height: 40,
                      ),
                    ),
                    pw.SizedBox(width: 1),
                    pw.Align(
                      alignment: pw.Alignment.bottomLeft,
                      child: pw.Image(
                        imagenAr,
                        width: 40,
                        height: 40,
                      ),
                    ),
                    pw.SizedBox(width: 1),
                    pw.Align(
                      alignment: pw.Alignment.bottomLeft,
                      child: pw.Image(
                        imagenAr14,
                        width: 40,
                        height: 40,
                      ),
                    ),
                  ]),
                  pw.Container(
                    width: 412, // Largo de la línea (en puntos)
                    height: 4, // Grosor de la línea
                    color: PdfColors.black, // Color de la línea
                  )
                ])
              ])
            ])));

    //TODO: TERCERA PAGINA

    pdf.addPage(
      pw.Page(
        margin: const pw.EdgeInsets.all(25),
        build: (pw.Context context) {
          return pw.Column(
            mainAxisAlignment: pw.MainAxisAlignment.start,
            children: [
              pw.Row(children: [
                pw.Align(
                  alignment: pw.Alignment.topLeft,
                  child: pw.Image(
                    image,
                    width: 200,
                    height: 200,
                  ),
                ),
                pw.SizedBox(width: 60),
                pw.Align(
                  alignment: pw.Alignment.centerRight,
                  child: pw.Row(children: [
                    pw.SizedBox(width: 210),
                    pw.Image(
                      imageMujer,
                      width: 100,
                      height: 100,
                    ),
                  ]),
                ),
              ]),
              pw.SizedBox(height: 10),
              pw.Align(
                alignment: pw.Alignment.centerRight,
                child: pw.Container(
                  child: pw.Text("Instituto Tecnologico de Zacatepec",
                      // ignore: prefer_const_constructors
                      style: pw.TextStyle(
                          fontSize: 10, fontWeight: pw.FontWeight.bold)),
                ),
              ),
              pw.Align(
                alignment: pw.Alignment.centerRight,
                child: pw.Container(
                  child: pw.Text("Departamento de Sistemas y Computación",
                      // ignore: prefer_const_constructors
                      style: pw.TextStyle(
                        fontSize: 8.5,
                      )),
                ),
              ),
              pw.SizedBox(height: 20),
              pw.SizedBox(height: 20),
              pw.Align(
                alignment: pw.Alignment.centerRight,
                child: pw.Container(
                  child: pw.RichText(
                    text: pw.TextSpan(
                      style: const pw.TextStyle(fontSize: 11), // Estilo general
                      children: [
                        const pw.TextSpan(
                          text: 'Lugar y Fecha: ',
                        ),
                        const pw.TextSpan(
                          text: 'Zacatepec, Morelos, ',
                          style: pw.TextStyle(
                            decoration: pw.TextDecoration
                                .underline, // Solo aquí subrayado
                          ),
                        ),
                        pw.TextSpan(
                          text:
                              '${formattedDate.split(' ')[0]}/${formattedDate.split(' ')[2]}/${formattedDate.split(' ')[4]}',
                          style: const pw.TextStyle(
                            decoration: pw.TextDecoration
                                .underline, // Solo aquí subrayado
                            color: PdfColors.white,
                            background: pw.BoxDecoration(
                              color: PdfColors.black,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              pw.Align(
                alignment: pw.Alignment.centerRight,
                child: pw.Container(
                  child: pw.Text("Departamento de Sistemas y Computación",
                      // ignore: prefer_const_constructors
                      style: pw.TextStyle(fontSize: 11)),
                ),
              ),
              pw.Align(
                alignment: pw.Alignment.centerRight,
                child: pw.Container(
                  child: pw.Text("Asunto: Jurado de Examen Profesional",
                      // ignore: prefer_const_constructors
                      style: pw.TextStyle(fontSize: 11)),
                ),
              ),
              pw.SizedBox(height: 25),
              pw.Align(
                alignment: pw.Alignment.centerLeft,
                child: pw.Container(
                  child: pw.Text("C. LAURA ELENA RUEDA MATA",
                      // ignore: prefer_const_constructors
                      style: pw.TextStyle(
                          fontSize: 11, fontWeight: pw.FontWeight.bold)),
                ),
              ),
              pw.Align(
                alignment: pw.Alignment.centerLeft,
                child: pw.Container(
                  child: pw.Text(
                      "JEFA DE LA DIVISION DE ESTUDIOS PROFESIONALES",
                      // ignore: prefer_const_constructors
                      style: pw.TextStyle(
                          fontSize: 11, fontWeight: pw.FontWeight.bold)),
                ),
              ),
              pw.Align(
                alignment: pw.Alignment.centerLeft,
                child: pw.Container(
                  child: pw.Text("PRESENTE",
                      // ignore: prefer_const_constructors
                      style: pw.TextStyle(
                          fontSize: 11, fontWeight: pw.FontWeight.bold)),
                ),
              ),
              pw.SizedBox(height: 30),
              pw.Container(
                width: double.infinity,
                child: pw.Row(
                  mainAxisSize: pw.MainAxisSize.max,
                  children: [
                    pw.Expanded(
                      child: pw.RichText(
                        text: pw.TextSpan(
                          style: const pw.TextStyle(
                              fontSize: 11), // Estilo general
                          children: [
                            const pw.TextSpan(
                              text:
                                  'Por medio de la presente, me permito informarle a usted, el nombre de los catedráticos que han sido comisionados para participar como JURADO, en el Examen Profesional del C. ',
                            ),
                            pw.TextSpan(
                              text: nombre,
                              style: pw.TextStyle(
                                  decoration: pw.TextDecoration.underline,
                                  fontWeight: pw.FontWeight.bold),
                            ),
                            const pw.TextSpan(
                              text: ' con número de control: ',
                            ),
                            pw.TextSpan(
                              text: '$numeroControl, ',
                              style: pw.TextStyle(
                                  decoration: pw.TextDecoration.underline,
                                  fontWeight: pw.FontWeight.bold),
                            ),
                            const pw.TextSpan(
                              text: 'pasante de la carrera de: ',
                            ),
                            pw.TextSpan(
                              text: '$carrera, ',
                              style: pw.TextStyle(
                                  decoration: pw.TextDecoration.underline,
                                  fontWeight: pw.FontWeight.bold),
                            ),
                            const pw.TextSpan(
                              text:
                                  'quien realiza trámites de titulación integral mediante el producto: ',
                            ),
                            pw.TextSpan(
                              text: '$formaTitulacion.',
                              style: pw.TextStyle(
                                  decoration: pw.TextDecoration.underline,
                                  fontWeight: pw.FontWeight.bold),
                            ),
                          ],
                        ),
                        textAlign: pw.TextAlign.justify,
                      ),
                    ),
                  ],
                ),
              ),
              pw.SizedBox(height: 30),
              pw.Align(
                  alignment: pw.Alignment.centerLeft,
                  child: pw.Row(
                      mainAxisAlignment: pw.MainAxisAlignment.start,
                      children: [
                        pw.SizedBox(width: 20),
                        pw.Column(
                            mainAxisAlignment: pw.MainAxisAlignment.start,
                            crossAxisAlignment: pw.CrossAxisAlignment.start,
                            children: [
                              pw.Text('Presidente: ',
                                  style: const pw.TextStyle(fontSize: 11)),
                              pw.Text('Secretario: ',
                                  style: const pw.TextStyle(fontSize: 11)),
                              pw.Text('Vocal: ',
                                  style: const pw.TextStyle(fontSize: 11)),
                              pw.Text('Suplente: ',
                                  style: const pw.TextStyle(fontSize: 11)),
                            ]),
                        pw.SizedBox(width: 20),
                        pw.Column(
                            mainAxisAlignment: pw.MainAxisAlignment.start,
                            crossAxisAlignment: pw.CrossAxisAlignment.start,
                            children: [
                              pw.Text(precidente,
                                  style: const pw.TextStyle(fontSize: 11)),
                              pw.Text(secretario,
                                  style: const pw.TextStyle(fontSize: 11)),
                              pw.Text(vocal,
                                  style: const pw.TextStyle(fontSize: 11)),
                              pw.Text(suplente,
                                  style: const pw.TextStyle(fontSize: 11)),
                            ]),
                        pw.SizedBox(width: 40),
                        pw.Column(
                            mainAxisAlignment: pw.MainAxisAlignment.start,
                            crossAxisAlignment: pw.CrossAxisAlignment.start,
                            children: [
                              pw.Text('Cedula: ',
                                  style: const pw.TextStyle(fontSize: 11)),
                              pw.Text('Cedula: ',
                                  style: const pw.TextStyle(fontSize: 11)),
                              pw.Text('Cedula: ',
                                  style: const pw.TextStyle(fontSize: 11)),
                              pw.Text('Cedula: ',
                                  style: const pw.TextStyle(fontSize: 11)),
                            ]),
                        pw.SizedBox(width: 10),
                        pw.Column(
                            mainAxisAlignment: pw.MainAxisAlignment.start,
                            crossAxisAlignment: pw.CrossAxisAlignment.start,
                            children: [
                              pw.Text('2826267',
                                  style: const pw.TextStyle(fontSize: 11)),
                              pw.Text('12324319',
                                  style: const pw.TextStyle(fontSize: 11)),
                              pw.Text('5774355',
                                  style: const pw.TextStyle(fontSize: 11)),
                              pw.Text('4192619',
                                  style: const pw.TextStyle(fontSize: 11)),
                            ]),
                      ])),
              pw.SizedBox(height: 35),
              pw.Align(
                  alignment: pw.Alignment.centerLeft,
                  child: pw.Text('Sin otro particular, quedo ante usted.',
                      style: const pw.TextStyle(fontSize: 11))),
              pw.SizedBox(height: 50),
              pw.Align(
                alignment: pw.Alignment.centerLeft,
                child: pw.Container(
                  child: pw.Text("A T E N T A M E N T E ",
                      // ignore: prefer_const_constructors
                      style: pw.TextStyle(fontSize: 11)),
                ),
              ),
              pw.Align(
                alignment: pw.Alignment.centerLeft,
                child: pw.Container(
                  child: pw.Text("Excelencia en Educación Tecnológica",
                      // ignore: prefer_const_constructors
                      style: pw.TextStyle(fontSize: 8.5)),
                ),
              ),
              pw.Align(
                alignment: pw.Alignment.centerLeft,
                child: pw.Container(
                  child: pw.Text("Por la Independencia Tecnológica de Mexico",
                      // ignore: prefer_const_constructors
                      style: pw.TextStyle(fontSize: 8)),
                ),
              ),
              pw.SizedBox(height: 45),
              pw.Align(
                alignment: pw.Alignment.centerLeft,
                child: pw.Container(
                  child: pw.Text("OFELIA ESPINOSA BACA",
                      // ignore: prefer_const_constructors
                      style: pw.TextStyle(
                          fontSize: 11, fontWeight: pw.FontWeight.bold)),
                ),
              ),
              pw.Align(
                alignment: pw.Alignment.centerLeft,
                child: pw.Container(
                  child: pw.Text("JEFA DEL DEPTO. DE SISTEMAS Y COMPUTACION",
                      // ignore: prefer_const_constructors
                      style: pw.TextStyle(
                          fontSize: 11, fontWeight: pw.FontWeight.bold)),
                ),
              ),
              pw.SizedBox(height: 20),
              pw.Align(
                alignment: pw.Alignment.centerLeft,
                child: pw.Container(
                  child: pw.Text("ccp. Expediente",
                      // ignore: prefer_const_constructors
                      style: pw.TextStyle(fontSize: 9)),
                ),
              ),
              pw.Align(
                alignment: pw.Alignment.centerLeft,
                child: pw.Container(
                  child: pw.Text("OEB/Ada*",
                      // ignore: prefer_const_constructors
                      style: pw.TextStyle(fontSize: 9)),
                ),
              ),
              pw.SizedBox(height: 55),
              pw.Row(children: [
                pw.Align(
                  alignment: pw.Alignment.bottomLeft,
                  child: pw.Image(
                    imagenIndigena,
                    width: 150,
                    height: 100,
                  ),
                ),
                pw.SizedBox(width: 4),
                pw.Column(children: [
                  pw.Row(children: [
                    pw.Column(
                        mainAxisAlignment: pw.MainAxisAlignment.start,
                        crossAxisAlignment: pw.CrossAxisAlignment.start,
                        children: [
                          pw.Align(
                            alignment: pw.Alignment.center,
                            child: pw.Container(
                              child: pw.Text(
                                  "Calzada Tecnológico Colonia Centro",
                                  // ignore: prefer_const_constructors
                                  style: pw.TextStyle(
                                      fontSize: 7,
                                      fontWeight: pw.FontWeight.bold)),
                            ),
                          ),
                          pw.Align(
                            alignment: pw.Alignment.center,
                            child: pw.Container(
                              child: pw.Text(
                                  "C.P. 62780 Zacatepec, Morelos. Tel. 7343432110 y 7343432111",
                                  // ignore: prefer_const_constructors
                                  style: pw.TextStyle(
                                      fontSize: 7,
                                      fontWeight: pw.FontWeight.bold)),
                            ),
                          ),
                          pw.Align(
                            alignment: pw.Alignment.center,
                            child: pw.Container(
                              child: pw.Text("e-mail: isc@zacatepec.tecnm.mx",
                                  // ignore: prefer_const_constructors
                                  style: pw.TextStyle(
                                      fontSize: 7,
                                      fontWeight: pw.FontWeight.bold)),
                            ),
                          ),
                          pw.Align(
                            alignment: pw.Alignment.center,
                            child: pw.Container(
                              child: pw.Text("www.zacatepec.tecnm.mx",
                                  // ignore: prefer_const_constructors
                                  style: pw.TextStyle(
                                      fontSize: 7,
                                      fontWeight: pw.FontWeight.bold)),
                            ),
                          ),
                        ]),
                    pw.SizedBox(width: 7),
                    pw.Align(
                      alignment: pw.Alignment.bottomLeft,
                      child: pw.Image(
                        imagenItz,
                        width: 40,
                        height: 40,
                      ),
                    ),
                    pw.SizedBox(width: 1),
                    pw.Align(
                      alignment: pw.Alignment.bottomLeft,
                      child: pw.Image(
                        imagenLaboral,
                        width: 40,
                        height: 40,
                      ),
                    ),
                    pw.SizedBox(width: 1),
                    pw.Align(
                      alignment: pw.Alignment.bottomLeft,
                      child: pw.Image(
                        imagenPlastico,
                        width: 40,
                        height: 40,
                      ),
                    ),
                    pw.SizedBox(width: 1),
                    pw.Align(
                      alignment: pw.Alignment.bottomLeft,
                      child: pw.Image(
                        imagenAr,
                        width: 40,
                        height: 40,
                      ),
                    ),
                    pw.SizedBox(width: 1),
                    pw.Align(
                      alignment: pw.Alignment.bottomLeft,
                      child: pw.Image(
                        imagenAr14,
                        width: 40,
                        height: 40,
                      ),
                    ),
                  ]),
                  pw.Container(
                    width: 412, // Largo de la línea (en puntos)
                    height: 4, // Grosor de la línea
                    color: PdfColors.black, // Color de la línea
                  )
                ])
              ])
            ],
          );
        },
      ),
    );

    // Convierte el PDF en bytes
    Uint8List pdfBytes = await pdf.save();

    // Descarga el PDF en Flutter Web
    await Printing.sharePdf(bytes: pdfBytes, filename: "reporte.pdf");
  }
}
