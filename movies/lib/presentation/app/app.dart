import 'package:flutter/material.dart';
import 'package:movies/main.dart';
import 'package:movies/presentation/list/movies_list_screen.dart';
import 'package:provider/provider.dart';

class App extends StatelessWidget {
  final InitialData data;

  const App({required this.data});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: data.providers,
      child: MaterialApp(
        title: "Movies App",
        home: MoviesListScreen(),
      ),
    );
  }
}
