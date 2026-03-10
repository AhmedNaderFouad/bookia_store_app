import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../core/networking/api_constants.dart';
import '../../../../core/networking/dio_factory.dart';

class AuthRepo {

  static Future<bool> login({
    required String email,
    required String password,
  }) async {
    try {
      final response = await DioFactory.dio?.post(
        ApiConstants.login,
        data: {"email": email, "password": password},
      );

      if (response?.statusCode == 200) {
        await saveToken(response?.data["data"]["token"].toString()??"");
        return true;
      } else {
        return false;
      }
    } catch (error) {
      debugPrint(error.toString());
      return false;
    }
  }

  static saveToken(String token) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('token', token);
  }
}
