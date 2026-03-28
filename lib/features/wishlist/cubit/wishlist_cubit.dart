import 'package:bloc/bloc.dart';
import 'package:bookia_store_app/features/home/data/models/books_model.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

part 'wishlist_state.dart';

class WishlistCubit extends Cubit<WishlistState> {
  static const String wishlistKey = 'wishlist_items';

  WishlistCubit() : super(const WishlistState()) {
    _loadWishlist();
  }

  Future<void> _loadWishlist() async {
    final prefs = await SharedPreferences.getInstance();
    final wishlistString = prefs.getString(wishlistKey);
    if (wishlistString != null) {
      final List<dynamic> decoded = json.decode(wishlistString);
      final products = decoded.map((e) => ProductModel.fromJson(e)).toList();
      emit(WishlistState(products: products));
    }
  }

  Future<void> _saveWishlist(List<ProductModel> products) async {
    final prefs = await SharedPreferences.getInstance();
    final encoded = json.encode(products.map((e) => e.toJson()).toList());
    await prefs.setString(wishlistKey, encoded);
  }

  void addToWishlist(ProductModel product) {
    if (!state.products.any((item) => item.id == product.id)) {
      final updated = List<ProductModel>.from(state.products)..add(product);
      emit(WishlistState(products: updated));
      _saveWishlist(updated);
    }
  }

  void removeFromWishlist(ProductModel product) {
    final updated = List<ProductModel>.from(state.products)
      ..removeWhere((item) => item.id == product.id);
    emit(WishlistState(products: updated));
    _saveWishlist(updated);
  }
}
