import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:titulacion_app/presentation/screens/division/widgets/logo.dart';
import 'package:titulacion_app/presentation/screens/division/widgets/menu_item.dart';
import 'package:titulacion_app/presentation/screens/division/widgets/text_separator.dart';
import 'package:titulacion_app/providers/carreras_provider.dart';
import 'package:titulacion_app/providers/side_menu_provider.dart';
import 'package:titulacion_app/routes/app_router.dart';
import 'package:titulacion_app/services/navigation_service_go.dart';

class SideBarAcademico extends StatelessWidget {
  const SideBarAcademico({super.key});

  @override
  Widget build(BuildContext context) {
    final sideMenuProvider =
        Provider.of<SideMeuProvider>(context);
    final carrerasProvider = Provider.of<CarrerasProvider>(context);

    return Container(
      width: 200,
      height: double.infinity,
      decoration: customBoxDecoration(),
      child: ListView(
        physics: const ClampingScrollPhysics(),
        children: [
          const Logo(),
          const SizedBox(height: 50),
          const TextSeparator(text: "ACADEMICO HOME"),
          MenuItem(
              text: 'HOME',
              isActive: sideMenuProvider.currentPage == AppRouter.academico,
              onPressed: () {
                NavigationServiceGo.navigateTo(context, AppRouter.academico);
              }),
          const TextSeparator(text: "CARRERAS"),
          ...carrerasProvider.carreras.map((carrera) {
            return MenuItem(
                text: carrera['nombre'],
                isActive:
                    sideMenuProvider.currentPage.split('/')[2] == carrera['id'],
                onPressed: () async {
                  await carrerasProvider.cargarSolicitudesAcademicas(carrera['id']);
                  if(context.mounted){
                    NavigationServiceGo.navigateTo(
                      context, '/academico/${carrera['id']}');
                  }
                });
          }),
        ],
      ),
    );
  }

  BoxDecoration customBoxDecoration() => const BoxDecoration(
      gradient: LinearGradient(colors: [Color(0xFF0F4295), Color(0xFF0F4295)]),
      boxShadow: [BoxShadow(color: Colors.black26, blurRadius: 10)]);

  //void navigateAndCloseMenu(String routeName){
  //  NavigationService.navigateTo(routeName);
  //  SideMeuProvider.closeMenu();
  //}
}
