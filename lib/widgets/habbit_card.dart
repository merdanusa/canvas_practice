import 'package:canvas_practice/widgets/arc_painter.dart';
import 'package:flutter/material.dart';

class HabbitCard extends StatelessWidget {
  const HabbitCard({
    super.key,
    required this.name,
    required this.description,
    required this.isFinished,
    required this.frequency,
    required this.addictionLevel,
    required this.onChanged,
  });

  final String name;
  final String description;
  final bool isFinished;
  final int frequency;
  final ValueChanged<bool> onChanged;
  final double addictionLevel;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Row(
          children: [
            CustomPaint(size: const Size(70, 70), painter: ArcPainter(0.7)),

            const SizedBox(width: 12),

            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(name, style: Theme.of(context).textTheme.titleLarge),
                  const SizedBox(height: 4),
                  Text(
                    description,
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                  const SizedBox(height: 6),
                  Text(
                    'Frequency: $frequency times/day',
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                ],
              ),
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
      ),
    );
  }
}
