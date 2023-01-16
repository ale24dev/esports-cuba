import 'package:esports_cuba/src/shared/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import 'package:esports_cuba/src/shared/loading_app.dart';
import 'package:esports_cuba/src/models/news_base_model.dart';
import 'package:esports_cuba/src/shared/repository/ApiResult.dart';
import 'package:esports_cuba/src/feature/news/bloc/news_cubit.dart';
import 'package:esports_cuba/src/feature/news/widgets/news_card.dart';
import 'package:esports_cuba/src/shared/widgets/empty_data_message.dart';

class NewsScreen extends StatelessWidget {
  late ApiResult apiResult;
  NewsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NewsCubit, NewsState>(
      builder: (context, state) {
        if (state is NewsLoaded) {
          apiResult = state.apiResult;
        }

        return state is NewsLoading
            ? const LoadingApp()
            : state is NewsEmpty
                ? EmptyDataMessage(message: context.loc.emptyNews)
                : SizedBox(
                    height: 100.h,
                    width: 100.w,
                    child: ListView.builder(
                        itemCount: apiResult.responseObject.length,
                        itemBuilder: ((context, index) {
                          NewsBaseModel newsBaseModel =
                              apiResult.responseObject[index];

                          return NewsCard(newsBaseModel: newsBaseModel);
                        })),
                  );
      },
    );
  }
}
