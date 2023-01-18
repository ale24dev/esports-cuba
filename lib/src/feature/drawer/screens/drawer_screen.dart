import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import 'package:esports_cuba/constants.dart';
import 'package:esports_cuba/src/shared/extensions.dart';
import 'package:esports_cuba/src/shared/loading_app.dart';
import 'package:esports_cuba/resources/general_styles.dart';
import 'package:esports_cuba/src/models/user_base_model.dart';
import 'package:esports_cuba/src/feature/drawer/cubit/drawer_cubit.dart';
import 'package:esports_cuba/src/feature/drawer/widgets/drawer_section.dart';
import 'package:esports_cuba/src/feature/drawer/widgets/log_out_section.dart';

class DrawerScreen extends StatefulWidget {
  @override
  State<DrawerScreen> createState() => _DrawerScreenState();
}

class _DrawerScreenState extends State<DrawerScreen> {
  /// Parametro q guarda la version actual del paquete,
  /// se inicializa al llamar al metodo getUser del DrawerCubit
  late UserBaseModel userBaseModel;

  late String version;

  List<String> listDrawerTileShorcouts = ["Favorites", "Tournaments", "Bookmarks"];

  List<String> listDrawerTileSettings = ["Settings", "Help", "About"];

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DrawerCubit, DrawerState>(
      builder: (context, state) {
        if (state is DrawerLoaded) {
          userBaseModel = state.userBaseModel;
        }
        return state is DrawerLoading
            ? const LoadingApp()
            : Drawer(
                backgroundColor: context.theme.primaryColor,
                child: SafeArea(
                  child: Container(
                    color: GStyles.backGroundDarkColor,
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                          vertical: 3.h, horizontal: Constants.MARGIN),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(userBaseModel.username,
                                      style: context.textTheme.bodyText1),
                                  SizedBox(height: 5.sp),
                                  Text(userBaseModel.email,
                                      style: context.textTheme.bodyText1
                                          ?.copyWith(
                                              fontSize: 14.sp,
                                              color: Colors.grey)),
                                  SizedBox(height: 2.h),
                                  Text("Editar perfil",
                                      style: context.textTheme.bodyText1
                                          ?.copyWith(
                                              fontSize: 14.sp,
                                              color: GStyles.colorSecondary)),
                                ],
                              ),
                              Container(
                                decoration: BoxDecoration(
                                  color: const Color.fromRGBO(215, 215, 215, 1),
                                  borderRadius: BorderRadius.circular(100),
                                ),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(100),
                                  child: Image.network(
                                    userBaseModel.image,
                                    height: 30.sp,
                                    width: 30.sp,
                                  ),
                                ),
                              )
                            ],
                          ),
                          SizedBox(height: 4.h),
                          DrawerSection(
                              title: "SHORCOUTS",
                              listDrawerTile: listDrawerTileShorcouts),
                          DrawerSection(
                              title: "SETTINGS",
                              listDrawerTile: listDrawerTileSettings),
                          const Spacer(),
                          const LogOutSection()
                        ],
                      ),
                    ),
                  ),
                ),
              );
      },
    );
  }
}

