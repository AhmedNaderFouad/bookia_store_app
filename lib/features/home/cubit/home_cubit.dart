import 'package:bloc/bloc.dart';
import '../data/models/books_model.dart';
import '../data/models/slider_model.dart';
import '../data/repo/home_repo.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeState());

  Future<void> getHomeData() async {
    getSlider();
    getBestSeller();
  }

  Future<void> getSlider() async {
    emit(state.copyWith(isSliderLoading: true, sliderError: null));
    final response = await HomeRepo.getHomeSlider();
    if (response != null && response.data != null) {
      emit(state.copyWith(
        isSliderLoading: false,
        sliders: response.data?.sliders ?? [],
      ));
    } else {
      emit(state.copyWith(isSliderLoading: false, sliderError: "Error"));
    }
  }

  Future<void> getBestSeller() async {
    emit(state.copyWith(isBestSellerLoading: true, bestSellerError: null));
    final response = await HomeRepo.getBestSellerBooks();
    if (response is BooksModel) {
      emit(state.copyWith(
        isBestSellerLoading: false,
        bestSellers: response.data?.products ?? [],
      ));
    } else {
      emit(state.copyWith(isBestSellerLoading: false, bestSellerError: "Error"));
    }
  }
}
