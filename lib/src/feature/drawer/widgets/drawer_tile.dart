import 'package:esports_cuba/src/shared/extensions.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';


class DrawerTile extends StatelessWidget {
  final String icon;
  final double? width;
  final Color? color;
  final void Function()? onTap;
  final String textTitle;

  const DrawerTile(
      {Key? key,
      required this.icon,
      required this.textTitle,
      this.width,
      this.onTap,
      this.color})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        child: ListTile(
          leading: Image.asset(
            icon,
            width: width ?? 34,
            color: color,
          ),
          title: Text(
            textTitle,
            style: context.textTheme.headline5!
                .copyWith(color: Colors.black, fontSize: 18.sp),
          ),
        ),
      ),
    );
  }
}
