import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:esports_cuba/locator.dart';
import 'package:esports_cuba/src/feature/tournament/bloc/tournament_cubit.dart';
import 'package:esports_cuba/src/models/tournament_base_model.dart';
import 'package:esports_cuba/src/repositories/tournament_repository.dart';

import '../../../../repositories/team_tournament_repository.dart';
import '../../../../shared/repository/ApiResult.dart';
import '../../constants/category_tournament_details.dart';

part 'tournament_details_state.dart';

class TournamentDetailsCubit extends Cubit<TournamentDetailsState> {
  TournamentDetailsCubit() : super(TournamentDetailsInitial());

  getTeamsByTournament(TournamentBaseModel tournament) async {
    emit(TournamentDetailsLoading());
    ApiResult apiResult = await serviceLocator<TeamTournamentRepository>()
        .getTeamsByTournament(tournament);

    if (apiResult.error == null) {
      if (apiResult.responseObject.length == 0) {
        emit(TournamentDetailsEmpty());
      }
      emit(TournamentDetailsLoaded(apiResult: apiResult));
    } else {
      emit(TournamentDetailsLoaded(apiResult: apiResult));
    }
  }
}
