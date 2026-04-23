import 'package:canvas_practice/logic/constants/theme.dart';
import 'package:canvas_practice/screens/main_screen.dart';
import 'package:flutter/material.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MainScreen(),
      title: 'Habit Tracker',
      theme: appTheme,
      themeMode: ThemeMode.system,
    );
  }
}
