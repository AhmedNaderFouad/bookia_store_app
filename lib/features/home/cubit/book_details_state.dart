part of 'book_details_cubit.dart';

class BookDetailsState {
  final bool isLoading;
  final DataModel? bookDetails;
  final String? error;
  final bool isWishlisted;

  BookDetailsState({
    this.isLoading = false,
    this.bookDetails,
    this.error,
    this.isWishlisted = false,
  });

  BookDetailsState copyWith({
    bool? isLoading,
    DataModel? bookDetails,
    String? error,
    bool? isWishlisted,
  }) {
    return BookDetailsState(
      isLoading: isLoading ?? this.isLoading,
      bookDetails: bookDetails ?? this.bookDetails,
      error: error ?? this.error,
      isWishlisted: isWishlisted ?? this.isWishlisted,
    );
  }
}

