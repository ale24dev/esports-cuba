import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:esports_cuba/constants.dart';
import 'package:esports_cuba/src/shared/extensions.dart';
import 'package:esports_cuba/resources/general_styles.dart';
import 'package:esports_cuba/src/feature/drawer/cubit/drawer_cubit.dart';

class LogOutSection extends StatelessWidget {
  const LogOutSection({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
          color: GStyles.containerDarkColor,
          borderRadius: BorderRadius.circular(5.0)),
      child: InkWell(
        onTap: () {
          context.read<DrawerCubit>().logOut(context);
        },
        child: Padding(
          padding: EdgeInsets.symmetric(
              vertical: 2.h,
              horizontal: Constants.MARGIN),
          child: Row(
            mainAxisAlignment:
                MainAxisAlignment.spaceBetween,
            children: [
              Text(context.loc.logout,
                  style: context.textTheme.bodyText1
                      ?.copyWith(fontSize: 16.sp)),
              FaIcon(
                FontAwesomeIcons.rightFromBracket,
                size: 18.sp,
              )
            ],
          ),
        ),
      ),
    );
  }
}
