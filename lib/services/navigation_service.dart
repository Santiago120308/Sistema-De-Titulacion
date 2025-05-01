import 'package:flutter/material.dart';


class NavigationService {

  static final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  

  static navigateTo(String name) {
    if (navigatorKey.currentContext != null) {
     return navigatorKey.currentState!.pushNamedAndRemoveUntil(name, (route) => false);
    }
  }

  static popAndPushTo(String name) {
    return navigatorKey.currentState!.popAndPushNamed(name);
  }
  
}
