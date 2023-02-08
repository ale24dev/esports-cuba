import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../../locator.dart';
import '../../../models/player_base_model.dart';
import '../../../shared/repository/ApiResult.dart';
import '../../../repositories/player_repository.dart';

part 'player_state.dart';

class PlayerCubit extends Cubit<PlayerState> {
  ///Lista de equipos
  late List<PlayerBaseModel> listPlayers;
  PlayerCubit() : super(PlayerInitial());

  void loadPlayers() async {
    ///Inicializamos la lista
    listPlayers = [];
    emit(PlayerLoading());
    ApiResult apiResult = await serviceLocator<PlayerRepository>().getAllPlayers();
    if (apiResult.error == null) {
      if (apiResult.responseObject.isEmpty) {
        emit(PlayerEmpty());
      } else {
        listPlayers.addAll(apiResult.responseObject);
        emit(PlayerLoaded(apiResult: apiResult));
      }
    } else {
      emit(PlayerError(apiResult: apiResult));
    }
  }
}
