part of 'search_cubit.dart';

abstract class SearchState extends Equatable {
  const SearchState();

  @override
  List<Object> get props => [];
}

class SearchInitial extends SearchState {}

class SearchLoading extends SearchState {}

class SearchEmpty extends SearchState {}

class SearchEmptyResults extends SearchState {}

class SearchLoaded extends SearchState {
  final ApiResult apiResult;

  const SearchLoaded({required this.apiResult});
}

class SearchError extends SearchState {
  final ApiResult apiResult;

  const SearchError({required this.apiResult});
}
