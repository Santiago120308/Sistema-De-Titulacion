import 'dart:typed_data';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:pdf/pdf.dart';
import 'package:printing/printing.dart';
import 'package:titulacion_app/routes/app_router.dart';
import 'package:titulacion_app/services/navigation_service_go.dart';

class ViewPdfScreen extends StatefulWidget {
  final String numControl;
  const ViewPdfScreen({super.key, required this.numControl});

  @override
  State<ViewPdfScreen> createState() => _ViewPdfScreenState();
}

class _ViewPdfScreenState extends State<ViewPdfScreen> {
  Uint8List? xx;

  @override
  void initState() {
    super.initState();
    loadPdf(); // Llamamos a una función async aparte
  }

  Future<void> loadPdf() async {
    Reference ref = FirebaseStorage.instance
        .ref()
        .child(widget.numControl)
        .child('solicitud.pdf');

    Uint8List? data = await ref.getData();

    setState(() {
      xx = data;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Ver PDF'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            //NavigationServiceGo.navigateTo(context, AppRouter.division); // Regresa a la pantalla anterior
            GoRouter.of(context).pop();

          },
        ),
      ),
      body: xx == null
          ? const Center(child: CircularProgressIndicator())
          : PdfPreview(
              build: (format) => xx!, initialPageFormat: PdfPageFormat.a5),
    );
  }
}
