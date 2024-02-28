import 'package:crypstore/src/res/strings.dart';
import 'package:crypstore/src/utils/router.dart';
import 'package:flutter/material.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: AppStrings.appName,
      theme: ThemeData.dark().copyWith(
        primaryColorDark: Colors.blue,
      ),
      routerConfig: router,
    );
  }
}