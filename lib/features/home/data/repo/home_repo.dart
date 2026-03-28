import 'package:bookia_store_app/features/home/data/models/books_model.dart';
import 'package:bookia_store_app/features/home/data/models/book_details_model.dart';

import '../../../../core/networking/api_constants.dart';
import '../../../../core/networking/dio_factory.dart';
import '../models/slider_model.dart';

class HomeRepo {

  static Future<SliderModel?> getHomeSlider() async {
    try {
      final response = await DioFactory.dio?.get(
        ApiConstants.slider,
      );

      if (response?.statusCode == 200) {
        return SliderModel.fromJson(response?.data??"");
      } else {
        return null;
      }
    } catch (error) {
      return null;
    }
  }

  static Future<BooksModel?> getBestSellerBooks() async {
    try {
      final response = await DioFactory.dio?.get(
        ApiConstants.bestSeller,
      );

      if (response?.statusCode == 200) {
        return BooksModel.fromJson(response?.data??"");
      } else {
        return null;
      }
    } catch (error) {
      return null;
    }
  }

  static Future<BookDetailsModel?> getBookDetails(int bookId) async {
    try {
      final response = await DioFactory.dio?.get(
        "${ApiConstants.productDetails}$bookId",
      );

      if (response?.statusCode == 200) {
        return BookDetailsModel.fromJson(response?.data??"");
      } else {
        return null;
      }
    } catch (error) {
      return null;
    }
  }
}
