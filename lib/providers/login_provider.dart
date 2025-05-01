import 'package:flutter/material.dart';

class LoginProvider extends ChangeNotifier {

  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  String correo = "";
  String password = "";


  String? passedValid() => formKey.currentState!.validate() ? null : '';
  

}
