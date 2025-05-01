import 'dart:typed_data';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:titulacion_app/providers/pdf_provider.dart';

class StudentFileUploader extends StatefulWidget {
  const StudentFileUploader({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _StudentFileUploaderState createState() => _StudentFileUploaderState();
}

class _StudentFileUploaderState extends State<StudentFileUploader> {
  String? fileName;
  String? fileError;
  Uint8List? pickedFile; // Variable para almacenar el archivo en bytes

  Future<void> _pickFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['pdf'], // Solo archivos PDF
      withData: true, // ✅ Asegura que los bytes se carguen correctamente
    );

    if (result != null && result.files.single.bytes != null) {
      setState(() {
        fileName = result.files.single.name;
        fileError = null;
        pickedFile =
            result.files.single.bytes; // ✅ Obtiene los bytes correctamente
      });
    } else {
      setState(() {
        fileError = "No se seleccionó ningún archivo";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final pdfProvider = Provider.of<PdfProvider>(context, listen: false);

    if (pickedFile != null) {
      pdfProvider.pdfFile = pickedFile; // ✅ Almacena el archivo en el provider
    }

    return SizedBox(
      width: 600,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 10),

          // Botón para seleccionar archivo
          ElevatedButton.icon(
            style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF0F4295),
                foregroundColor: Colors.white),
            onPressed: _pickFile,
            icon: const Icon(Icons.file_upload),
            label: const Padding(
              padding: EdgeInsets.all(15.0),
              child: Text("Seleccionar archivo"),
            ),
          ),

          const SizedBox(height: 10),

          // Mostrar el nombre del archivo seleccionado o error
          fileName != null
              ? Text("Archivo seleccionado: $fileName")
              : fileError != null
                  ? Text(fileError!)
                  : Container(),

          const SizedBox(height: 100),
        ],
      ),
    );
  }
}
