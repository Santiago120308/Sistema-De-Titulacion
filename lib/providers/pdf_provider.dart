import 'dart:typed_data';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';

class PdfProvider extends ChangeNotifier {
  final FirebaseStorage _storage = FirebaseStorage.instance;

  Uint8List? pdfFile;
  String? _pdfUrl;
  String? get pdfUrl => _pdfUrl;

  Future<String?> subirSolicitud(String numeroControl) async {
    try {
      // Generar nombre del archivo
      //String fileName = "solicitud_titulacion_${numeroControl}_${DateTime.now().millisecondsSinceEpoch}.pdf";

      // Referencia en Storage (se organiza en carpetas por nombreCarrera)
      Reference ref = _storage.ref().child('$numeroControl/solicitud.pdf');

      try {
        await ref.getDownloadURL(); // Intenta obtener la URL

        // Si llega aquí, el archivo existe → lo eliminamos
        await ref.delete();
        print("Archivo anterior eliminado.");
      } catch (e) {
        // Si entra aquí, es porque el archivo no existe (lo ignoramos)
        print("No había archivo previo: $e");
      }

      // Subir archivo a Firebase Storage
      if (pdfFile != null) {
        UploadTask uploadTask = ref.putData(pdfFile!);
        TaskSnapshot snapshot = await uploadTask;
        _pdfUrl = await snapshot.ref.getDownloadURL();
      } else {
        return null;
      }

      if (_pdfUrl != null) {
        return _pdfUrl!;
      }

      return null;
    } catch (e) {
      print("Error al subir el PDF: $e");
      _pdfUrl = null;
    }
    return null;
  }
}
