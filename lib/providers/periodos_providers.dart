import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class PeriodosProvider extends ChangeNotifier {
  List<Map<String, dynamic>> _periodos = [];
  List<Map<String, dynamic>> _titulaciones = [];
  String? _periodoSeleccionado;
  String? _titulacionSeleccionada;
  String? _periodo;
  String? _idTitulacionSeleccionada;
  final db = FirebaseFirestore.instance;

  //getter
  List<Map<String, dynamic>> get periodos => _periodos;
  List<Map<String, dynamic>> get titulaciones => _titulaciones;
  String? get periodoSeleccionado => _periodoSeleccionado;
  String? get titulacionSeleccionada => _titulacionSeleccionada;
  String? get periodo => _periodo;
  String? get idTitulacionSeleccionada => _idTitulacionSeleccionada;

  PeriodosProvider() {
    cargarPeriodos();
  }

  Future<void> cargarPeriodos() async {
    final snapshot = await FirebaseFirestore.instance.collection('periodos').get();
    _periodos = snapshot.docs.map((doc) => {'id': doc.id, 'nombre': doc['nombre']}).toList();
    notifyListeners();
  }

  void limpiarTitulaciones(){
    _titulaciones = [];
  }

   Future<void> cargarMetodosTitulacion(String idPeriodo) async {
    _periodo = idPeriodo;
    _titulacionSeleccionada = null;
    //metodos de titulacion
    final snapshot = await FirebaseFirestore.instance.collection('periodos').doc(idPeriodo).collection('titulaciones').get();
    //asiganamos las titulaciones
    _titulaciones = snapshot.docs.map((doc) => {'id': doc.id, 'nombre': doc['nombre']}).toList();
    notifyListeners();
  }

  Future<String?> obtenerNumeroDeOpcion() async {

    if(_idTitulacionSeleccionada != null && _periodoSeleccionado != null){
      final snapshot = await FirebaseFirestore.instance.collection('periodos').doc(_periodoSeleccionado).collection('titulaciones').doc(_idTitulacionSeleccionada).get();
      if(snapshot.data() != null){
        Map<String , dynamic> data = snapshot.data() as Map<String , dynamic>; 
        return data['opcion'];
      }
    }
    return null;
  }

  void seleccionarTitulacionId(String? nombre) async {
    
    final periodos = FirebaseFirestore.instance.collection('periodos').doc(_periodoSeleccionado).collection('titulaciones');
    QuerySnapshot query = await periodos.where('nombre', isEqualTo: nombre).get();

    if (query.docs.isNotEmpty) {
    var primerDocumento = query.docs.first;  // Obtiene el primer documento
    _idTitulacionSeleccionada = primerDocumento.id;
    }

  }

   void seleccionarTitulacion(String? titulacionId) {
    _titulacionSeleccionada = titulacionId;
    notifyListeners();
  }

  void seleccionarPeriodo(String? periodoId) {
    _periodoSeleccionado = periodoId;
    notifyListeners();
  }

}
