// ignore_for_file: use_build_context_synchronously

import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:flutter/material.dart';
import 'package:esports_cuba/locator.dart';
import 'package:esports_cuba/src/shared/utils.dart';
import 'package:esports_cuba/src/shared/app_info.dart';
import 'package:esports_cuba/src/shared/extensions.dart';
import 'package:esports_cuba/resources/general_styles.dart';
import 'package:esports_cuba/src/models/user_base_model.dart';
import 'package:esports_cuba/src/repositories/auth_repository.dart';
import 'package:esports_cuba/src/repositories/user_repository.dart';
import 'package:esports_cuba/src/shared/repository/ApiResult.dart';
import 'package:esports_cuba/src/shared/widgets/dialog_message.dart';

import '../../../route/app_router.gr.dart';

part 'drawer_state.dart';

class DrawerCubit extends Cubit<DrawerState> {
  late UserBaseModel? _user;
  late AppInfo? appInfo;

  DrawerCubit() : super(DrawerInitial());

  Future<void> getUser(BuildContext context) async {
    emit(DrawerLoading());
    appInfo = await AppInfo.getInstace(context);
    _user = appInfo?.user;
    emit(DrawerLoaded(userBaseModel: _user!));
  }

  Future<void> logOut(BuildContext context) async {
    try {
      await serviceLocator<AuthRepository>().logOut();
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(context.loc.logoutSuccessfully),
        backgroundColor: GStyles.colorPrimary,
        duration: const Duration(seconds: 5),
      ));

      Utils.logOut(context);
      context.router.replace(const SignupScreen());
    } catch (e) {
      showDialog(
          context: context,
          builder: (cntxt) {
            return DialogMessage(
                title: context.loc.error,
                text: e.toString(),
                withTranslate: true);
          });
    }
  }
}
