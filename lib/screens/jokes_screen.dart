import 'package:flutter/material.dart';
import '../services/api.dart';
import '../models/joke.dart';

class JokesScreen extends StatelessWidget {
  final String jokeType;

  const JokesScreen({required this.jokeType});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('$jokeType Jokes'),
      ),
      body: FutureBuilder<List<Joke>>(
        future: ApiService.fetchJokesByType(jokeType),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text('No jokes found.'));
          } else {
            final jokes = snapshot.data!;
            return ListView.builder(
              itemCount: jokes.length,
              itemBuilder: (context, index) {
                return Card(
                  margin: const EdgeInsets.all(8.0),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(jokes[index].setup, style: const TextStyle(fontSize: 21)),
                        const SizedBox(height: 9),
                        Text(jokes[index].punchline, style: const TextStyle(fontSize: 18)),
                      ],
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
