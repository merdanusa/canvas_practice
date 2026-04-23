import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HabbitCard extends StatelessWidget {
  const HabbitCard({
    super.key,
    required this.name,
    required this.description,
    required this.createdAt,
    required this.frequency,
  });

  final String name;
  final String description;
  final DateTime createdAt;
  final int frequency;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.push('/draw/${name}');
      },
      child: Column(
        children: [
          Text(name, style: Theme.of(context).textTheme.headlineLarge),
          Text(description, style: Theme.of(context).textTheme.bodyMedium),
          Text(
            'Created at: ${createdAt.toLocal()}',
            style: Theme.of(context).textTheme.bodySmall,
          ),
          Text(
            'Frequency: $frequency times/day',
            style: Theme.of(context).textTheme.bodySmall,
          ),
        ],
      ),
    );
  }
}
