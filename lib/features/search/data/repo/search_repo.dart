import 'package:bookia_store_app/features/search/data/models/search_model.dart';
import 'package:bookia_store_app/core/networking/api_constants.dart';
import 'package:bookia_store_app/core/networking/dio_factory.dart';

class SearchRepo {
  static Future<SearchModel?> searchBooks(String query) async {
    try {
      final response = await DioFactory.dio?.get(
        ApiConstants.search,
        queryParameters: {'search': query},
      );

      if (response?.statusCode == 200) {
        return SearchModel.fromJson(response?.data ?? "");
      } else {
        return null;
      }
    } catch (error) {
      return null;
    }
  }
}
