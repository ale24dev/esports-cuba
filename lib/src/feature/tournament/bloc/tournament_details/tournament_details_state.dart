part of 'tournament_details_cubit.dart';

abstract class TournamentDetailsState extends Equatable {
  const TournamentDetailsState();

  @override
  List<Object> get props => [];
}

class TournamentDetailsInitial extends TournamentDetailsState {}

class TournamentDetailsLoading extends TournamentDetailsState {}

class TournamentDetailsEmpty extends TournamentDetailsState {}

class TournamentDetailsLoaded extends TournamentDetailsState {
  final ApiResult apiResult;

  const TournamentDetailsLoaded({required this.apiResult});
}

class TournamentDetailsError extends TournamentDetailsState {
  final ApiResult apiResult;

  const TournamentDetailsError({required this.apiResult});
}
