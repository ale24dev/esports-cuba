import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:esports_cuba/locator.dart';
import 'package:esports_cuba/src/repositories/news_repository.dart';

import 'package:esports_cuba/src/shared/repository/ApiResult.dart';

part 'news_state.dart';

class NewsCubit extends Cubit<NewsState> {
  NewsCubit() : super(NewsInitial());

  ///Cargamos todos los anuncios
  void loadNews() async {
    emit(NewsLoading());
    ApiResult apiResult =
        await serviceLocator<NewsRepository>().getAllAnnouncement();
    emit(NewsLoaded(apiResult: apiResult));
  }
}
