import 'package:flutter/material.dart';

class DatosPdfProvider extends ChangeNotifier {
  String? _formaTitulacion;
  String? _periodo;
  Map<String, dynamic>? _datosFormulario = {};

  //getter
  String? get formaTitulacion => _formaTitulacion;
  Map<String, dynamic>? get datosFormulario => _datosFormulario;
  String? get periodo => _periodo;

  void actualizarValor(String llave, String valor) {
    _datosFormulario?[llave] = valor;
    notifyListeners();
  }

  void actualizarPeriodo(String periodo) {
    _periodo = periodo;
    _formaTitulacion = null;
    _datosFormulario = {};
    notifyListeners();
  }

  void actualizarFormaTitulacion(String formaTitulacion) {
    if (periodo == null) return;

    _formaTitulacion = formaTitulacion;
    _datosFormulario = {};
    _datosFormulario = obtenerCamposPorForma(formaTitulacion, _periodo!);
    notifyListeners();
  }

  void limpiarDatos() {
    _formaTitulacion = null;
    _periodo = null;
    _datosFormulario = {};
  }

  Map<String, dynamic> obtenerCamposPorForma(
      String formaTitulacion, String periodo) {
    switch (periodo) {
      //1993
      case 'pZFXszzOMgkzpgajIm7m':
        {
          if (formaTitulacion == 'CURSOS ESPECIALES DE TITULACIÓN') {
            return {
              "nombre de curso": "",
              "docente": "",
              "dia de inicio": "",
              "mes de inicio": "",
              "año de inicio": "",
              "dia de cierre": "",
              "mes de cierre": "",
              "año de cierre": "",
              "monografia": "",
              "direccion": "",
              "telefono": "",
            };
          } else if (formaTitulacion ==
              'EXAMEN GLOBAL POR ÁREAS DEL CONOCIMIENTO') {
            return {
              "dia de inicio": "",
              "mes de inicio": "",
              "año de inicio": "",
              "dia de cierre": "",
              "mes de cierre": "",
              "año de cierre": "",
              "area de conocimiento": "",
              "tema": "",
              "direccion": "",
              "telefono": "",
            };
          } else if (formaTitulacion == 'ESCOLARIDAD POR PROMEDIO') {
            return {
              "promedio": "",
              "direccion": "",
              "telefono": "",
            };
          } else if (formaTitulacion == 'MEMORIA DE RESIDENCIA PROFESIONAL') {
            return {
              "promedio": "",
              "nombre del tema": "",
              "direccion": "",
              "telefono": "",
            };
          } else {
            return {"nombre del tema": "", "direccion": "", "telefono": ""};
          }
        }
      //2004
      case 'x3dCnRTIm2XMdohWgn8G':
        {
          if (formaTitulacion == 'INFORME DE RESIDENCIA PROFESIONAL') {
            return {
              "promedio": "",
              "nombre del tema": "",
              "direccion": "",
              "telefono": "",
            };
          } else if (formaTitulacion == 'ESCOLARIDAD POR PROMEDIO') {
            return {
              "promedio": "",
              "direccion": "",
              "telefono": "",
            };
          } else if (formaTitulacion == 'ESCOLARIDAD POR PROMEDIO') {
            return {
              "promedio": "",
              "direccion": "",
              "telefono": "",
            };
          } else if (formaTitulacion == 'EXAMEN POR ÁREAS DEL CONOCIMIENTO') {
            return {
              "dia de inicio": "",
              "mes de inicio": "",
              "año de inicio": "",
              "dia de cierre": "",
              "mes de cierre": "",
              "año de cierre": "",
              "area de conocimiento": "",
              "tema": "",
              "direccion": "",
              "telefono": "",
            };
          } else {
            return {"nombre del tema": "", "direccion": "", "telefono": ""};
          }
        }

      //2017 ACTUAL
      case '0fnQ3Hf9FN31yk2K26z9':
        {
          if (formaTitulacion ==
              'EXAMEN GENERAL DE EGRESO DE LICENCIATURA (EGEL) DEL CENEVAL') {
            return {
              "areas de conocimiento": "",
              "direccion": "",
              "telefono": "",
              "correo": ""
            };
          }
          return {
            "proyecto": "",
            "direccion": "",
            "telefono": "",
            "correo": ""
          };
        }

      //2009
      case 'uyfLRbd6PPWPWc6YvyLU':
        {
          if (formaTitulacion ==
              'EXAMEN GENERAL DE EGRESO DE LICENCIATURA (EGEL) DEL CENEVAL') {
            return {
              "areas de conocimiento": "",
              "direccion": "",
              "telefono": "",
              "correo": ""
            };
          } else {
            return {
              "proyecto": "",
              "direccion": "",
              "telefono": "",
              "correo": ""
            };
          }
        }

      default:
        return {};
    }
  }
}
