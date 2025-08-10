import 'package:flutter/material.dart';

import '../../../../core/common/widgets/custom_text.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(child:
        CustomText(text: 'This is Signup Screen'),)
    );
  }
}
