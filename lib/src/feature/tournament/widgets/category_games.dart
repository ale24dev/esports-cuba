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
                height: 9.5.h,
                child: Center(
                  child: Padding(
                    padding: EdgeInsets.all(8.sp),
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
                                      selected: state is GameLoaded &&
                                          index == state.indexSelected),
                                  GameCard(
                                      gameBaseModel: gameBaseModel,
                                      index: index + 1,
                                      apiResult: apiResultGame,
                                      selected: state is GameLoaded &&
                                          index + 1 == state.indexSelected)
                                ],
                              )
                            : GameCard(
                                gameBaseModel: gameBaseModel,
                                index: index + 1,
                                apiResult: apiResultGame,
                                selected: state is GameLoaded &&
                                    index + 1 == state.indexSelected);
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
    required this.selected,
  }) : super(key: key);

  ///Juego a mostrar
  final GameBaseModel? gameBaseModel;

  ///Posición en la lista de categorías
  final int index;

  ///bandera para saber si la categoría está seleccionada
  final bool selected;

  ///Lista de juegos para no volver a cargar todos los juegos al refrescar el estado del cubit
  final ApiResult apiResult;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        child: Container(
          decoration: BoxDecoration(
              color:
                  selected ? GStyles.colorPrimary : GStyles.backGroundDarkColor,
              borderRadius: BorderRadius.circular(10),
              boxShadow: const [
                BoxShadow(color: Colors.black12, blurRadius: 4, spreadRadius: 4)
              ]),
          margin: EdgeInsets.symmetric(vertical: 2.h, horizontal: 5.w),
          child: Padding(
            padding: EdgeInsets.all(12.sp),
            child: Text(gameBaseModel == null ? "Todos" : gameBaseModel!.name,
                textAlign: TextAlign.center,
                style: context.textTheme.headline5),
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
