import 'package:flutter/material.dart';

class JokeCard extends StatelessWidget {
  final String type;
  final VoidCallback onPress;

  const JokeCard({required this.type, required this.onPress});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Text(
            type,
            style: const TextStyle(fontSize: 21),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
