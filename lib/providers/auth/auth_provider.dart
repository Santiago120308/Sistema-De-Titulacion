import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

enum Auth { pending, autenticated, noAuth }

class AuthService extends ChangeNotifier {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  //List<String> mensajesDelUsuario = [];

  User? _user;
  String? _role;
  String? _nombre;

  User? get user => _user;
  String? get role => _role;
  String? get nombre => _nombre;

  Auth autenticando = Auth.pending;
  String mensaje = "";
  bool mensajeVacio = false;

  AuthService() {
    _auth.authStateChanges().listen((user) async {
      if (user != null) {
        _user = user;
        await _loadUserRole(user.uid);
        autenticando = Auth.autenticated; // Cambia el estado
      } else {
        _user = null;
        _role = null;
        autenticando = Auth.noAuth;
      }

      notifyListeners(); // Asegúrate de llamar notifyListeners solo una vez
    });
  }

  Future<void> _loadUserRole(String uid) async {
    var userDoc = await _db.collection('usuarios').doc(uid).get();
    _role = userDoc.data()?['rol'] ?? 'user'; // Por defecto 'user'
    _nombre = userDoc.data()?['nombre'] ?? '';
  }

  Future<Map<String, dynamic>?> getUserInfoById(String uid) async {
    try {
      DocumentSnapshot userDoc =
          await _db.collection('usuarios').doc(uid).get();

      if (userDoc.exists) {
        // Devuelve toda la información del usuario como un mapa
        return userDoc.data() as Map<String, dynamic>?;
      } else {
        return null; // Si no existe el documento, retorna null
      }
    } catch (e) {
      return null;
    }
  }

  Future<String?> login(
    String email,
    String password,
    BuildContext context,
  ) async {
    try {
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      if (userCredential.user != null) {
        _user = userCredential.user;

        String uid = _user!.uid;

        // Obtén el documento del usuario desde Firestore
        DocumentSnapshot userDoc = await FirebaseFirestore.instance
            .collection('usuarios')
            .doc(uid)
            .get();

        // Verifica si el documento existe
        if (userDoc.exists) {
          // Accede al rol del usuario
          String rol =
              userDoc['rol']; // Si no tiene rol, se asigna 'user' por defecto
          String nombre = userDoc['nombre'];
          _role = rol;
          _nombre = nombre;
        } else {
          return '';
        }

        return null;
      }

      return '';
    } on FirebaseAuthException catch (e) {
      String errorMessage = 'Error desconocido';

      if (e.code == 'invalid-credential') {
        errorMessage = 'Credenciales invalidas!';
      }

      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
              backgroundColor: Colors.red,
              content: Text(
                errorMessage,
                style: const TextStyle(
                    color: Colors.white, fontWeight: FontWeight.bold),
              )),
        );
      }
    }

    return "";
  }

  Future<String?> register(
      BuildContext context,
      String email,
      String password,
      String name,
      String carreraId,
      String apellidos,
      String numControl) async {
    try {
      UserCredential userCredential = await _auth
          .createUserWithEmailAndPassword(email: email, password: password);

      String uid = userCredential.user!.uid;
      await _db.collection('usuarios').doc(uid).set({
        'uid': uid,
        'nombre': name,
        'correo': email,
        'carreraId': carreraId,
        'apellidos': apellidos,
        'num_control': numControl,
        'rol': 'user', // Rol por defecto
      });

      return null;
    } on FirebaseAuthException catch (e) {
      String errorMessage = 'Error desconocido';

      if (e.code == 'email-already-in-use') {
        errorMessage = 'Este correo ya está registrado. Intente con otro.';
      }

      if (e.code == 'weak-password') {
        errorMessage = 'La contraseña debe de tener minimo 6 caracteres.';
      }

      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
              backgroundColor: Colors.red,
              content: Text(
                errorMessage,
                style: const TextStyle(
                    color: Colors.white, fontWeight: FontWeight.bold),
              )),
        );
      }
    }
    return "";
  }

  Future<void> sendMessage(
      Map<String, dynamic> soli, BuildContext context , String departamento) async {
    try {
      if (mensaje.isNotEmpty) {
        await FirebaseFirestore.instance
            .collection('usuarios')
            .doc(soli['usuario']['uid'])
            .update({
          departamento: FieldValue.arrayUnion([mensaje])
        });
      }

      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
              backgroundColor: Colors.blue,
              content: Text(
                "Mensaje enviado correctamente",
                style:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              )),
        );
      }

      mensaje = "";

      notifyListeners();
    } catch (exeption) {
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
              backgroundColor: Colors.red,
              content: Text(
                "Hubo un problema al enviar el mensaje",
                style:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              )),
        );
      }
    }
  }

  void setearMensajeVacio(bool vacio) {
    mensajeVacio = vacio;
    notifyListeners();
  }

  Future<List<String>> obtenerMensajes(String departamento) async {
  if (user?.uid == null) {
    return [];
  }

  final doc = await FirebaseFirestore.instance
      .collection('usuarios')
      .doc(user!.uid)
      .get();

  final data = doc.data();
  if (data == null) return [];

  String? campoMensajes;

  switch (departamento) {
    case "Mensajes de División":
      campoMensajes = 'mensajesDivision';
      break;
    case "Mensajes Académicos":
      campoMensajes = 'mensajesAcademicos';
      break;
    case "Mensajes Escolares":
      campoMensajes = 'mensajesEscolares';
      break;
    default:
      return [];
  }

  if (campoMensajes != null && data.containsKey(campoMensajes)) {
    List<dynamic> mensajesDynamic = data[campoMensajes];
    List<String> mensajes = mensajesDynamic.cast<String>();
    return mensajes;
  } else {
    return [];
  }
}

  Future<void> almacenarDatosDeTitulacion(String idUsuario , String formaTitulacion , String nombreProyecto) async {
    await FirebaseFirestore.instance
  .collection('usuarios')
  .doc(idUsuario) // aquí pones el ID del usuario
  .update({
    'formaTitulacion': formaTitulacion,
    'nombreProyecto': nombreProyecto,
  });

  }

  Future<void> logout() async {
    autenticando = Auth.pending;
    await _auth.signOut();
    _user = null;
    _role = "";
    _nombre = "";
    autenticando = Auth.noAuth;
    notifyListeners();
  }
}
