import 'package:flutter/material.dart';
import 'package:bookia_store_app/gen/assets.gen.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [Image.asset(Assets.images.splashBackground.path)],
      ),
    );
  }
}
