import 'package:flutter/cupertino.dart';
import 'package:auto_route/auto_route.dart';

import '../../../route/app_router.gr.dart';


class SplashController {
  static checkLogin(BuildContext context) async {
    await Future.delayed(const Duration(seconds: 1));
    context.router.replace(const RegisterScreen());
  }
}
