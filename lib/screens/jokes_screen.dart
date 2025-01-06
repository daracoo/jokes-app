import 'package:flutter/material.dart';
import '../models/joke.dart';
import '../services/api.dart';

class JokesScreen extends StatelessWidget {
  final String jokeType;
  final Function(Joke) toggleFavorite;
  final bool Function(Joke) isFavorite;

  const JokesScreen({
    required this.jokeType,
    required this.toggleFavorite,
    required this.isFavorite,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          '$jokeType Jokes',
          style: const TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.deepPurple,
      ),
      body: FutureBuilder<List<Joke>>(
        future: ApiService.fetchJokesByType(jokeType),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(
              child: Text(
                'Error: ${snapshot.error}',
                style: const TextStyle(color: Colors.red, fontSize: 18),
              ),
            );
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(
              child: Text(
                'No jokes found.',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
              ),
            );
          } else {
            final jokes = snapshot.data!;
            return ListView.builder(
              itemCount: jokes.length,
              itemBuilder: (context, index) {
                final joke = jokes[index];
                return Card(
                  margin: const EdgeInsets.all(8.0),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                  elevation: 4,
                  child: ListTile(
                    title: Text(
                      joke.setup,
                      style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    subtitle: Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: Text(
                        joke.punchline,
                        style: const TextStyle(fontSize: 16, fontStyle: FontStyle.italic),
                      ),
                    ),
                    trailing: IconButton(
                      icon: Icon(
                        isFavorite(joke) ? Icons.favorite : Icons.favorite_border,
                        color: isFavorite(joke) ? Colors.red : Colors.grey,
                      ),
                      onPressed: () => toggleFavorite(joke),
                    ),
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }
}
