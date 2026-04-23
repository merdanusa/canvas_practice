class Habit {
  final String name;
  final String description;
  final DateTime createdAt;
  final int frequency;

  const Habit({
    required this.name,
    required this.description,
    required this.createdAt,
    required this.frequency,
  });
}
