import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../data/repo/auth_repo.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());

  void login({required String email, required String password}) async {
    emit(AuthLoadingState());
    final response = await AuthRepo.login(email: "email", password: "password");
    if (response) {
      emit(AuthSuccessSate());
    } else {
      emit(AuthErrorState());
    }
  }
}
