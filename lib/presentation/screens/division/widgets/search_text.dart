import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:titulacion_app/presentation/screens/division/inputs/input_decoration_custom.dart';
import 'package:titulacion_app/providers/carreras_provider.dart';

class SearchText extends StatelessWidget {
  const SearchText({super.key});

  @override
  Widget build(BuildContext context) {
    
    final carrerasProvider = Provider.of<CarrerasProvider>(context);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: SizedBox(
          child: Container(
        width: double.infinity,
        height: 40,
        decoration: buildBoxDecoration(),
        child: TextField(
          onChanged: (value) {
            carrerasProvider.filtrarSolicitudes(termino: value);
          
          },
          //controller: text,
          
          decoration: InputDecorationCustom.searchInputDecoration(
              hint: "Buscar", icon: Icons.search_outlined),
        ),
      )),
    );
  }

  BoxDecoration buildBoxDecoration() => BoxDecoration(
      color: Colors.grey.withOpacity(0.2),
      borderRadius: BorderRadius.circular(10));
}
