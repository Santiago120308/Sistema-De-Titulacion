import 'package:titulacion_app/helpers/generatedPdfs/formats/1993/generated_pdf_1993.dart';
import 'package:titulacion_app/helpers/generatedPdfs/formats/1993/opcion_III/generated_pdf_opcion_3.dart';
import 'package:titulacion_app/helpers/generatedPdfs/formats/1993/opcion_V/generated_pdf_opcion_5_1993.dart';
import 'package:titulacion_app/helpers/generatedPdfs/formats/1993/opcion_VI/generated_pdf_opcion_6_1993.dart';
import 'package:titulacion_app/helpers/generatedPdfs/formats/1993/opcion_VIII/generated_pdf_opcion_8_1993.dart';
import 'package:titulacion_app/helpers/generatedPdfs/formats/1993/opcion_X/generated_pdf_opcion_10_1993.dart';
import 'package:titulacion_app/helpers/generatedPdfs/formats/2004-2005/generated_pdf_2004.dart';
import 'package:titulacion_app/helpers/generatedPdfs/formats/2004-2005/opcion_III/generated_pdf_opcion_3_2004.dart';
import 'package:titulacion_app/helpers/generatedPdfs/formats/2004-2005/opcion_VI/generated_pdf_opcion_6_2004.dart';
import 'package:titulacion_app/helpers/generatedPdfs/formats/2004-2005/opcion_VIII/generated_pdf_opcion_8_2004.dart';
import 'package:titulacion_app/helpers/generatedPdfs/formats/2004-2005/opcion_X/generated_pdf_opcion_10_2004.dart';
import 'package:titulacion_app/helpers/generatedPdfs/formats/2009-2010/generated_pdf_2009.dart';
import 'package:titulacion_app/helpers/generatedPdfs/formats/2009-2010/opcion_I/generated_pdf_opcion_1_2009.dart';
import 'package:titulacion_app/helpers/generatedPdfs/formats/2009-2010/opcion_II/generated_pdf_opcion_2_2009.dart';
import 'package:titulacion_app/helpers/generatedPdfs/formats/2009-2010/opcion_VI/generated_pdf_opcion_6_2009.dart';
import 'package:titulacion_app/helpers/generatedPdfs/formats/2017/generated_pdf_2010.dart';
import 'package:titulacion_app/helpers/generatedPdfs/formats/2017/opcion_I/generated_pdf_opcion_1_2017.dart';
import 'package:titulacion_app/helpers/generatedPdfs/formats/2017/opcion_II/generated_pdf_opcion_2_2017.dart';
import 'package:titulacion_app/helpers/generatedPdfs/formats/2017/opcion_IV/generated_pdf_opcion_4_2017.dart';
import 'package:titulacion_app/helpers/generatedPdfs/formats/2017/opcion_V/generated_pdf_opcion_5_2017.dart';
import 'package:titulacion_app/helpers/generatedPdfs/formats/2017/opcion_VIII/generated_pdf_opcion_8_2017.dart';
import 'package:titulacion_app/helpers/generatedPdfs/formats/2017/opcion_XI/generated_pdf_opcion_11_2017.dart';
import 'package:titulacion_app/helpers/generatedPdfs/interfaces/datos_solicitud.dart';
import 'package:titulacion_app/helpers/generatedPdfs/interfaces/pdf_generator.dart';
import 'package:titulacion_app/helpers/generatedPdfs/model/1993/opcion_V/solicitud_opcion_5_1993.dart';
import 'package:titulacion_app/helpers/generatedPdfs/model/1993/opcion_VI/solicitud_opcion_6_1993.dart';
import 'package:titulacion_app/helpers/generatedPdfs/model/1993/opcion_VIII/solicitud_opcion_8_1993.dart';
import 'package:titulacion_app/helpers/generatedPdfs/model/1993/opcion_X/solicitud_opcion_10_1993.dart';
import 'package:titulacion_app/helpers/generatedPdfs/model/1993/solicitud_general_1993.dart';
import 'package:titulacion_app/helpers/generatedPdfs/model/2004/opcion_VI/solicitud_opcion_6_2004.dart';
import 'package:titulacion_app/helpers/generatedPdfs/model/2004/opcion_VIII/solicitud_opcion_8_2004.dart';
import 'package:titulacion_app/helpers/generatedPdfs/model/2004/opcion_X/solicitud_opcion_10_2004.dart';
import 'package:titulacion_app/helpers/generatedPdfs/model/2004/solicitud_general_2004.dart';
import 'package:titulacion_app/helpers/generatedPdfs/model/2009/opcion_VI/solicitud_opcion_6_2009.dart';
import 'package:titulacion_app/helpers/generatedPdfs/model/2009/solicitud_general_2009.dart';
import 'package:titulacion_app/helpers/generatedPdfs/model/2017/opcion_XI/solicitud_opcion_11_2017.dart';
import 'package:titulacion_app/helpers/generatedPdfs/model/2017/solicitud_general_2017.dart';

class PdfGeneratorFactory {
  static PdfGenerator? getGenerator(String periodo, String formaTitulacion) {
    //2017
    if (periodo == '0fnQ3Hf9FN31yk2K26z9') {
      if (formaTitulacion ==
          'PROYECTO DE INVESTIGACIÓN Y/O DESARROLLO TECNOLÓGICO') {
        return GeneratedPdfOpcionII2017();
      } else if (formaTitulacion == 'RESIDENCIA PROFESIONAL') {
        return GeneratedPdfOpcionI2017();
      } else if (formaTitulacion == 'PROYECTO PRODUCTIVO') {
        return GeneratedPdfOpcionIV2017();
      } else if (formaTitulacion == 'PROYECTO DE INNOVACIÓN TECNOLÓGICA') {
        return GeneratedPdfOpcionV2017();
      } else if (formaTitulacion == 'ESTANCIA') {
        return GeneratedPdfOpcionVIII2017();
      }else if(formaTitulacion == 'EXAMEN GENERAL DE EGRESO DE LICENCIATURA (EGEL) DEL CENEVAL'){
        return GeneratedPdfOpcionXI2017();
      }
      return GeneratedPdf2017();
    }
    //1993
    if (periodo == 'pZFXszzOMgkzpgajIm7m') {
      if (formaTitulacion == 'CURSOS ESPECIALES DE TITULACIÓN') {
        return GeneratedPdfOpcionV1993();
      } else if (formaTitulacion ==
          'EXAMEN GLOBAL POR ÁREAS DEL CONOCIMIENTO') {
        return GeneratedPdfOpcionVI1993();
      } else if (formaTitulacion == 'ESCOLARIDAD POR PROMEDIO') {
        return GeneratedPdfOpcionVIII1993();
      } else if (formaTitulacion == 'MEMORIA DE RESIDENCIA PROFESIONAL') {
        return GeneratedPdfOpcionX1993();
      } else if (formaTitulacion == 'PROYECTO DE INVESTIGACIÓN') {
        return GeneratedPdfOpcionIII1993();
      } else {
        return GeneratedPdf1993();
      }
      //2004
    } else if (periodo == 'x3dCnRTIm2XMdohWgn8G') {
      if (formaTitulacion == 'EXAMEN POR ÁREAS DEL CONOCIMIENTO') {
        return GeneratedPdfOpcionVI2004();
      } else if (formaTitulacion == 'INFORME DE RESIDENCIA PROFESIONAL') {
        return GeneratedPdfOpcionX2004();
      } else if (formaTitulacion == 'ESCOLARIDAD POR PROMEDIO') {
        return GeneratedPdfOpcionVIII2004();
      } else if (formaTitulacion == 'PROYECTO DE INVESTIGACIÓN') {
        return GeneratedPdfOpcionIII2004();
      } else {
        return GeneratedPdf2004();
      }
    }
    //2009
    else if (periodo == 'uyfLRbd6PPWPWc6YvyLU') {
      if (formaTitulacion == 'INFORME TÉCNICO DE RESIDENCIA PROFESIONAL') {
        return GeneratedPdfOpcionI2009();
      } else if (formaTitulacion == 'PROYECTO DE INNOVACIÓN TECNOLÓGICA' ||
          formaTitulacion == 'PROYECTO DE INVESTIGACIÓN') {
        return GeneratedPdfOpcionII2009();
      } else if (formaTitulacion ==
          'EXAMEN GENERAL DE EGRESO DE LICENCIATURA (EGEL) DEL CENEVAL') {
        return GeneratedPdfOpcionVI2009();
      }
      return GeneratedPdf2009();
    }

    return null;
  }

  static DatosSolicitud? getDatosSolicitud(
      {required periodo,
      String? formaTitulacion,
      required Map<String, dynamic> data}) {
    //2017 ACTUAL
    if (periodo == '0fnQ3Hf9FN31yk2K26z9') {
      //20017

      if(formaTitulacion == 'EXAMEN GENERAL DE EGRESO DE LICENCIATURA (EGEL) DEL CENEVAL'){
           return SolicitudOpcionXI2017(
            user: data['user'],
            carrera: data['carrera'],
            telefono: data['telefono'],
            direccion: data['direccion'],
            areasExamen: data['areas de conocimiento'],
            metodoTitulacion: data['metodoTitulacion'],
            correo: data['correo']);
      }

      return SolicitudGeneral2017(
          user: data['user'],
          telefono: data['telefono'],
          direccion: data['direccion'],
          proyecto: data['proyecto'],
          carrera: data['carrera'],
          metodoTitulacion: data['metodoTitulacion'],
          correo: data['correo']);
    } else if (periodo == 'x3dCnRTIm2XMdohWgn8G') {
      //2004
      if (formaTitulacion == 'EXAMEN POR ÁREAS DEL CONOCIMIENTO') {
        return SolicitudOpcionVI2004(
            user: data['user'],
            carrera: data['carrera'],
            diaInicio: data['dia de inicio'],
            mesInicio: data['mes de inicio'],
            yearInicio: data['año de inicio'],
            diaCierre: data['dia de cierre'],
            mesCierre: data['mes de cierre'],
            yearCierre: data['año de cierre'],
            direccion: data['direccion'],
            telefono: data['telefono'],
            opcion: data['opcion'],
            metodoTitulacion: data['metodoTitulacion'],
            tema: data['tema'],
            areaConocimiento: data['area de conocimiento']);
      } else if (formaTitulacion == 'INFORME DE RESIDENCIA PROFESIONAL') {
        return SolicitudOpcionX2004(
            user: data['user'],
            carrera: data['carrera'],
            direccion: data['direccion'],
            telefono: data['telefono'],
            opcion: data['opcion'],
            metodoTitulacion: data['metodoTitulacion'],
            promedio: data['promedio'],
            tema: data['nombre del tema']);
      } else if (formaTitulacion == 'ESCOLARIDAD POR PROMEDIO') {
        return SolicitudOpcionVIII2004(
            user: data['user'],
            carrera: data['carrera'],
            direccion: data['direccion'],
            telefono: data['telefono'],
            opcion: data['opcion'],
            metodoTitulacion: data['metodoTitulacion'],
            promedio: data['promedio']);
      } else {
        return SolicitudGeneral2004(
            user: data['user'],
            carrera: data['carrera'],
            telefono: data['telefono'],
            direccion: data['direccion'],
            nombreTema: data['nombre del tema'],
            producto: data['metodoTitulacion'],
            opcion: data['opcion']);
      }
    } else if (periodo == 'pZFXszzOMgkzpgajIm7m') {
      //1993
      if (formaTitulacion == 'CURSOS ESPECIALES DE TITULACIÓN') {
        return SolicitudOpcionV1993(
            user: data['user'],
            carrera: data['carrera'],
            nombreCurso: data['nombre de curso'],
            docente: data['docente'],
            diaInicio: data['dia de inicio'],
            mesInicio: data['mes de inicio'],
            yearInicio: data['año de inicio'],
            diaCierre: data['dia de cierre'],
            mesCierre: data['mes de cierre'],
            yearCierre: data['año de cierre'],
            monografia: data['monografia'],
            direccion: data['direccion'],
            telefono: data['telefono'],
            opcion: data['opcion'],
            metodoTitulacion: data['metodoTitulacion']!);
      } else if (formaTitulacion ==
          'EXAMEN GLOBAL POR ÁREAS DEL CONOCIMIENTO') {
        return SolicitudOpcionVI1993(
            user: data['user'],
            carrera: data['carrera'],
            diaInicio: data['dia de inicio'],
            mesInicio: data['mes de inicio'],
            yearInicio: data['año de inicio'],
            diaCierre: data['dia de cierre'],
            mesCierre: data['mes de cierre'],
            yearCierre: data['año de cierre'],
            direccion: data['direccion'],
            telefono: data['telefono'],
            opcion: data['opcion'],
            metodoTitulacion: data['metodoTitulacion'],
            tema: data['tema'],
            areaConocimiento: data['area de conocimiento']);
      } else if (formaTitulacion == 'ESCOLARIDAD POR PROMEDIO') {
        return SolicitudOpcionVIII1993(
            user: data['user'],
            carrera: data['carrera'],
            direccion: data['direccion'],
            telefono: data['telefono'],
            opcion: data['opcion'],
            metodoTitulacion: data['metodoTitulacion'],
            promedio: data['promedio']);
      } else if (formaTitulacion == 'MEMORIA DE RESIDENCIA PROFESIONAL') {
        return SolicitudOpcionX1993(
            user: data['user'],
            carrera: data['carrera'],
            direccion: data['direccion'],
            telefono: data['telefono'],
            opcion: data['opcion'],
            metodoTitulacion: data['metodoTitulacion'],
            promedio: data['promedio'],
            tema: data['nombre del tema']);
      } else {
        return SolicitudGeneral1993(
            user: data['user'],
            carrera: data['carrera'],
            telefono: data['telefono'],
            direccion: data['direccion'],
            nombreTema: data['nombre del tema'],
            producto: data['metodoTitulacion'],
            opcion: data['opcion']);
      }
    } else if (periodo == 'uyfLRbd6PPWPWc6YvyLU') {
      //2009
      if (formaTitulacion ==
          'EXAMEN GENERAL DE EGRESO DE LICENCIATURA (EGEL) DEL CENEVAL') {
        return SolicitudOpcionVI2009(
            user: data['user'],
            carrera: data['carrera'],
            telefono: data['telefono'],
            direccion: data['direccion'],
            areasExamen: data['areas de conocimiento'],
            metodoTitulacion: data['metodoTitulacion'],
            correo: data['correo']);
      }
      return SolicitudGeneral2009(
          user: data['user'],
          carrera: data['carrera'],
          telefono: data['telefono'],
          direccion: data['direccion'],
          proyecto: data['proyecto'],
          metodoTitulacion: data['metodoTitulacion'],
          correo: data['correo']);
    }

    return null;
  }
}
