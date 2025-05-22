import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:titulacion_app/presentation/shared/textFieldForm.dart';
import 'package:titulacion_app/providers/reporte_academico_provider.dart';

class GenerarReporteAcademicoScreen extends StatelessWidget {
  const GenerarReporteAcademicoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final datosReporteAcademico =
        Provider.of<ReporteAcademicoProvider>(context);
    final width = MediaQuery.of(context).size.width;

    return Column(
      children: [
        Center(
          child: Text(
              'Generar reporte academico del estudiante : ${datosReporteAcademico.nombre}' , 
              style: GoogleFonts.kanit(
                    fontSize: 27, fontWeight: FontWeight.w600)),
        ),
        labelField("Completa el Registro", 20, FontWeight.normal, Colors.black,
            10, 20),
        Form(
          key: datosReporteAcademico.formKey,
            child: Padding(
          padding: EdgeInsets.all(10),
          child: Column(
            children: [
              labelField(
                  'Presidente', 14, FontWeight.bold, Colors.black, 0, 10),
              SizedBox(
                height: width > 400 ? 65 : 60,
                child: TextFormField(
                  validator: (value) => (value == null || value.isEmpty)
                      ? 'Campo Obligatorio'
                      : null,
                  onChanged: (value) => datosReporteAcademico.precidente = value,
                  decoration: builderInputDecoration('Presidente'),
                  style: const TextStyle(
                    fontSize: 14,
                  ),
                ),
              ),
              labelField(
                  'Secretario', 14, FontWeight.bold, Colors.black, 0, 10),
              SizedBox(
                height: width > 400 ? 65 : 60,
                child: TextFormField(
                  validator: (value) => (value == null || value.isEmpty)
                      ? 'Campo Obligatorio'
                      : null,
                  onChanged: (value) => datosReporteAcademico.secretario = value,
                  decoration: builderInputDecoration('Secretario'),
                  style: const TextStyle(
                    fontSize: 14,
                  ),
                ),
              ),
              labelField('Vocal', 14, FontWeight.bold, Colors.black, 0, 10),
              SizedBox(
                height: width > 400 ? 65 : 60,
                child: TextFormField(
                  validator: (value) => (value == null || value.isEmpty)
                      ? 'Campo Obligatorio'
                      : null,
                  onChanged: (value) => datosReporteAcademico.vocal = value,
                  decoration: builderInputDecoration('Vocal'),
                  style: const TextStyle(
                    fontSize: 14,
                  ),
                ),
              ),
              labelField('Suplente', 14, FontWeight.bold, Colors.black, 0, 10),
              SizedBox(
                height: width > 400 ? 65 : 60,
                child: TextFormField(
                  validator: (value) => (value == null || value.isEmpty)
                      ? 'Campo Obligatorio'
                      : null,
                  onChanged: (value) => datosReporteAcademico.suplente = value,
                  decoration: builderInputDecoration('Suplente'),
                  style: const TextStyle(
                    fontSize: 14,
                  ),
                ),
              ),

              const SizedBox(height: 10,) , 

              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 15, 66, 149),
                    foregroundColor: Colors.white,
                  ),
                  onPressed: () async {
                    if(datosReporteAcademico.isValidForm()){
                     await datosReporteAcademico.generatorPdf();
                    }
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "Generar Reporte",
                      style: GoogleFonts.poppins(
                        fontSize: 18,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ))
      ],
    );
  }
}
