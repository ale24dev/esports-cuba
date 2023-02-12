import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../../locator.dart';
import '../../../shared/repository/ApiResult.dart';
import '../../../models/tournament_base_model.dart';
import '../../../repositories/match_repository.dart';

part 'match_state.dart';

class MatchCubit extends Cubit<MatchState> {
  MatchCubit() : super(MatchInitial());

  void getMatchsByTournament(TournamentBaseModel tournament) async {
    emit(MatchLoading());

    ApiResult apiResult = await serviceLocator<MatchRepository>()
        .getMatchsByTournament(tournament);

    if (apiResult.error == null) {
      if (apiResult.responseObject.isEmpty) {
        emit(MatchEmpty());
      } else {
        emit(MatchLoaded(apiResult: apiResult));
      }
    } else {
      emit(MatchError(apiResult: apiResult));
    }
  }
}
