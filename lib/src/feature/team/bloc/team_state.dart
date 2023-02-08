part of 'team_cubit.dart';

abstract class TeamState extends Equatable {
  const TeamState();

  @override
  List<Object> get props => [];
}

class TeamInitial extends TeamState {}

class TeamLoading extends TeamState {}

class TeamEmpty extends TeamState {}

class TeamLoaded extends TeamState {
  final ApiResult apiResult;

  const TeamLoaded({required this.apiResult});
}

class TeamError extends TeamState {
  final ApiResult apiResult;

  const TeamError({required this.apiResult});
}
