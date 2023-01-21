// ignore_for_file: must_be_immutable

part of 'favorites_cubit.dart';

abstract class BookmarkState extends Equatable {
  const BookmarkState();

  @override
  List<Object> get props => [];
}

class FavoritesInitial extends BookmarkState {}

class FavoritesLoading extends BookmarkState {}

class FavoritesEmpty extends BookmarkState {}

class FavoritesError extends BookmarkState {}

class FavoritesLoaded extends BookmarkState {
  late ApiResult apiResult;

  FavoritesLoaded({required this.apiResult});
}
