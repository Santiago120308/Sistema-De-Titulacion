// Gradient
import 'package:flutter/material.dart';

Gradient gradientCircular() {
  return RadialGradient(
    center: Alignment.center, // Centro del gradiente
    radius: 1.3, // Ajuste para que el gradiente no sea tan grande
    colors: [
      const Color.fromARGB(255, 15, 66, 149), // Azul
      const Color.fromARGB(255, 15, 66, 149).withOpacity(0.5), // Azul suave
      const Color.fromARGB(255, 255, 255, 255), // Blanco
    ],
    stops: const [0.23, 1.0, 1.0], // Transición suave
  );
}

// Widget para el borde de los contenedores
BoxDecoration borderRadius(Gradient? gradient, Color color, Radius topLeft,
    Radius bottomLeft, Radius topRight, Radius bottomRight) {
  return BoxDecoration(
    gradient: gradient,
    color: color,
    borderRadius: BorderRadius.only(
      topLeft: topLeft,
      bottomLeft: bottomLeft,
      topRight: topRight,
      bottomRight: bottomRight,
    ),
  );
}
