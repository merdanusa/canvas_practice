import 'package:canvas_practice/logic/constants/theme.dart';
import 'package:canvas_practice/logic/routes/router.dart';
import 'package:flutter/material.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: appRouter,
      title: 'Habit Tracker',
      theme: appTheme,
      themeMode: ThemeMode.system,
    );
  }
}
