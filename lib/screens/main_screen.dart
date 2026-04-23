import 'package:canvas_practice/logic/data/habit_data.dart';
import 'package:canvas_practice/logic/models/habit.dart';
import 'package:canvas_practice/widgets/habbit_card.dart';
import 'package:flutter/material.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final List<Habit> habits = habiData;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Habit Tracker')),
      body: ListView.builder(
        itemCount: habits.length,
        itemBuilder: (context, index) {
          final habit = habits[index];
          return HabbitCard(
            name: habit.name,
            description: habit.description,
            isFinished: habit.isFinished,
            frequency: habit.frequency,
            onChanged: (value) {
              setState(() {
                habit.isFinished = value!;
              });
            },
          );
        },
      ),
    );
  }
}
