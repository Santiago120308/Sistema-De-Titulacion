import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:titulacion_app/presentation/screens/authentication/home_screen.dart';
import 'package:titulacion_app/presentation/screens/division/layout/division_layout.dart';
import 'package:titulacion_app/presentation/screens/division/screens/carrera_screen.dart';
import 'package:titulacion_app/presentation/screens/division/screens/division_home_screen.dart';
import 'package:titulacion_app/presentation/screens/division/screens/view_pdf_screen.dart';
import 'package:titulacion_app/presentation/screens/student/student_home_screen.dart';
import 'package:titulacion_app/presentation/shared/circular_indicator.dart';
import 'package:titulacion_app/providers/auth/auth_provider.dart';
import 'package:titulacion_app/providers/side_menu_provider.dart';
import 'package:universal_html/html.dart' as html;

class AppRouter {
  static String login = '/auth/login';
  static String register = '/auth/register';
  static String student = '/estudiante';
  static String division = '/division/home';
  static String viewPdf = '/pdf/:numControl';
  static String divisionSistemas = '/division/FXESCxt380McLVO26q7X';
  static String divisionQuimica = '/division/5mBkhCCQeQ01NKDYIkTA';
  static String divisionCivil = '/division/64r8PR5l9p0QEBTbDiKL';
  static String divisionBioquimica = '/division/gJvLwBN9pSAK3L2lznVc';
  static String divisionAdministracion = '/division/jMlqaZKMQGQHr7OSZ6AC';
  static String divisionGestion = '/division/t0xGE34CllxtybEDsqRZ';
  static String divisionIndustrial = '/division/pHIfGQrP13mAAtBeFyDM';
  static String divisionElectro = '/division/lXyWc0EhCqk9DUXz3zwn';
  static String divisionTurismo = '/division/QTWOpGT1ar7qIhMkDTii';

  // Define la instancia de GoRouter
  static final GoRouter router = GoRouter(
    routerNeglect: true,
    initialLocation: _getInitialRoute(), // Define la ruta inicial
    routes: [
      // Ruta principal (root)
      GoRoute(
        path: '/',
        builder: (context, state) {
          saveRouteInSessionStorage('/');
          final authService = Provider.of<AuthService>(context);
          if (authService.autenticando == Auth.pending) {
            return const CircularIndicator();
          }

          return const HomeScreen();
        },
      ),

      // Rutas de autenticación (login/register)
      //  GoRoute(
      //    path: login,
      //    builder: (context, state) => const HomeScreen(),
      //  ),
      //  GoRoute(
      //    path: register,
      //    builder: (context, state) => const HomeScreen(),
      //  ),

      // Rutas de estudiante

      GoRoute(
        path: student,
        builder: (context, state) {
          final authService = Provider.of<AuthService>(context);

          if (authService.autenticando == Auth.pending) {
            return const CircularIndicator();
          }

          if (authService.role == 'user') {
            saveRouteInSessionStorage(student);
            return const StudentHomeScreen();
          }

          return const HomeScreen();
        },
      ),

      // Rutas de división (protegidas)

      GoRoute(
        path: division,
        pageBuilder: (context, state) {
          final authService = Provider.of<AuthService>(context);

          if (authService.autenticando == Auth.pending) {
            return const NoTransitionPage(child: CircularIndicator());
          }

          if (authService.role == 'division') {
            Provider.of<SideMeuProvider>(context, listen: false)
                .setCurrentPageUrl(division);
            saveRouteInSessionStorage(division);

            return const NoTransitionPage(
              child: DivisionLayout(
                child: DivisionHomeScreen(),
              ),
            );
          }

          return const NoTransitionPage(child: HomeScreen());
        },
      ),

      GoRoute(
        path: divisionSistemas,
        pageBuilder: (context, state) {
          final authService = Provider.of<AuthService>(context);

          if (authService.autenticando == Auth.pending) {
            return const NoTransitionPage(child: CircularIndicator());
          }

          if (authService.role == 'division') {
            Provider.of<SideMeuProvider>(context, listen: false)
                .setCurrentPageUrl(divisionSistemas);
            saveRouteInSessionStorage(divisionSistemas);

            return const NoTransitionPage(
              child: DivisionLayout(
                child: CarreraScreen(
                  text: 'SOLICITUDES DE INGENIERIA EN SISTEMAS',
                ),
              ),
            );
          }

          return const NoTransitionPage(child: HomeScreen());
        },
      ),

      GoRoute(
        path: divisionQuimica,
        pageBuilder: (context, state) {
          final authService = Provider.of<AuthService>(context);

          if (authService.autenticando == Auth.pending) {
            return const NoTransitionPage(child: CircularIndicator());
          }

          if (authService.role == 'division') {
            Provider.of<SideMeuProvider>(context, listen: false)
                .setCurrentPageUrl(divisionQuimica);
            saveRouteInSessionStorage(divisionQuimica);

            return const NoTransitionPage(
              child: DivisionLayout(
                child: CarreraScreen(
                  text: 'SOLICITUDES DE INGENIERIA QUIMICA',
                ),
              ),
            );
          }

          return const NoTransitionPage(child: HomeScreen());
        },
      ),

      GoRoute(
        path: divisionIndustrial,
        pageBuilder: (context, state) {
          final authService = Provider.of<AuthService>(context);

          if (authService.autenticando == Auth.pending) {
            return const NoTransitionPage(child: CircularIndicator());
          }

          if (authService.role == 'division') {
            Provider.of<SideMeuProvider>(context, listen: false)
                .setCurrentPageUrl(divisionIndustrial);
            saveRouteInSessionStorage(divisionIndustrial);

            return const NoTransitionPage(
              child: DivisionLayout(
                child: CarreraScreen(
                  text: 'SOLICITUDES DE INGENIERIA INDUSTRIAL',
                ),
              ),
            );
          }

          return const NoTransitionPage(child: HomeScreen());
        },
      ),

      GoRoute(
        path: divisionCivil,
        pageBuilder: (context, state) {
          final authService = Provider.of<AuthService>(context);

          if (authService.autenticando == Auth.pending) {
            return const NoTransitionPage(child: CircularIndicator());
          }

          if (authService.role == 'division') {
            Provider.of<SideMeuProvider>(context, listen: false)
                .setCurrentPageUrl(divisionCivil);
            saveRouteInSessionStorage(divisionCivil);

            return const NoTransitionPage(
              child: DivisionLayout(
                child: CarreraScreen(
                  text: 'SOLICITUDES DE INGENIERIA CIVIL',
                ),
              ),
            );
          }

          return const NoTransitionPage(child: HomeScreen());
        },
      ),

      GoRoute(
        path: divisionBioquimica,
        pageBuilder: (context, state) {
          final authService = Provider.of<AuthService>(context);

          if (authService.autenticando == Auth.pending) {
            return const NoTransitionPage(child: CircularIndicator());
          }

          if (authService.role == 'division') {
            Provider.of<SideMeuProvider>(context, listen: false)
                .setCurrentPageUrl(divisionBioquimica);
            saveRouteInSessionStorage(divisionBioquimica);

            return const NoTransitionPage(
              child: DivisionLayout(
                child: CarreraScreen(
                  text: 'SOLICITUDES DE INGENIERIA BIOQUIMICA',
                ),
              ),
            );
          }

          return const NoTransitionPage(child: HomeScreen());
        },
      ),

      GoRoute(
        path: divisionAdministracion,
        pageBuilder: (context, state) {
          final authService = Provider.of<AuthService>(context);

          if (authService.autenticando == Auth.pending) {
            return const NoTransitionPage(child: CircularIndicator());
          }

          if (authService.role == 'division') {
            Provider.of<SideMeuProvider>(context, listen: false)
                .setCurrentPageUrl(divisionAdministracion);
            saveRouteInSessionStorage(divisionAdministracion);

            return const NoTransitionPage(
              child: DivisionLayout(
                child: CarreraScreen(
                  text: 'SOLICITUDES DE INGENIERIA EN ADMINISTRACION',
                ),
              ),
            );
          }

          return const NoTransitionPage(child: HomeScreen());
        },
      ),

      GoRoute(
        path: divisionGestion,
        pageBuilder: (context, state) {
          final authService = Provider.of<AuthService>(context);

          if (authService.autenticando == Auth.pending) {
            return const NoTransitionPage(child: CircularIndicator());
          }

          if (authService.role == 'division') {
            Provider.of<SideMeuProvider>(context, listen: false)
                .setCurrentPageUrl(divisionGestion);
            saveRouteInSessionStorage(divisionGestion);

            return const NoTransitionPage(
              child: DivisionLayout(
                child: CarreraScreen(
                  text: 'SOLICITUDES DE INGENIERIA EN GESTION EMPESARIAL',
                ),
              ),
            );
          }

          return const NoTransitionPage(child: HomeScreen());
        },
      ),

      GoRoute(
        path: divisionElectro,
        pageBuilder: (context, state) {
          final authService = Provider.of<AuthService>(context);

          if (authService.autenticando == Auth.pending) {
            return const NoTransitionPage(child: CircularIndicator());
          }

          if (authService.role == 'division') {
            Provider.of<SideMeuProvider>(context, listen: false)
                .setCurrentPageUrl(divisionElectro);
            saveRouteInSessionStorage(divisionElectro);

            return const NoTransitionPage(
              child: DivisionLayout(
                child: CarreraScreen(
                  text: 'SOLICITUDES DE INGENIERIA EN ELECTROMECANICA',
                ),
              ),
            );
          }

          return const NoTransitionPage(child: HomeScreen());
        },
      ),

      GoRoute(
        path: divisionTurismo,
        pageBuilder: (context, state) {
          final authService = Provider.of<AuthService>(context);

          if (authService.autenticando == Auth.pending) {
            return const NoTransitionPage(child: CircularIndicator());
          }

          if (authService.role == 'division') {
            Provider.of<SideMeuProvider>(context, listen: false)
                .setCurrentPageUrl(divisionTurismo);
            saveRouteInSessionStorage(divisionTurismo);

            return const NoTransitionPage(
              child: DivisionLayout(
                child: CarreraScreen(
                  text: 'SOLICITUDES DE LICENCIATURA EN TURISMO',
                ),
              ),
            );
          }

          return const NoTransitionPage(child: HomeScreen());
        },
      ),

      GoRoute(
          path: viewPdf,
          pageBuilder: (context, state) {
            final authService = Provider.of<AuthService>(context);
              final numControl = state.pathParameters['numControl'];
              print(numControl);

            if (authService.autenticando == Auth.pending) {
              return const NoTransitionPage(child: CircularIndicator());
            }

            if(numControl != null){
              if (authService.role == 'division') {
              saveRouteInSessionStorage(viewPdf);

              return  NoTransitionPage(child: ViewPdfScreen(numControl: numControl,));
            }
            }

            return const NoTransitionPage(child: HomeScreen());
          }),
    ],

    // Puedes manejar errores si es necesario
    errorBuilder: (context, state) => const HomeScreen(),
  );

  // Función para obtener la ruta inicial desde sessionStorage
  static String _getInitialRoute() {
    final savedRoute = html.window
        .sessionStorage['lastRoute']; // Verificar si hay una ruta guardada

    return savedRoute ?? '/'; // Si no hay ruta guardada, se usa la raíz ("/")
  }

// Función para guardar la ruta actual en sessionStorage
  static void saveRouteInSessionStorage(String route) {
    html.window.sessionStorage['lastRoute'] = route; // Almacenar la ruta actual
  }
}
