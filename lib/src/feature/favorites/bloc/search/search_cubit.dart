import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../../../locator.dart';
import '../../../../repositories/search_repository.dart';
import '../../../../shared/repository/ApiResult.dart';

part 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  SearchCubit() : super(SearchInitial());

  void typingMesage(String text) async {
    if (text.isEmpty) {
      emit(SearchEmpty());
    } else {
      emit(SearchLoading());

      ApiResult apiResult =
          await serviceLocator<SearchRepository>().getResultSearch(text);
      if (apiResult.error == null) {
        if (apiResult.responseObject.isEmpty) {
          emit(SearchEmptyResults());
        } else {
          emit(SearchLoaded(apiResult: apiResult));
        }
      } else {
        emit(SearchError(apiResult: apiResult));
      }
    }
  }

  void cleanSearchEditingController() {
    emit(SearchEmpty());
  }
}
