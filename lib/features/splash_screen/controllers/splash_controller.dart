import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:ps_shakib/core/services/local_storage_service.dart';
import 'package:ps_shakib/features/authentication/presentation/screens/login_screen.dart';
import 'package:ps_shakib/features/landing/presentation/screens/landing_screen.dart';

class SplashController {
  void navigateToHomeScreen({required BuildContext context}) async {
    await Future.delayed(const Duration(milliseconds: 2000), () {
      if (LocalStorageService.instance.hasToken()) {
        // ignore: use_build_context_synchronously
        context.go(LandingScreen.routeName);
      } else {
        // ignore: use_build_context_synchronously
        context.go(LoginScreen.routeName);
      }
    });
  }
}
