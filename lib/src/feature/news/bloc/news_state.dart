// ignore_for_file: must_be_immutable

part of 'news_cubit.dart';

abstract class NewsState extends Equatable {
  const NewsState();

  @override
  List<Object> get props => [];
}

class NewsInitial extends NewsState {}

class NewsLoading extends NewsState {}

class NewsLoaded extends NewsState {
  late ApiResult apiResult;

  NewsLoaded({required this.apiResult});
}
