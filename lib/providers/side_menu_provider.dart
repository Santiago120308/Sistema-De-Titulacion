import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

class SideMeuProvider extends ChangeNotifier{

  static late AnimationController menuController;
  static  bool isOpen = false;
  String _currentPage = "";

  String get currentPage{
    return _currentPage;
  }

void setCurrentPageUrl(String routeName) {
  if (_currentPage == routeName) return; // 🔹 Evita notificaciones innecesarias
  _currentPage = routeName;
     SchedulerBinding.instance.addPostFrameCallback((_) {
      notifyListeners();
    });
}

  static Animation<double> movement = Tween<double>(begin: -200 , end: 0)
          .animate(CurvedAnimation(parent: menuController, curve: Curves.easeInOut));

  static Animation<double> opacity = Tween<double>(begin: 0 , end: 1)
          .animate(CurvedAnimation(parent: menuController, curve: Curves.easeInOut));


  static void openMenu(){
    isOpen = true;
    menuController.forward();
  }     


  static void closeMenu(){
    isOpen = false;
    menuController.reverse();
  }   
  
}