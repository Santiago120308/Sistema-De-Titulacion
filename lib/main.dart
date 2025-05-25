
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:provider/provider.dart';
import 'package:titulacion_app/firebase_options.dart';
import 'package:titulacion_app/helpers/generatedPdfs/provider/datos_pdf_provider.dart';
import 'package:titulacion_app/helpers/generatedPdfs/provider/solicitud_provider.dart';
import 'package:titulacion_app/providers/auth/auth_provider.dart';
import 'package:titulacion_app/providers/carreras_provider.dart';
import 'package:titulacion_app/providers/login_provider.dart';
import 'package:titulacion_app/providers/pdf_provider.dart';
import 'package:titulacion_app/providers/periodos_providers.dart';
import 'package:titulacion_app/providers/register_provider.dart';
import 'package:titulacion_app/providers/reporte_academico_provider.dart';
import 'package:titulacion_app/providers/side_menu_provider.dart';
import 'package:titulacion_app/routes/app_router.dart';

void main() async {
  await dotenv.load();
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(

    options: DefaultFirebaseOptions.currentPlatform,

);
  runApp(const AppState());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {


    return MaterialApp.router(
       routerConfig: AppRouter.router,  
      debugShowCheckedModeBanner: false,
    );
  }
}

class AppState extends StatelessWidget {
  const AppState({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => RegisterProvider()),
        ChangeNotifierProvider(create: (_) => LoginProvider()),
        ChangeNotifierProvider(create: (_) => CarrerasProvider()),
        ChangeNotifierProvider(create: (_) => AuthService()),
        ChangeNotifierProvider(create: (_) => PeriodosProvider()) ,
        ChangeNotifierProvider(create: (_) => PdfProvider()) , 
        ChangeNotifierProvider(create: (_) => DatosPdfProvider()) ,
        ChangeNotifierProvider(create: (_) => SideMeuProvider() ) ,
        ChangeNotifierProvider(create: (_) => SolicitudProvider()) , 
        ChangeNotifierProvider(create: (_) => ReporteAcademicoProvider())
      ],
      child: const MyApp(),
    );
  }
}
