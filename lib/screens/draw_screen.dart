import 'package:flutter/material.dart';

class DrawScreen extends StatelessWidget {
  const DrawScreen({super.key, this.name});

  final String? name;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: GestureDetector(
          onDoubleTap: () => Navigator.pop(context),
          child: Text(
            'Draw Screen',
            style: Theme.of(context).textTheme.headlineMedium,
          ),
        ),
      ),
    );
  }
}
