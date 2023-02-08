import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:esports_cuba/src/repositories/team_repository.dart';

import '../../../../locator.dart';
import '../../../shared/repository/ApiResult.dart';
import 'package:esports_cuba/src/models/team_base_model.dart';

part 'team_state.dart';

class TeamCubit extends Cubit<TeamState> {
  ///Lista de equipos
  late List<TeamBaseModel> listTeams;
  TeamCubit() : super(TeamInitial());

  void loadTeams() async {
    ///Inicializamos la lista
    listTeams = [];
    emit(TeamLoading());
    ApiResult apiResult = await serviceLocator<TeamRepository>().getAllTeams();

    if (apiResult.error == null) {
      if (apiResult.responseObject.isEmpty) {
        emit(TeamEmpty());
      } else {
        listTeams.addAll(apiResult.responseObject);
        emit(TeamLoaded(apiResult: apiResult));
      }
    } else {
      emit(TeamError(apiResult: apiResult));
    }
  }
}
