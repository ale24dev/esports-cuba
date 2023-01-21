import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import 'package:esports_cuba/src/shared/utils.dart';
import 'package:esports_cuba/src/shared/extensions.dart';
import 'package:esports_cuba/src/shared/loading_app.dart';
import 'package:esports_cuba/src/models/favorites_base_model.dart';
import 'package:esports_cuba/src/shared/repository/ApiResult.dart';
import 'package:esports_cuba/src/shared/widgets/empty_data_message.dart';
import 'package:esports_cuba/src/feature/bookmark/bloc/favorites_cubit.dart';
import 'package:esports_cuba/src/feature/bookmark/views/widgets/favorites_card.dart';

class FavoritesScreen extends StatefulWidget {
  FavoritesScreen({super.key});

  @override
  State<FavoritesScreen> createState() => _FavoritesScreenState();
}

class _FavoritesScreenState extends State<FavoritesScreen> {
  @override
  void initState() {
    BlocProvider.of<BookmarkCubit>(context).loadFavoritesByUser();
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
      body: BlocBuilder<BookmarkCubit, BookmarkState>(
        builder: (context, state) {
          if (state is FavoritesLoaded) {
            apiResult = state.apiResult;
          }
          return state is FavoritesLoading
              ? const LoadingApp()
              : state is FavoritesEmpty
                  ? EmptyDataMessage(message: context.loc.emptyFavsUser)
                  : state is FavoritesError
                      ? EmptyDataMessage(message: context.loc.unexpectedError)
                      : SizedBox(
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
