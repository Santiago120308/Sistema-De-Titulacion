import 'package:flutter/material.dart';

class RegisterProvider extends ChangeNotifier {

  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  String nombre = "";
  String apellidos = "";
  String numeroControl = ""; 
  String carreraId = "";
  String correo = "";
  String password = "";
  String passwordConfirm = "";

  String? passedValid() => formKey.currentState!.validate() ? null : '';
  

}
