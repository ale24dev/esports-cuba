part of 'game_cubit.dart';

abstract class GameState extends Equatable {
  const GameState();

  @override
  List<Object> get props => [];
}

class GameInitial extends GameState {}

class GameLoading extends GameState {}

class GameLoaded extends GameState {
  final ApiResult apiResult;
  final int indexSelected;

  const GameLoaded({required this.apiResult, required this.indexSelected});
}
