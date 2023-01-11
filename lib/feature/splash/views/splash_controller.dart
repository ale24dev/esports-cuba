import 'package:esports_cuba/repositories/supabase_user_database_repository.dart';
import 'package:esports_cuba/src/shared/repository/ApiResult.dart';
import 'package:flutter/cupertino.dart';
import 'package:auto_route/auto_route.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../../models/user_base_model.dart';
import '../../../route/app_router.gr.dart';

class SplashController {
  static checkLogin(BuildContext context) async {
    await Future.delayed(const Duration(seconds: 1));

    context.router.replace(const RegisterScreen());
  }
}
