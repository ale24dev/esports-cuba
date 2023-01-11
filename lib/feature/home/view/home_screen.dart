import 'package:esports_cuba/resources/general_styles.dart';
import 'package:esports_cuba/src/shared/extensions.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text(context.loc.appTitle)),
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 2.w),
            child: const Icon(Icons.person),
          )
        ],
      ),
      drawer: Drawer(
        child: Text("Ale Díaz"),
      ),
      body: Container(
        height: 100,
        color: Colors.green,
      ),
    );
  }
}
