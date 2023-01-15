// ignore_for_file: must_be_immutable

part of 'auth_cubit.dart';

@immutable
abstract class AuthState {}

///Estado inicial del Cubit
class AuthInitial extends AuthState {}

///Estado que define si el registro es por email
class AuthWithEmail extends AuthState {
  AuthWithEmail({required this.userState});

  UserState userState;
}
