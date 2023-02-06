part of 'favorites_cubit.dart';

abstract class FavoritesState extends Equatable {
  const FavoritesState();

  @override
  List<Object> get props => [];
}

class FavoritesInitial extends FavoritesState {}

class FavoritesLoading extends FavoritesState {}

class FavoritesLoaded extends FavoritesState {
  final ApiResult apiResult;

  const FavoritesLoaded({required this.apiResult});
}

class FavoritesEmpty extends FavoritesState {}

class FavoritesError extends FavoritesState {
  final ApiResult apiResult;

  const FavoritesError({required this.apiResult});
}
