import 'package:dio/dio.dart';

import '../models/slider_model.dart';

class HomeRepo {
  static final Dio _dio = Dio();

  static Future<SliderModel?> getHomeSlider() async {
    try {
      final response = await _dio.get("https://codingarabic.online/api/sliders");

      if (response.statusCode == 200) {
        return SliderModel.fromJson(response.data);
      } else {
        return null;
      }
    } catch (error) {
      return null;
    }
  }
}
