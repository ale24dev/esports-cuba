// ignore_for_file: must_be_immutable

part of 'auth_cubit.dart';

@immutable
abstract class AuthhState {}

///Estado inicial del Cubit
class AuthInitial extends AuthhState {}

///Estado que define si el registro es por email
class AuthWithEmail extends AuthhState {
  AuthWithEmail({required this.userState});

  UserState userState;
}

class AuthLoading extends AuthhState{}
