import 'package:flutter/material.dart';
import 'package:titulacion_app/presentation/screens/academico/menu/sidebar_academico.dart';

import 'package:titulacion_app/presentation/screens/division/widgets/nav_bar.dart';
import 'package:titulacion_app/providers/side_menu_provider.dart';

class AcademicoLayout extends StatefulWidget {
  final Widget child;

  const AcademicoLayout({super.key, required this.child});

  @override
  State<AcademicoLayout> createState() => _AcademicoLayoutState();
}

class _AcademicoLayoutState extends State<AcademicoLayout>
    with SingleTickerProviderStateMixin {
  @override
  void initState() {
    super.initState();

    SideMeuProvider.menuController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 200));
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffEDF1F2),
      body: _DashBoardDesktop(
        child: widget.child,
      ),
    );
  }
}

class _DashBoardDesktop extends StatelessWidget {
  final Widget child;

  const _DashBoardDesktop({
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Stack(
      children: [
        Row(
          children: [
            if (size.width >= 600) const SideBarAcademico(),
            Expanded(
                child: Column(
              children: [
                const NavBar(),
                Expanded(
                    child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  child: child,
                ))
              ],
            ))
          ],
        ),
        if (size.width < 600)
          AnimatedBuilder(
              animation: SideMeuProvider.menuController,
              builder: (context, __) => Stack(
                    children: [
                      if (SideMeuProvider.isOpen)
                        Opacity(
                          opacity: SideMeuProvider.opacity.value,
                          child: GestureDetector(
                            onTap: () => SideMeuProvider.closeMenu(),
                            child: Container(
                              width: size.width,
                              height: size.height,
                              color: Colors.black26,
                            ),
                          ),
                        ),
                      Transform.translate(
                        offset: Offset(SideMeuProvider.movement.value, 0),
                        child: const SideBarAcademico(),
                      )
                    ],
                  ))
      ],
    );
  }
}
