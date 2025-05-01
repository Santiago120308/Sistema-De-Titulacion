import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

//Widget textField(
//    String hintText, bool obscureText, TextEditingController controller) {
//  return SizedBox(
//    height: 45,
//    child: TextFormField(
//      controller: controller,
//      decoration: builderInputDecoration(hintText),
//      style: const TextStyle(
//        fontSize: 14,
//      ),
//      obscureText: obscureText,
//    ),
//  );
//}

InputDecoration builderInputDecoration(String hintText) {
  return InputDecoration(
        hintText: hintText, // Texto que aparece cuando el campo está vacío
        filled: true, // Habilita el color de fondo
        fillColor: const Color.fromARGB(255, 223, 223, 223), // Color de fondo
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(25),
          borderSide: const BorderSide(color: Colors.transparent),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(25),
          borderSide: const BorderSide(color: Colors.transparent),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(25),
          borderSide: const BorderSide(color: Colors.transparent),
        ),
        contentPadding:
            const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        // Estilo para el placeholder
        hintStyle: const TextStyle(
          fontSize: 14,
          color: Color.fromARGB(255, 151, 151, 151),
        ));
}

Widget labelField(String label, double fontSize, FontWeight fontWeight,
    Color color, double paddingTop, double paddingBottom) {
  return Column(
    children: [
      SizedBox(height: paddingTop),
      Text(
        label,
        style: GoogleFonts.poppins(
            fontSize: fontSize, color: color, fontWeight: fontWeight),
      ),
      SizedBox(height: paddingBottom)
    ],
  );
}
