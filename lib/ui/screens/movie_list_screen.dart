import 'package:flutter/material.dart';

import 'package:bloc_movies/ui/widgets/widgets.dart' show MovieList;

class MovieListScreen extends StatefulWidget {
  MovieListScreen({Key? key}) : super(key: key);

  @override
  _MovieListScreenState createState() => _MovieListScreenState();
}

class _MovieListScreenState extends State<MovieListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Popular Movies'),
        centerTitle: true,
      ),
      body: MovieList(),
    );
  }
}