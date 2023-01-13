part of 'tournament_cubit.dart';

abstract class TournamentState extends Equatable {
  const TournamentState();

  @override
  List<Object> get props => [];
}

class TournamentInitial extends TournamentState {}

class TournamentLoading extends TournamentState {}

class TournamentLoaded extends TournamentState {
  final ApiResult apiResult;

  const TournamentLoaded({required this.apiResult});
}
