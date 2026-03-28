part of 'search_cubit.dart';

class SearchState {
  final List<SearchResultModel> suggestions;
  final bool isSearching;
  final String? errorMessage;
  final String currentQuery;

  SearchState({
    this.suggestions = const [],
    this.isSearching = false,
    this.errorMessage,
    this.currentQuery = '',
  });

  SearchState copyWith({
    List<SearchResultModel>? suggestions,
    bool? isSearching,
    String? errorMessage,
    String? currentQuery,
  }) {
    return SearchState(
      suggestions: suggestions ?? this.suggestions,
      isSearching: isSearching ?? this.isSearching,
      errorMessage: errorMessage ?? this.errorMessage,
      currentQuery: currentQuery ?? this.currentQuery,
    );
  }
}

