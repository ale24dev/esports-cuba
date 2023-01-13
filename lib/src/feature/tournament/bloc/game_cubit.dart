import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import 'package:esports_cuba/locator.dart';
import 'package:esports_cuba/src/shared/repository/ApiResult.dart';
import 'package:esports_cuba/src/repositories/game_database_repository.dart';

part 'game_state.dart';

class GameCubit extends Cubit<GameState> {
  GameCubit() : super(GameInitial());

  //Cargamos todas los tipos de juegos
  void loadGames() async {
    emit(GameLoading());
    ApiResult apiResult =
        await serviceLocator<GameDatabaseRepository>().getAllGames();

    ///Emitimos los juegos cargados
    emit(GameLoaded(apiResult: apiResult, indexSelected: 0));
  }

  //Cambiamos la categoria seleccionada
  void changeIndexSelected(ApiResult apiResult, int indexSelected) async {
    ///Emitimos los juegos cargados
    emit(GameLoading());
    emit(GameLoaded(apiResult: apiResult, indexSelected: indexSelected));
  }
}
