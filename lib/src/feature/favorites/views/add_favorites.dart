import 'package:esports_cuba/src/feature/favorites/bloc/search/search_cubit.dart';
import 'package:esports_cuba/src/feature/favorites/constants/category_search.dart';
import 'package:esports_cuba/src/models/player_base_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../constants.dart';
import '../../../../resources/general_styles.dart';
import '../../../../resources/images.dart';
import '../../../shared/loading_app.dart';
import '../../../shared/widgets/empty_data_message.dart';
import '../bloc/favorites/favorites_cubit.dart';
import '../widgets/search_section.dart';
import 'package:esports_cuba/src/shared/utils.dart';
import 'package:esports_cuba/src/shared/extensions.dart';
import '../widgets/add_bottom_category_section.dart.dart';

class AddFavorites extends StatelessWidget {
  const AddFavorites({super.key});

  @override
  Widget build(BuildContext context) {
    CategorySearch categorySearch = CategorySearch.EMPTY;
    return BlocProvider(
      create: (context) => SearchCubit(),
      child: Scaffold(
        appBar: Utils.appBarWidget(
            context: context, navigateBack: true, title: context.loc.favorites),
        body: BlocBuilder<SearchCubit, SearchState>(
          builder: (context, state) {
            if (state is SearchEmpty) {
              categorySearch = CategorySearch.EMPTY;
            } else if (state is SearchEmptyResults) {
              categorySearch = CategorySearch.EMPTYRESULT;
            } else if (state is SearchLoading) {
              categorySearch = CategorySearch.LOADING;
            } else if (state is SearchLoaded) {
              categorySearch = CategorySearch.LOADED;
            }
            return Stack(
              children: [
                Column(
                  children: [
                    SearchSection(categorySearch: categorySearch),
                    const AddBottomFavoritesSection(),
                  ],
                ),
                categorySearch != CategorySearch.EMPTY
                    ? Positioned(
                        top: 8.h,
                        left: 0,
                        right: 0,
                        child: Container(
                            height: 92.h,
                            color: GStyles.backGroundDarkColor,
                            child: state is SearchLoaded
                                ? ListView.builder(
                                    itemCount:
                                        state.apiResult.responseObject.length,
                                    itemBuilder: (context, index) {
                                      dynamic resultSearch =
                                          state.apiResult.responseObject[index];
                                      return Padding(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: Constants.MARGIN,
                                            vertical: 1.h),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Padding(
                                              padding: EdgeInsets.symmetric(
                                                  horizontal: Constants.MARGIN),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Container(
                                                    height: 28.sp,
                                                    width: 28.sp,
                                                    decoration:
                                                        const BoxDecoration(
                                                            shape: BoxShape
                                                                .circle),
                                                    child: ClipRRect(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              50),
                                                      child: FadeInImage
                                                          .assetNetwork(
                                                        placeholder:
                                                            Images.loadingGif,
                                                        image:
                                                            resultSearch.image,
                                                      ),
                                                    ),
                                                  ),
                                                  SizedBox(width: 4.w),
                                                  Expanded(
                                                      child: Text(
                                                    resultSearch
                                                            is PlayerBaseModel
                                                        ? resultSearch.nickname
                                                        : resultSearch.name,
                                                    style: context
                                                        .textTheme.bodyText1,
                                                    textAlign: TextAlign.start,
                                                  )),
                                                  BlocBuilder<FavoritesCubit,
                                                      FavoritesState>(
                                                    builder: (context, state) {
                                                      bool equalElement = Utils
                                                          .checkFavoriteInList(
                                                              dynamic:
                                                                  resultSearch,
                                                              listBaseModel: context
                                                                  .read<
                                                                      FavoritesCubit>()
                                                                  .listLocalFavs);
                                                      return state
                                                              is FavoritesLoading
                                                          ? const LoadingApp()
                                                          : GestureDetector(
                                                              onTap: () {
                                                                if (equalElement) {
                                                                  context
                                                                      .read<
                                                                          FavoritesCubit>()
                                                                      .removeLocalFavoriteToUser(
                                                                          resultSearch,
                                                                          context);
                                                                } else {
                                                                  context
                                                                      .read<
                                                                          FavoritesCubit>()
                                                                      .addLocalFavoriteToUser(
                                                                          resultSearch,
                                                                          context);
                                                                }
                                                              },
                                                              child: Container(
                                                                color: Colors
                                                                    .transparent,
                                                                child: Padding(
                                                                  padding:
                                                                      const EdgeInsets
                                                                              .all(
                                                                          8.0),
                                                                  child: FaIcon(
                                                                      equalElement
                                                                          ? FontAwesomeIcons
                                                                              .solidHeart
                                                                          : FontAwesomeIcons
                                                                              .heart,
                                                                      color: GStyles
                                                                          .colorPrimary,
                                                                      size: 19
                                                                          .sp),
                                                                ),
                                                              ),
                                                            );
                                                    },
                                                  )
                                                ],
                                              ),
                                            ),
                                            SizedBox(
                                              height: 1.h,
                                            ),
                                            index !=
                                                    state
                                                            .apiResult
                                                            .responseObject
                                                            .length -
                                                        1
                                                ? Container(
                                                    margin:
                                                        EdgeInsets.symmetric(
                                                            horizontal: 5.w),
                                                    child: const Divider(
                                                      color: Colors.white10,
                                                    ))
                                                : const SizedBox.shrink()
                                          ],
                                        ),
                                      );
                                    })
                                : state is SearchLoading
                                    ? const LoadingApp()
                                    : state is SearchEmptyResults
                                        ? EmptyDataMessage(
                                            message: context.loc.emptyResults,
                                          )
                                        : const SizedBox.shrink()))
                    : const SizedBox.shrink()
              ],
            );
          },
        ),
      ),
    );
  }
}
