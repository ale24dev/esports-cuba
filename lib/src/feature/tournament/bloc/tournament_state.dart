part of 'tournament_cubit.dart';

abstract class TournamentState extends Equatable {
  const TournamentState();

  @override
  List<Object> get props => [];
}

class TournamentInitial extends TournamentState {}

class TournamentLoading extends TournamentState {}

class TournamentEmpty extends TournamentState {}

class TournamentError extends TournamentState {
  final ApiResult apiResult;

  const TournamentError({required this.apiResult});
}

class TournamentLoaded extends TournamentState {
  final ApiResult apiResult;

  const TournamentLoaded({required this.apiResult});
}


