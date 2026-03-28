import 'package:bloc/bloc.dart';
import 'package:bookia_store_app/features/home/data/models/book_details_model.dart';
import '../data/repo/home_repo.dart';

part 'book_details_state.dart';

class BookDetailsCubit extends Cubit<BookDetailsState> {
  BookDetailsCubit() : super(BookDetailsState());

  Future<void> getBookDetails(int bookId) async {
    emit(state.copyWith(isLoading: true, error: null));
    final response = await HomeRepo.getBookDetails(bookId);
    if (response != null && response.data != null) {
      emit(state.copyWith(
        isLoading: false,
        bookDetails: response.data,
      ));
    } else {
      emit(state.copyWith(isLoading: false, error: "Error loading book details"));
    }
  }

  void toggleWishlist() {
    emit(state.copyWith(isWishlisted: !state.isWishlisted));
  }
}

