import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import 'package:esports_cuba/src/feature/auth/const/user_state.dart';

part 'auth_state.dart';

///Cubit encargado de controlar el estado del módulo de autenticación
class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());

  ///Emitir nuevo estado para registro con email
  void authWithEmail() {
    emit(AuthWithEmail(userState: UserState.notSigned));
  }
}
