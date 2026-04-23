class Habit {
  final String name;
  final String description;
  bool isFinished;
  final int frequency;
  final double addictionLevel;

  Habit({
    required this.name,
    required this.description,
    required this.isFinished,
    required this.frequency,
    required this.addictionLevel,
  }) : assert(
         addictionLevel >= 0.0 && addictionLevel <= 1.0,
         'addictionLevel must be between 0.0 and 1.0',
       );
}
