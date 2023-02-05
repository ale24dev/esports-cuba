import 'package:esports_cuba/src/feature/about/bloc/version_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../constants.dart';
import '../../../shared/loading_app.dart';
import '../../../shared/utils.dart';
import '../widgets/about_tile.dart';
import '../../../../resources/general_styles.dart';
import 'package:esports_cuba/src/shared/extensions.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: Utils.appBarWidget(
            context: context, navigateBack: true, title: context.loc.about),
        body: BlocBuilder<VersionCubit, VersionState>(
          builder: (context, state) {
            return state is VersionLoaded ? Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: EdgeInsets.symmetric(
                        vertical: 1.h, horizontal: Constants.MARGIN),
                    width: double.infinity,
                    decoration: BoxDecoration(
                        color: GStyles.containerDarkColor,
                        borderRadius: BorderRadius.circular(5.0)),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        AboutTile(
                          name: context.loc.version,
                          isLast: false,
                          description: state.version,
                        ),
                        AboutTile(name: context.loc.legal, isLast: false),
                        AboutTile(name: context.loc.visitUs, isLast: true),
                      ],
                    ),
                  )
                ]) : const Center(child: LoadingApp(),);
          },
        ));
  }
}
