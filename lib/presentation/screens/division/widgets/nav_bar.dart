import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:titulacion_app/presentation/screens/division/widgets/search_text.dart';
import 'package:titulacion_app/providers/carreras_provider.dart';
import 'package:titulacion_app/providers/side_menu_provider.dart';

class NavBar extends StatelessWidget {
  const NavBar({super.key});

  @override
  Widget build(BuildContext context) {
    final carrerasProvider = Provider.of<CarrerasProvider>(context);
    final size = MediaQuery.of(context).size;
  

    return Container(
      height: 50,
      width: double.infinity,
      decoration: builderBoxDecoration(),
      child: Row(
        children: [
          if (size.width < 600)
            IconButton(
                onPressed: () {
                  SideMeuProvider.openMenu();
                },
                icon: const Icon(Icons.menu_rounded)),

          if (size.width > 440)
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Row(
                  children: [
                    const Expanded(child: SearchText()),
                    const SizedBox(width: 20),
                    Expanded(
                      child: ConstrainedBox(
                        constraints: const BoxConstraints(maxHeight: 40),
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.grey.withOpacity(0.2),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: DropdownButton(
                              isExpanded: true,
                              value: carrerasProvider.isSelectedStatus,
                              underline: const SizedBox(),
                              dropdownColor: Colors.white,
                              borderRadius: BorderRadius.circular(5),
                              items: <String>[
                                'Todas',
                                'Revisadas',
                                'No Revisadas'
                              ].map((String value) {
                                return DropdownMenuItem<String>(
                                    value: value,
                                    child: Padding(
                                      padding:
                                          const EdgeInsets.only(left: 30.0),
                                      child: Text(value),
                                    ));
                              }).toList(),
                              onChanged: (String? value) {
                                // TODO: Aqui cambia el filtro
                                carrerasProvider.isSelectedStatus = value!;
                               
                                bool? mostrar = value == 'Todas'
                                    ? null
                                    : value == 'Revisadas'
                                        ? true
                                        : value == 'No Revisadas'
                                            ? false
                                            : null;
                               carrerasProvider.mostrarRevisadas = mostrar;
                                carrerasProvider.filtrarSolicitudes();
                              }),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),


        ],
      ),
    );
  }

  BoxDecoration builderBoxDecoration() => const BoxDecoration(
      color: Colors.white,
      boxShadow: [BoxShadow(color: Colors.black26, blurRadius: 10)]);
}
