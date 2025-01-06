import 'package:flutter/material.dart';
import '../models/joke.dart';

class FavoritesScreen extends StatelessWidget {
  final Set<Joke> favorites;

  const FavoritesScreen({required this.favorites});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Favorite Jokes'),
        backgroundColor: Colors.redAccent,
      ),
      body: favorites.isEmpty
          ? const Center(
        child: Text(
          'No favorite jokes yet.',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
        ),
      )
          : ListView.builder(
        itemCount: favorites.length,
        itemBuilder: (context, index) {
          final joke = favorites.elementAt(index);
          return Card(
            margin: const EdgeInsets.all(8.0),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(joke.setup, style: const TextStyle(fontSize: 21)),
                  const SizedBox(height: 9),
                  Text(joke.punchline, style: const TextStyle(fontSize: 18)),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
