import 'package:canvas_practice/screens/draw_screen.dart';
import 'package:canvas_practice/screens/main_screen.dart';
import 'package:go_router/go_router.dart';

final appRouter = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(path: '/', builder: (context, state) => const MainScreen()),
    GoRoute(
      path: '/draw',
      builder: (context, state) => const DrawScreen(),
      routes: [
        GoRoute(
          path: ':habitName',
          builder: (context, state) =>
              DrawScreen(name: state.pathParameters['habitName']!),
        ),
      ],
    ),
  ],
);
