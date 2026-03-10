part of 'home_cubit.dart';

class HomeState {
  final List<SliderImage> sliders;
  final List<ProductModel> bestSellers;
  final bool isSliderLoading;
  final bool isBestSellerLoading;
  final String? sliderError;
  final String? bestSellerError;

  HomeState({
    this.sliders = const [],
    this.bestSellers = const [],
    this.isSliderLoading = false,
    this.isBestSellerLoading = false,
    this.sliderError,
    this.bestSellerError,
  });

  HomeState copyWith({
    List<SliderImage>? sliders,
    List<ProductModel>? bestSellers,
    bool? isSliderLoading,
    bool? isBestSellerLoading,
    String? sliderError,
    String? bestSellerError,
  }) {
    return HomeState(
      sliders: sliders ?? this.sliders,
      bestSellers: bestSellers ?? this.bestSellers,
      isSliderLoading: isSliderLoading ?? this.isSliderLoading,
      isBestSellerLoading: isBestSellerLoading ?? this.isBestSellerLoading,
      sliderError: sliderError ?? this.sliderError,
      bestSellerError: bestSellerError ?? this.bestSellerError,
    );
  }
}
