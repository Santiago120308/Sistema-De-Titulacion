import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:titulacion_app/providers/auth/auth_provider.dart';

Future<Object?> mostrarDialogoDeMensajes(BuildContext context) async {
  return showGeneralDialog(
    context: context,
    barrierDismissible: true,
    barrierLabel: MaterialLocalizations.of(context).modalBarrierDismissLabel,
    barrierColor: Colors.black.withOpacity(0.5),
    transitionDuration: const Duration(milliseconds: 300),
    pageBuilder: (context, animation, secondaryAnimation) {
      return const _DialogoMensajes();
    },
    transitionBuilder: (context, animation, secondaryAnimation, child) {
      return FadeTransition(
        opacity: animation,
        child: ScaleTransition(
          scale: CurvedAnimation(
            parent: animation,
            curve: Curves.easeOutBack,
          ),
          child: child,
        ),
      );
    },
  );
}

class _DialogoMensajes extends StatefulWidget {
  const _DialogoMensajes({Key? key}) : super(key: key);

  @override
  State<_DialogoMensajes> createState() => _DialogoMensajesState();
}

class _DialogoMensajesState extends State<_DialogoMensajes> {
  final PageController _pageController = PageController();
  int _paginaActual = 0;

  final List<String> departamentos = [
    'Mensajes de División',
    'Mensajes Académicos',
    'Mensajes Escolares',
  ];

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Material(
        color: Colors.transparent,
        child: AlertDialog(
          contentPadding: EdgeInsets.zero,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(
                width: 500,
                height: 350,
                child: PageView.builder(
                  controller: _pageController,
                  itemCount: departamentos.length,
                  onPageChanged: (index) {
                    setState(() {
                      _paginaActual = index;
                    });
                  },
                  itemBuilder: (context, index) {
                    return _MensajesDepartamento(title: departamentos[index]);
                  },
                ),
              ),
              const SizedBox(height: 10),
              _buildIndicadores(),
              const SizedBox(height: 10),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('Cerrar'),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildIndicadores() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(departamentos.length, (index) {
        return InkWell(
          onTap: () {
            _pageController.jumpToPage(index);  // Cambiar página cuando se haga click en un indicador
          },
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            margin: const EdgeInsets.symmetric(horizontal: 5),
            width: _paginaActual == index ? 12 : 8,
            height: _paginaActual == index ? 12 : 8,
            decoration: BoxDecoration(
              color: _paginaActual == index ? Colors.blueAccent : Colors.grey,
              shape: BoxShape.circle,
            ),
          ),
        );
      }),
    );
  }
}

class _MensajesDepartamento extends StatelessWidget {
  final String title;

  const _MensajesDepartamento({required this.title});

  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthService>(context, listen: false);

    return FutureBuilder<List<String>>(
      future: authProvider.obtenerMensajes(title),  // Aquí esperamos el Future
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());  // Mientras carga
        } else if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));  // Si hay error
        } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return const Center(child: Text('No hay mensajes disponibles'));
        } else {
          final mensajes = snapshot.data!;
          return Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(10),
                child: Text(
                  title,
                  textAlign: TextAlign.center,
                  style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: mensajes.length,
                  itemBuilder: (context, index) {
                    final mensaje = mensajes[index];
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                      child: Text(mensaje),
                    );
                  },
                ),
              ),
            ],
          );
        }
      },
    );
  }
}