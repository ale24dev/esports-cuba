// ignore_for_file: must_be_immutable

part of 'bookmark_cubit.dart';

abstract class BookmarkState extends Equatable {
  const BookmarkState();

  @override
  List<Object> get props => [];
}

class BookmarkInitial extends BookmarkState {}

class BookmarkLoading extends BookmarkState {}

class BookmarkEmpty extends BookmarkState {}

class BookmarkError extends BookmarkState {}

class BookmarkLoaded extends BookmarkState {
  late ApiResult apiResult;
  late bool loading;

  BookmarkLoaded({required this.apiResult, required this.loading});
}
