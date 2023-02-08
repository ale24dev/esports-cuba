part of 'player_cubit.dart';

abstract class PlayerState extends Equatable {
  const PlayerState();

  @override
  List<Object> get props => [];
}

class PlayerInitial extends PlayerState {}

class PlayerLoading extends PlayerState {}

class PlayerEmpty extends PlayerState {}

class PlayerLoaded extends PlayerState {
  final ApiResult apiResult;

  const PlayerLoaded({required this.apiResult});
}

class PlayerError extends PlayerState {
  final ApiResult apiResult;

  const PlayerError({required this.apiResult});
}
