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
    final completedCount = habits.where((habit) => habit.isFinished).length;

    return Scaffold(
      appBar: AppBar(title: const Text('Habit Tracker')),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(12),
            child: Row(
              children: [
                Expanded(
                  child: _buildStatCard(
                    context,
                    title: "Total",
                    value: habits.length.toString(),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: _buildStatCard(
                    context,
                    title: "Completed",
                    value: completedCount.toString(),
                  ),
                ),
              ],
            ),
          ),

          Expanded(
            child: ListView.builder(
              itemCount: habits.length,
              itemBuilder: (context, index) {
                final habit = habits[index];

                return HabbitCard(
                  name: habit.name,
                  description: habit.description,
                  isFinished: habit.isFinished,
                  frequency: habit.frequency,
                  addictionLevel: habit.addictionLevel,
                  onChanged: (value) {
                    setState(() {
                      habit.isFinished = value;
                    });
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStatCard(
    BuildContext context, {
    required String title,
    required String value,
  }) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: Theme.of(context).colorScheme.primary.withOpacity(0.1),
      ),
      child: Column(
        children: [
          Text(value, style: Theme.of(context).textTheme.headlineMedium),
          const SizedBox(height: 4),
          Text(title, style: Theme.of(context).textTheme.titleSmall),
        ],
      ),
    );
  }
}
