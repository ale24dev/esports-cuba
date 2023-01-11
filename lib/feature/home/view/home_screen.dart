import 'package:esports_cuba/locator.dart';
import 'package:esports_cuba/models/game_base_model.dart';
import 'package:esports_cuba/repositories/game_database_repository.dart';
import 'package:esports_cuba/resources/general_styles.dart';
import 'package:esports_cuba/src/shared/repository/ApiResult.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import 'package:esports_cuba/src/shared/extensions.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text(context.loc.appTitle)),
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 2.w),
            child: const Icon(Icons.person),
          )
        ],
      ),
      drawer: const Drawer(
        child: Text("Ale Díaz"),
      ),
      body: SizedBox(
        height: 100.h,
        child: FutureBuilder(
            future: serviceLocator<GameDatabaseRepository>().getAllGames(),
            builder: ((context, AsyncSnapshot snapshot) {
              if (!snapshot.hasData) {
                return const Center(child: CircularProgressIndicator());
              }
              ApiResult apiResult = snapshot.data;
              if (apiResult.errorType != null) {
                return Center(child: Text(apiResult.error!));
              }
              return Container(
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
            })),
      ),
    );
  }
}
