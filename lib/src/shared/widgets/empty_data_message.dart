import 'package:flutter/material.dart';

import 'package:esports_cuba/src/shared/extensions.dart';

class EmptyDataMessage extends StatelessWidget {
  const EmptyDataMessage({
    Key? key,
    required this.message,
  }) : super(key: key);

  ///texto a mostrar
  final String message;

  @override
  Widget build(BuildContext context) {
    return Center(child: Text(message, style: context.textTheme.bodyText1));
  }
}
