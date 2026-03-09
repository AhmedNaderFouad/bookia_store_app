import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../data/models/slider_model.dart';
import '../data/repo/home_repo.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());

  Future<void> getSlider() async {
    emit(GetHomeSliderLoading());
    final response = await HomeRepo.getHomeSlider();
    if (response != null && response.data != null) {
      emit(GetHomeSliderSuccess(response.data?.sliders ?? []));
    } else {
      emit(GetHomeSliderError());
    }
  }
}
