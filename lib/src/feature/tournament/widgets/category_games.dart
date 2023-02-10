import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import 'package:esports_cuba/src/shared/extensions.dart';
import 'package:esports_cuba/src/shared/loading_app.dart';
import 'package:esports_cuba/resources/general_styles.dart';
import 'package:esports_cuba/src/models/game_base_model.dart';
import 'package:esports_cuba/src/shared/repository/ApiResult.dart';
import 'package:esports_cuba/src/feature/tournament/bloc/game_cubit.dart';
import 'package:esports_cuba/src/feature/tournament/bloc/tournament_cubit.dart';

class CategoryGames extends StatelessWidget {
  late ApiResult apiResultGame;

  CategoryGames({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GameCubit, GameState>(
      builder: (context, state) {
        if (state is GameLoaded) {
          apiResultGame = state.apiResult;
        }
        return state is GameLoading
            ? const LoadingApp()
            : SizedBox(
                height: 9.h,
                child: Center(
                  child: Padding(
                    padding: EdgeInsets.all(5.sp),
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: apiResultGame.responseObject.length,
                      itemBuilder: (context, index) {
                        GameBaseModel gameBaseModel =
                            apiResultGame.responseObject[index];
                        // return GameCard(gameBaseModel: gameBaseModel);
                        return index == 0
                            ? Row(
                                children: [
                                  GameCard(
                                      index: index,
                                      apiResult: apiResultGame,
                                      isSelected: state is GameLoaded &&
                                          index == state.indexSelected),
                                  GameCard(
                                      gameBaseModel: gameBaseModel,
                                      index: index + 1,
                                      apiResult: apiResultGame,
                                      isSelected: state is GameLoaded &&
                                          index + 1 == state.indexSelected)
                                ],
                              )
                            : Row(
                                children: [
                                  GameCard(
                                      gameBaseModel: gameBaseModel,
                                      index: index + 1,
                                      apiResult: apiResultGame,
                                      isSelected: state is GameLoaded &&
                                          index + 1 == state.indexSelected),
                                ],
                              );
                      },
                    ),
                  ),
                ),
              );
      },
    );
  }
}

class GameCard extends StatelessWidget {
  const GameCard({
    Key? key,
    this.gameBaseModel,
    required this.index,
    required this.apiResult,
    required this.isSelected,
  }) : super(key: key);

  ///Juego a mostrar
  final GameBaseModel? gameBaseModel;

  ///Posición en la lista de categorías
  final int index;

  ///bandera para saber si la categoría está seleccionada
  final bool isSelected;

  ///Lista de juegos para no volver a cargar todos los juegos al refrescar el estado del cubit
  final ApiResult apiResult;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 1.5.w),
          decoration: BoxDecoration(
              color: isSelected
                  ? GStyles.colorPrimary
                  : GStyles.containerDarkColor,
              borderRadius: BorderRadius.circular(5),
              boxShadow: const [
                BoxShadow(color: Colors.black12, blurRadius: 2, spreadRadius: 2)
              ]),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              gameBaseModel == null ? "Todos" : gameBaseModel!.name,
              style: context.textTheme.bodyText1?.copyWith(
                  color: isSelected ? Colors.white : Colors.grey,
                  fontWeight: isSelected ? FontWeight.bold : FontWeight.normal),
            ),
          ),
        ),
        onTap: () {
          context.read<GameCubit>().changeIndexSelected(apiResult, index);

          ///Cargamos los torneos en dependencia de la categoría seleccionada
          if (gameBaseModel != null) {
            context
                .read<TournamentCubit>()
                .loadTournamentByGame(gameBaseModel!);
          } else {
            context.read<TournamentCubit>().loadTournaments();
          }
        });
  }
}
