import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:esports_cuba/src/models/match_base_model.dart';

import '../../../../locator.dart';
import '../../../shared/repository/ApiResult.dart';
import '../../../repositories/roster_repository.dart';

part 'roster_state.dart';

class RosterCubit extends Cubit<RosterState> {
  RosterCubit() : super(RosterInitial());

  void getRosterByTeamTournament(MatchBaseModel match) async {
    emit(RosterLoading());

    ApiResult apiResult =
        await serviceLocator<RosterRepository>().getRostersByMatch(match);

    if (apiResult.error == null) {
      if (apiResult.responseObject.isEmpty) {
        emit(RosterEmpty());
      } else {
        emit(RosterLoaded(apiResult: apiResult));
      }
    } else {
      emit(RosterError(apiResult: apiResult));
    }
  }
}
