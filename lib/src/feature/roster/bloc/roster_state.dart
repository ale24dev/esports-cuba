part of 'roster_cubit.dart';

abstract class RosterState extends Equatable {
  const RosterState();

  @override
  List<Object> get props => [];
}

class RosterInitial extends RosterState {}

class RosterLoading extends RosterState {}

class RosterEmpty extends RosterState {}

class RosterLoaded extends RosterState {
  final ApiResult apiResult;

  const RosterLoaded({required this.apiResult});
}

class RosterError extends RosterState {
  final ApiResult apiResult;

  const RosterError({required this.apiResult});
}
