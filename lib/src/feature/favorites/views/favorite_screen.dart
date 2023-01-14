import 'package:auto_route/auto_route.dart';
import 'package:esports_cuba/src/feature/favorites/views/widgets/favorites_card.dart';
import 'package:esports_cuba/src/feature/layout/views/layout_screen.dart';
import 'package:esports_cuba/src/models/favorites_base_model.dart';
import 'package:esports_cuba/src/shared/extensions.dart';
import 'package:esports_cuba/src/shared/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import 'package:esports_cuba/src/shared/loading_app.dart';
import 'package:esports_cuba/src/shared/repository/ApiResult.dart';
import 'package:esports_cuba/src/feature/favorites/bloc/favorites_cubit.dart';

class FavoritesScreen extends StatefulWidget {
  FavoritesScreen({super.key});

  @override
  State<FavoritesScreen> createState() => _FavoritesScreenState();
}

class _FavoritesScreenState extends State<FavoritesScreen> {
  @override
  void initState() {
    BlocProvider.of<FavoritesCubit>(context).loadFavoritesByUser();
    super.initState();
  }

  late ApiResult apiResult;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Utils.appBarWidget(
          context: context,
          title: "Elementos Guardados",
          navigateBack: true,
          actions: [
            Padding(
                padding: EdgeInsets.only(right: 2.w),
                child: Center(child: Text("Eliminar todo")))
          ]),
      body: BlocBuilder<FavoritesCubit, FavoritesState>(
        builder: (context, state) {
          if (state is FavoritesLoaded) {
            apiResult = state.apiResult;
          }
          return state is FavoritesLoading
              ? const LoadingApp()
              : Container(
                  height: 100.h,
                  child: ListView.builder(
                      itemCount: apiResult.responseObject.length,
                      itemBuilder: ((context, index) {
                        FavoritesBaseModel favoritesBaseModel =
                            apiResult.responseObject[index];
                        return FavoritesCard(
                            favoritesBaseModel: favoritesBaseModel);
                      })),
                );
        },
      ),
    );
  }
}
