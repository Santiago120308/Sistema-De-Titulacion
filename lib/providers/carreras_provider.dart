import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

class CarrerasProvider extends ChangeNotifier {
  List<Map<String, dynamic>> _carreras = [];
  List<Map<String, dynamic>> _solicitudes = [];
  List<Map<String, dynamic>> _solicitudesAcademicas = [];
  List<Map<String, dynamic>> solicitudesFiltradas = [];
  List<Map<String, dynamic>> solicitudesFiltradasAcademicas = [];
  String? _carreraSeleccionada;

  List<Map<String, dynamic>> get carreras => _carreras;
  List<Map<String, dynamic>> get solicitudes => _solicitudes;
  List<Map<String, dynamic>> get solicitudesAcademicas =>
      _solicitudesAcademicas;
  String? get carreraSeleccionada => _carreraSeleccionada;

  bool? mostrarRevisadas;
  String terminoBusqueda = '';
  String isSelectedStatus = 'Todas';

  CarrerasProvider() {
    cargarCarreras();
  }

  Future<void> cargarCarreras() async {
    final snapshot =
        await FirebaseFirestore.instance.collection('Carreras').get();
    _carreras = snapshot.docs
        .map((doc) => {'id': doc.id, 'nombre': doc['nombre']})
        .toList();
    notifyListeners();
  }

  Future<void> cargarSolicitudes(String idCarrera) async {
    final snapshot = await FirebaseFirestore.instance
        .collection('Carreras')
        .doc(idCarrera)
        .collection('solicitudes')
        .get();

    _solicitudes = await Future.wait(snapshot.docs.map((doc) async {
      final d = await FirebaseFirestore.instance
          .collection('usuarios')
          .doc(doc['usuarioId'])
          .get();

      return {
        'id': doc.id,
        'usuario': d.data() ?? {}, // Asegurar que no sea null
        'pdf': doc['pdfUrl'],
        'fecha': doc['fecha'],
        'revisada': doc['revisada']
      };
    }));

    solicitudesFiltradas = _solicitudes;

    notifyListeners(); // Si estás usando Provider, notificar cambios
  }

  Future<void> cargarSolicitudesAcademicas(String idCarrera) async {
    final snapshot = await FirebaseFirestore.instance
        .collection('Carreras')
        .doc(idCarrera)
        .collection('solicitudes')
        .where('revisada', isEqualTo: true)
        .get();

    _solicitudesAcademicas = await Future.wait(snapshot.docs.map((doc) async {
      final d = await FirebaseFirestore.instance
          .collection('usuarios')
          .doc(doc['usuarioId'])
          .get();

      return {
        'id': doc.id,
        'usuario': d.data() ?? {}, // Asegurar que no sea null
        'pdf': doc['pdfUrl'],
        'fecha': doc['fecha'],
        'revisionAcademica': doc['revisionAcademica']
      };
    }));

    solicitudesFiltradasAcademicas = _solicitudesAcademicas;

    notifyListeners(); // Si estás usando Provider, notificar cambios
  }

  void filtrarSolicitudes({String? termino}) {
    terminoBusqueda = termino ?? '';

    solicitudesFiltradas = _solicitudes.where((soli) {
      bool coincidenciaRevision =
          (mostrarRevisadas == null) || (mostrarRevisadas == soli['revisada']);
      final nombre = '${soli['usuario']['nombre']}'.trim().toLowerCase();
      final numControl =
          '${soli['usuario']['num_control']}'.trim().toLowerCase();
      final term = terminoBusqueda.trim().toLowerCase();
      bool coincidenciaTermino =
          nombre.contains(term) || numControl.contains(term);
      return coincidenciaRevision && coincidenciaTermino;
    }).toList();

    SchedulerBinding.instance.addPostFrameCallback((_) {
      notifyListeners();
    });
  }

  void modificarStatusDeSolicitud(
      {required String solicitudId,
      required String carreraId,
      required bool valor}) async {
    final solicitudRef = FirebaseFirestore.instance
        .collection('Carreras')
        .doc(carreraId)
        .collection('solicitudes')
        .doc(solicitudId);

    final solicitud = await solicitudRef.get();

    if (!solicitud.exists) {
      return;
    }

    await solicitudRef.update({
      'revisada': valor,
    });

    await cargarSolicitudes(carreraId);

    notifyListeners();
  }

    void modificarStatusDeSolicitudAcademica(
      {required String solicitudId,
      required String carreraId,
      required bool valor}) async {
    final solicitudRef = FirebaseFirestore.instance
        .collection('Carreras')
        .doc(carreraId)
        .collection('solicitudes')
        .doc(solicitudId);

    final solicitud = await solicitudRef.get();

    if (!solicitud.exists) {
      return;
    }

    await solicitudRef.update({
      'revisionAcademica': valor,
    });

    await cargarSolicitudesAcademicas(carreraId);

    notifyListeners();
  }

  Future<Map<String, dynamic>?> obtenerCarreraPorId(String carreraId) async {
    try {
      DocumentSnapshot doc = await FirebaseFirestore.instance
          .collection('Carreras')
          .doc(carreraId)
          .get();
      if (doc.exists) {
        return {'id': doc.id, ...doc.data() as Map<String, dynamic>};
      }
    } catch (e) {
      print("Error al obtener la carrera: $e");
    }
    return null; // Retorna null si no se encuentra la carrera
  }

  Future<void> cargarSolicitud(String carreraId, String usuarioId,
      String pdfUrl, BuildContext context) async {
    // Guardar referencia en Firestore
    await FirebaseFirestore.instance
        .collection('Carreras')
        .doc(carreraId)
        .collection('solicitudes')
        .add({
      'usuarioId': usuarioId,
      'fecha': FieldValue.serverTimestamp(),
      'pdfUrl': pdfUrl,
      'revisada': false , 
      'revisionAcademica' : false
    });

    if (context.mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
            backgroundColor: Color.fromARGB(255, 15, 66, 149),
            content: Text(
              'Solicitud Cargada Correctamente',
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            )),
      );
    }

    notifyListeners();
  }

  void seleccionarCarrera(String? carreraId) {
    _carreraSeleccionada = carreraId;
    notifyListeners();
  }
}
