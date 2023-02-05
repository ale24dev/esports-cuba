part of 'version_cubit.dart';

abstract class VersionState extends Equatable {
  const VersionState();

  @override
  List<Object> get props => [];
}

class VersionInitial extends VersionState {}

class VersionLoaded extends VersionState {
  final String version;

  const VersionLoaded({required this.version});
}
