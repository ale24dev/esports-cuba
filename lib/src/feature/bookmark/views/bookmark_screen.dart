import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import 'package:esports_cuba/src/shared/utils.dart';
import 'package:esports_cuba/src/shared/extensions.dart';
import 'package:esports_cuba/src/shared/loading_app.dart';
import 'package:esports_cuba/src/models/bookmark_base_model.dart';
import 'package:esports_cuba/src/shared/repository/ApiResult.dart';
import 'package:esports_cuba/src/shared/widgets/empty_data_message.dart';
import 'package:esports_cuba/src/feature/bookmark/bloc/bookmark_cubit.dart';
import 'package:esports_cuba/src/feature/bookmark/views/widgets/bookmark_card.dart';

class BookmarkScreen extends StatelessWidget {
  const BookmarkScreen({super.key});

  @override
  Widget build(BuildContext context) {
    
    late ApiResult apiResult;
    return Scaffold(
      appBar: Utils.appBarWidget(
          context: context,
          title: context.loc.bookmark,
          navigateBack: true,
          actions: [
            Padding(
                padding: EdgeInsets.only(right: 2.w),
                child: Center(child: Text(context.loc.deleteAll, style: context.textTheme.bodyText1?.copyWith(fontSize: 14.sp),)))
          ]),
      body: BlocBuilder<BookmarkCubit, BookmarkState>(
        builder: (context, state) {
          if (state is BookmarkLoaded) {
            apiResult = state.apiResult;
          }
          return state is BookmarkLoading
              ? const LoadingApp()
              : state is BookmarkEmpty
                  ? EmptyDataMessage(message: context.loc.emptyFavsUser)
                  : state is BookmarkError
                      ? EmptyDataMessage(message: context.loc.unexpectedError)
                      : SizedBox(
                          height: 100.h,
                          child: ListView.builder(
                              itemCount: apiResult.responseObject.length,
                              itemBuilder: ((context, index) {
                                BookmarkBaseModel bookmarkBaseModel =
                                    apiResult.responseObject[index];
                                return BookmarkCard(
                                    bookmarkBaseModel: bookmarkBaseModel);
                              })),
                        );
        },
      ),
    );
  }
}
