import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../shared/utils.dart';
import '../../../shared/widgets/empty_data_message.dart';
import '../bloc/favorites_cubit.dart';
import '../widgets/favorites_card.dart';
import '../../../shared/loading_app.dart';
import '../../../shared/repository/ApiResult.dart';
import 'package:esports_cuba/src/shared/extensions.dart';

class ManageFavorites extends StatelessWidget {
  late ApiResult apiResult;

  ManageFavorites({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Utils.appBarWidget(context: context, navigateBack: false),
      body: BlocBuilder<FavoritesCubit, FavoritesState>(
        builder: (context, state) {
          if (state is FavoritesLoaded) {
            apiResult = state.apiResult;
          }
          return state is FavoritesLoading
              ? const Center(
                  child: LoadingApp(),
                )
              : state is FavoritesEmpty
                  ? EmptyDataMessage(message: context.loc.emptyFavsUser)
                  : state is FavoritesLoaded
                      ? Container(
                          margin: EdgeInsets.symmetric(vertical: 2.h),
                          child: ListView.builder(
                            itemCount: apiResult.responseObject.length,
                            itemBuilder: (context, index) {
                              var favorite = apiResult.responseObject[index];
                              return FavoritesCard(
                                  favorite: favorite,
                                  index: index,
                                  isLastIndex: index ==
                                      apiResult.responseObject.length - 1);
                            },
                          ),
                        )
                      : state is FavoritesError
                          ? Center(
                              child: Text(state.apiResult.message!,
                                  style: context.textTheme.bodyText1))
                          : Center(
                              child: Text(context.loc.unexpectedError,
                                  style: context.textTheme.bodyText1),
                            );
        },
      ),
    );
  }
}
