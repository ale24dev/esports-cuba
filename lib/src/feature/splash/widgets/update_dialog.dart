import 'package:esports_cuba/resources/general_styles.dart';
import 'package:esports_cuba/src/shared/extensions.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../constants.dart';
import '../../../models/version_base_model.dart';

class UpdateDialog extends StatelessWidget {
  const UpdateDialog({super.key, required this.versionBaseModel});

  ///Versión actual de la app
  final VersionBaseModel versionBaseModel;

  @override
  Widget build(BuildContext context) {
    int updateFeatures = versionBaseModel.features.length;
    double overSize = (updateFeatures < 4) ? updateFeatures * 55.w : 75.w;

    return Dialog(
      backgroundColor: GStyles.backGroundDarkColor,
      child: SizedBox(
        height: overSize,
        child: Padding(
          padding:
              EdgeInsets.symmetric(vertical: 3.h, horizontal: Constants.MARGIN),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(context.loc.newUpdate,
                      style: context.textTheme.headline3),
                  Text(versionBaseModel.version,
                      style: context.textTheme.headline4
                          ?.copyWith(color: GStyles.colorFail)),
                ],
              ),
              SizedBox(height: 3.h),
              Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: versionBaseModel.features.map((feature) {
                    return Text("▪ $feature",
                        style: context.textTheme.bodyText1
                            ?.copyWith(fontSize: 15.sp, color: Colors.grey));
                  }).toList()),
              const Spacer(),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                      alignment: Alignment.center,
                      child: ElevatedButton(
                          onPressed: () {}, child: Text(context.loc.update))),
                  SizedBox(width: 4.w),
                  !versionBaseModel.breakingChange
                      ? Container(
                          alignment: Alignment.center,
                          child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor:
                                    Colors.grey, // background (button) color
                                foregroundColor:
                                    Colors.white, // foreground (text) color
                              ),
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: Text(context.loc.close)))
                      : const SizedBox.shrink(),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
