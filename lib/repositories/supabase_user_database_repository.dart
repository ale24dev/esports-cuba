import 'package:esports_cuba/locator.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:esports_cuba/src/shared/repository/ApiResult.dart';

import 'package:esports_cuba/models/user_base_model.dart';

class SupabaseDatabaseRepository {
  final Supabase _supabase;
  late ApiResult apiResult;
  SupabaseDatabaseRepository(this._supabase) {
    apiResult = serviceLocator<ApiResult>();
  }

  Future<ApiResult> getUserInformation(String userId) async {
    try {
      final Map<String, dynamic> response = await _supabase.client
          .from('User')
          .select()
          .match({'id': userId}).single();
      UserBaseModel userBaseModel = UserBaseModel.fromJson(response);
      print(userBaseModel.nickname);
      apiResult.responseObject = userBaseModel;
      return apiResult;
    } catch (e) {
      apiResult.error = e.toString();
      apiResult.errorType = e.runtimeType;
      return apiResult;
    }
  }

  /* .flatMap(
        (response) {
          print("1");
          return Either.tryCatch(
            () => response as Map<String, dynamic>,
            (_, __) => ResponseFormatErrorGetUserInformationFailure(response),
          ).toTaskEither();
        },
      ).flatMap((map) {
        print(map);
        return Either.tryCatch(
          () => UserBaseModel.fromJson(map),
          (_, __) => JsonDecodeGetUserInformationFailure(map),
        ).toTaskEither();
      })*/
/*
  @override
  TaskEither<UpdateUserInformationFailure, UserModel> updateUserInformation(
    UserModel userModel,
  ) =>
      TaskEither<UpdateUserInformationFailure, dynamic>.tryCatch(
        () => _supabase.client
            .from(_userSupabaseTable.tableName)
            .update(userModel.toJson()),
        RequestUpdateUserInformationFailure.new,
      ).map((_) => userModel);
      */
}
