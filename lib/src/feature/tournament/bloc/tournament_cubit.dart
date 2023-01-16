import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:esports_cuba/locator.dart';

import 'package:esports_cuba/src/models/game_base_model.dart';
import 'package:esports_cuba/src/shared/repository/ApiResult.dart';
import 'package:esports_cuba/src/repositories/tournament_repository.dart';

part 'tournament_state.dart';

class TournamentCubit extends Cubit<TournamentState> {
  TournamentCubit() : super(TournamentInitial());

  ///Cargamos todos los torneos
  void loadTournaments() async {
    emit(TournamentLoading());
    ApiResult apiResult =
        await serviceLocator<TournamentRepository>().getAllTournaments();
    if (apiResult.error == null) {
      if (apiResult.responseObject.length == 0) {
        TournamentEmpty();
      } else {
        emit(TournamentLoaded(apiResult: apiResult));
      }
    }
  }

  ///Cargamos todos los torneos
  void loadTournamentByGame(GameBaseModel game) async {
    emit(TournamentLoading());
    ApiResult apiResult =
        await serviceLocator<TournamentRepository>().getTournamentsByGame(game);
    emit(TournamentLoaded(apiResult: apiResult));
  }
}
