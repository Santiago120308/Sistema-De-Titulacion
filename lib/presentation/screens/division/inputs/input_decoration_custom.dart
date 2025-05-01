import 'package:flutter/material.dart';

class InputDecorationCustom {
   static InputDecoration searchInputDecoration({
    required String hint , 
    required IconData icon 
  }){
    return InputDecoration(
      border: InputBorder.none , 
      enabledBorder: InputBorder.none , 
      hintText: hint , 
      prefixIcon: Icon(icon , color: Colors.grey,) , 
      hintStyle: const TextStyle(color: Colors.grey) , 
      labelStyle: const TextStyle(color: Colors.grey)
    );
  }
}