import 'package:canvas_practice/logic/data/habit_data.dart';
import 'package:canvas_practice/logic/models/habit.dart';
import 'package:canvas_practice/widgets/habbit_card.dart';
import 'package:flutter/material.dart';

class MainScreen extends StatelessWidget {
  MainScreen({super.key});

  final List<Habit> habits = habit_data;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          for (var habit in habits)
            HabbitCard(
              name: habit.name,
              description: habit.description,
              createdAt: habit.createdAt,
              frequency: habit.frequency,
            ),
        ],
      ),
    );
  }
}
