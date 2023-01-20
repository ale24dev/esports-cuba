// ignore_for_file: unnecessary_nullable_for_final_variable_declarations

import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:esports_cuba/src/shared/loading_app.dart';
import 'package:meta/meta.dart';
import 'package:rxdart/rxdart.dart';

import 'package:esports_cuba/src/shared/utils.dart';
import 'package:esports_cuba/src/feature/auth/bloc/validators.dart';
import 'package:esports_cuba/src/feature/auth/const/user_state.dart';

part 'auth_state.dart';

///Cubit encargado de controlar el estado del módulo de autenticación
class AuthCubit extends Cubit<AuthhState> with Validators {
  AuthCubit() : super(AuthInitial());

  final _emailController = BehaviorSubject<String>();
  final _passwordController = BehaviorSubject<String>();
  final _usernameController = BehaviorSubject<String>();
  bool _loading = false;

  ///Recuperar valores del stream
  Stream<String> get emailStream =>
      _emailController.stream.transform(validateEmail);
  Stream<String> get passwordStream =>
      _passwordController.stream.transform(validatePassword);
  Stream<String> get usernameStream =>
      _usernameController.stream.transform(validateUsername);

  Stream<bool> get formSignUpValidStream => Rx.combineLatest3(
      emailStream, passwordStream, usernameStream, (e, p, u) => true);

  Stream<bool> get formSignInValidStream =>
      Rx.combineLatest2(emailStream, passwordStream, (e, p) => true);

  ///Insertar valores en el stream
  Function(String) get changeEmail => _emailController.sink.add;
  Function(String) get changePassword => _passwordController.sink.add;
  Function(String) get changeUsername => _usernameController.sink.add;

  ///Obtenemos el último valor del stream
  String get email => _emailController.value;
  String get password => _passwordController.value;
  String get username => _usernameController.value;

  bool isEmailValid(String email) {
    return Utils.isEmailValid(email);
  }

  ///Emitir nuevo estado para registro con email
  void authWithEmail() {
    emit(AuthWithEmail(userState: UserState.notSigned));
  }

  void changeStateLoad(bool loading) {
    _loading = loading;
    emit(AuthLoading());
  }

  dispose() {
    _emailController.close();
    _passwordController.close();
    _usernameController.close();
  }
}
