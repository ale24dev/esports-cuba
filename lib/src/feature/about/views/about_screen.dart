import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../constants.dart';
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
        body: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
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
                AboutTile(name: context.loc.version, isLast: false, description: '1.0',),
                AboutTile(name: context.loc.legal, isLast: false),
                AboutTile(name: context.loc.visitUs, isLast: true),
              ],
            ),
          )
        ]));
  }
}
