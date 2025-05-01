import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class NavigationServiceGo {
  static void navigateTo(BuildContext context, String name) {
    // return context.pushNamedAndRemoveUntil(name, (route) => false);
    // Navigator.of(context).popUntil((route) => false);
    context.go(name);
  }

  static void popAndPushTo(BuildContext context, String route) {
      // Esto elimina todas las rutas previas
      Future.delayed(Duration.zero , (){
       if(context.mounted){
         context.go(route);
       }
      });
 // Ahora navegas a la nueva ruta
  }
}
