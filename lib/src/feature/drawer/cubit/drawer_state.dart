part of 'drawer_cubit.dart';

abstract class DrawerState extends Equatable {
  const DrawerState();

  @override
  List<Object> get props => [];
}

class DrawerInitial extends DrawerState {}

class DrawerLoading extends DrawerState {}

class DrawerLoaded extends DrawerState {
  late UserBaseModel userBaseModel;

  DrawerLoaded({required this.userBaseModel});
}
