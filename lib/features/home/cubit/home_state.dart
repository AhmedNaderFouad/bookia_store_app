part of 'home_cubit.dart';

@immutable
sealed class HomeState {}

final class HomeInitial extends HomeState {}

final class GetHomeSliderLoading extends HomeState {}

final class GetHomeSliderSuccess extends HomeState {
  final List<SliderImage> slider;
  GetHomeSliderSuccess(this.slider);
}

final class GetHomeSliderError extends HomeState {}
