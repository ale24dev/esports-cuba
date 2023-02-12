import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import 'package:esports_cuba/locator.dart';
import 'package:esports_cuba/src/models/tournament_base_model.dart';
import 'package:esports_cuba/src/models/team_tournament_base_model.dart';

import '../../../../repositories/team_tournament_repository.dart';
import '../../../../shared/repository/ApiResult.dart';

part 'tournament_details_state.dart';

class TournamentDetailsCubit extends Cubit<TournamentDetailsState> {
  late List<TeamTournamentBaseModel> listTeamTournament;
  TournamentDetailsCubit() : super(TournamentDetailsInitial());

  getTeamsByTournament(TournamentBaseModel tournament) async {
    listTeamTournament = [];
    emit(TournamentDetailsLoading());
    ApiResult apiResult = await serviceLocator<TeamTournamentRepository>()
        .getTeamsByTournament(tournament);

    if (apiResult.error == null) {
      if (apiResult.responseObject.length == 0) {
        emit(TournamentDetailsEmpty());
      }
      listTeamTournament = apiResult.responseObject;
      emit(TournamentDetailsLoaded(apiResult: apiResult));
    } else {
      emit(TournamentDetailsLoaded(apiResult: apiResult));
    }
  }
}
