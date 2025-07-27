import 'package:flutter/material.dart';
import 'package:ps_shakib/core/common/widgets/custom_text.dart';
import 'package:ps_shakib/core/utils/constants/app_sizes.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});
  static const String routeName = "/";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(getWidth(16)),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [CustomText(text: 'This is Splash Screen')],
          ),
        ),
      ),
    );
  }
}
