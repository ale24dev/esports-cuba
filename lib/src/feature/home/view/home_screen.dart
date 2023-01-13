import 'package:flutter/material.dart';
import 'package:esports_cuba/locator.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import 'package:esports_cuba/resources/general_styles.dart';
import 'package:esports_cuba/src/models/game_base_model.dart';
import 'package:esports_cuba/src/shared/repository/ApiResult.dart';
import 'package:esports_cuba/src/feature/tournament/bloc/game_cubit.dart';
import 'package:esports_cuba/src/repositories/game_database_repository.dart';

class HomeScreen extends StatelessWidget {
  late ApiResult apiResult;
  HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GameCubit, GameState>(
      builder: (context, state) {
        if (state is GameLoaded) {
          apiResult = state.apiResult;
        }
        return state is GameLoading
            ?  Center(
                  child: SpinKitFadingCube(
                  color: Colors.white,
                  size: 20.sp,
                ))
            : SizedBox(
                height: 100.h,
                child: ListView.builder(
                    itemCount: apiResult.responseObject.length,
                    itemBuilder: ((context, index) {
                      GameBaseModel gameBaseModel =
                          apiResult.responseObject[index];

                      return Container(
                        height: 20.h,
                        width: 100.w,
                        margin: EdgeInsets.symmetric(
                            horizontal: 5.w, vertical: 3.h),
                        decoration: BoxDecoration(
                            boxShadow: [GStyles.socialMediaShadowButton],
                            borderRadius: BorderRadius.circular(20)),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: Image.network(
                            gameBaseModel.image,
                            fit: BoxFit.fitWidth,
                            width: 100.w,
                          ),
                        ),
                      );
                    })),
              );
      },
    );
  }
}
