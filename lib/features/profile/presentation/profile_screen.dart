import 'package:bookia_store_app/core/routing/routes.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Center(child: InkWell(
      onTap: ()async{
        final SharedPreferences prefs = await SharedPreferences.getInstance();
        prefs.clear();
        Navigator.pushNamedAndRemoveUntil(context, Routes.loginScreen, (route) => false);
      },
        child: Text("Profile Screen"))));
  }
}
