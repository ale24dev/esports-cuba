import 'package:supabase_flutter/supabase_flutter.dart';

import 'package:esports_cuba/src/shared/repository/ApiResult.dart';

class AuthRepository {
  AuthRepository(this._supabase);

  final Supabase _supabase;

  Future<ApiResult> signUp(
      {required String email, required String password, required ApiResult apiResult}) async {
    try {
      AuthResponse response =
          await _supabase.client.auth.signUp(email: email, password: password);

      apiResult.responseObject = response.session!;
      apiResult.message = "Registro exitoso";
      //response.session!.accessToken;
      print("1111111111111111111111111111111111111111111111111111111");
      print(apiResult.error.runtimeType);
      print(apiResult.message.runtimeType);
      return apiResult;
    } catch (e) {
      print("2222222222222222222222222222222222222222222222222222222");
      apiResult.error = e;
      apiResult.message = e.toString();
      return apiResult;
    }
  }
}
