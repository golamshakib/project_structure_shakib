import 'package:flutter/material.dart';
import 'package:ps_shakib/core/common/widgets/custom_text.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child:
        CustomText(text: 'This is LoginScreen'),)
    );
  }
}
