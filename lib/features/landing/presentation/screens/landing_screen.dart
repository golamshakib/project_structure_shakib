import 'package:flutter/material.dart';
import 'package:ps_shakib/features/landing/presentation/components/custom_bottom_navbar.dart';

class LandingScreen extends StatelessWidget {
  const LandingScreen({super.key});
  static const String routeName = "/landing";
  @override
  Widget build(BuildContext context) {
    return Scaffold(bottomNavigationBar: CustomBottomNavbar());
  }
}
