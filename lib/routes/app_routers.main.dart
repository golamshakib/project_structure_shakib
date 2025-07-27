part of 'app_routes.dart';

class AppRoute {
  AppRoute._();
  static GoRouter routes = GoRouter(
    debugLogDiagnostics: true,
    routes: [
      GoRoute(
        path: SplashScreen.routeName,
        builder: (context, state) {
          SplashController().navigateToHomeScreen(context: context);
          return const SplashScreen();
        },
      ),

      // Authentication Screens
      GoRoute(
        path: LoginScreen.routeName,
        builder: (context, state) => LoginScreen(),
      ),
      GoRoute(
        path: SignUpScreen.routeName,
        builder: (context, state) => SignUpScreen(),
      ),

      // Main Screens
      GoRoute(
        path: LandingScreen.routeName,
        builder: (context, state) => LandingScreen(),
      ),
    ],
  );
}
