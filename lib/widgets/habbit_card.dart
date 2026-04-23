import 'package:canvas_practice/widgets/arc_painter.dart';
import 'package:flutter/material.dart';

class HabbitCard extends StatelessWidget {
  const HabbitCard({
    super.key,
    required this.name,
    required this.description,
    required this.isFinished,
    required this.frequency,
    required this.onChanged,
  });

  final String name;
  final String description;
  final bool isFinished;
  final int frequency;
  final ValueChanged<bool> onChanged;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              CustomPaint(size: const Size(80, 80), painter: ArcPainter(0.7)),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(name, style: Theme.of(context).textTheme.headlineMedium),
                  Text(
                    description,
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                  Text(
                    'Frequency: $frequency times/day',
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                ],
              ),
              Checkbox(
                value: isFinished,
                onChanged: (value) {
                  if (value != null) {
                    onChanged(value);
                  }
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
