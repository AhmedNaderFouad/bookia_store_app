import 'package:bloc/bloc.dart';
import '../data/models/search_model.dart';
import '../data/repo/search_repo.dart';
import 'dart:async';

part 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  SearchCubit() : super(SearchState());

  Timer? _debounce;

  Future<void> searchBooks(String query) async {
    if (_debounce?.isActive ?? false) {
      _debounce!.cancel();
    }

    if (query.isEmpty) {
      emit(
        state.copyWith(suggestions: [], isSearching: false, errorMessage: null),
      );
      return;
    }

    emit(
      state.copyWith(
        isSearching: true,
        errorMessage: null,
        currentQuery: query,
      ),
    );

    _debounce = Timer(const Duration(milliseconds: 500), () async {
      try {
        final response = await SearchRepo.searchBooks(query);
        if (response != null && response.data != null) {
          emit(
            state.copyWith(
              suggestions: response.data?.products ?? [],
              isSearching: false,
              errorMessage: null,
            ),
          );
        } else {
          emit(
            state.copyWith(
              suggestions: [],
              isSearching: false,
              errorMessage: 'No results found',
            ),
          );
        }
      } catch (e) {
        emit(
          state.copyWith(
            isSearching: false,
            errorMessage: 'Failed to search',
            suggestions: [],
          ),
        );
      }
    });
  }

  void clearSearch() {
    if (_debounce?.isActive ?? false) {
      _debounce!.cancel();
    }
    emit(SearchState());
  }

  @override
  Future<void> close() {
    _debounce?.cancel();
    return super.close();
  }
}
