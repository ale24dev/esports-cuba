part of 'match_cubit.dart';

abstract class MatchState extends Equatable {
  const MatchState();

  @override
  List<Object> get props => [];
}

class MatchInitial extends MatchState {}

class MatchLoading extends MatchState {}

class MatchLoaded extends MatchState {
  final ApiResult apiResult;

  const MatchLoaded({required this.apiResult});
}

class MatchEmpty extends MatchState {}

class MatchError extends MatchState {
  final ApiResult apiResult;

  const MatchError({required this.apiResult});
}
