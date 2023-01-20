import 'dart:async';

import 'package:esports_cuba/src/shared/utils.dart';

class Validators {
  final validateEmail =
      StreamTransformer<String, String>.fromHandlers(handleData: (email, sink) {
    if (Utils.isEmailValid(email)) {
      sink.add(email);
    } else {
      sink.addError("Email inválido");
    }
  });

  final validatePassword = StreamTransformer<String, String>.fromHandlers(
      handleData: (password, sink) {
    if (password.length > 5) {
      sink.add(password);
    } else {
      sink.addError("La contraseña debe tener más de 6 caracteres");
    }
  });

  final validateUsername = StreamTransformer<String, String>.fromHandlers(
      handleData: (username, sink) {
    if (username.length <= 2) {
      sink.addError("El nombre de usuario no puede ser menor que 3 caracteres");
    } else {
      sink.add(username);
    }
  });
}
