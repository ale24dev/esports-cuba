import 'package:esports_cuba/src/feature/auth/bloc/auth_cubit.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import 'package:esports_cuba/src/shared/extensions.dart';
import 'package:esports_cuba/resources/general_styles.dart';
import 'package:esports_cuba/src/shared/constants/auth_type.dart';

class GenericTextField extends StatefulWidget {
  const GenericTextField({
    Key? key,
    required this.hintText,
    required this.icon,
    required this.bloc,
    required this.authType,
  }) : super(key: key);

  ///Texto a mostrar en el TextField.
  final String hintText;

  ///Icono a mostrar en el TextField.
  final Icon icon;

  ///Tipo de textField.
  final AuthType authType;

  ///Instancia del cubit
  final AuthCubit bloc;

  @override
  State<GenericTextField> createState() => _GenericTextFieldState();
}

class _GenericTextFieldState extends State<GenericTextField> {
  bool notVisiblePassword = true;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10.w, vertical: 1.h),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(5),
          boxShadow: const [
            BoxShadow(blurRadius: 1, color: Colors.black12, spreadRadius: 1)
          ]),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12.0),
        child: TextFormField(
          onChanged: widget.authType == AuthType.email
              ? widget.bloc.changeEmail
              : widget.bloc.changePassword,
          obscureText:
              widget.authType == AuthType.password && notVisiblePassword
                  ? true
                  : false,
          style: context.textTheme.bodyText1?.copyWith(
              color: Colors.black,
              fontSize: 16.sp,
              fontFamily: GStyles.fontTeko),
          decoration: InputDecoration(
              //counterText: snapshot.data.toString(),
              labelText: widget.hintText,
              labelStyle: const TextStyle(color: Colors.black),
              prefixIcon: widget.icon,
              suffixIcon: widget.authType == AuthType.password
                  ? IconButton(
                      onPressed: () {
                        setState(() {
                          notVisiblePassword = !notVisiblePassword;
                        });
                      },
                      icon: const Icon(
                        Icons.remove_red_eye,
                        color: Colors.black,
                      ))
                  : const SizedBox.shrink(),
              hintStyle: const TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w500,
                  fontSize: 30),
              focusedBorder: const UnderlineInputBorder(
                  borderSide:
                      BorderSide(color: Colors.transparent, width: 1.0)),
              enabledBorder: const UnderlineInputBorder(
                  borderSide:
                      BorderSide(color: Colors.transparent, width: 1.0))),
        ),
      ),
    );
  }
}
