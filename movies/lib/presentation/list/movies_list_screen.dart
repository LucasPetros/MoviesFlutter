import 'package:flutter/material.dart';
import 'package:movies/data/repository/movies_repository.dart';
import 'package:movies/domain/model/movie.dart';
import 'package:provider/provider.dart';

class MoviesListScreen extends StatefulWidget {
  @override
  State<MoviesListScreen> createState() => _MoviesListScreen();
}

class _MoviesListScreen extends State<MoviesListScreen> {
  @override
  Widget build(BuildContext context) {
    final moviesRepo = Provider.of<MoviesRepository>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text("UpcomingMovies"),
      ),
      body: FutureBuilder<List<Movie>>(
        future: moviesRepo.getUpcomingMovies(limit: 10, page:1),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView(
              children: List.generate(snapshot.data!.length, (index) =>
                  ListTile(title: Text(snapshot.data![index].title),
                  ),
              ),
            );
          } else {
            return const LinearProgressIndicator();
          }
        },
      ),

    );
  }
}