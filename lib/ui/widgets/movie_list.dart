import 'package:flutter/material.dart';

import 'package:bloc_movies/models/item_model.dart';
import '../../blocs/movies_bloc.dart';

class MovieList extends StatelessWidget {
  const MovieList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    moviesBloc.fetchAllMovies();
    return StreamBuilder(
      stream: moviesBloc.allMovies,
      builder: (context, AsyncSnapshot<ItemModel> snapshot) {
        if (snapshot.hasData) {
          return buildList(snapshot);
        } else if (snapshot.hasError) {
          return Text(snapshot.error.toString());
        }
        return Center(child: CircularProgressIndicator());
      },
    );
  }

  Widget buildList(AsyncSnapshot<ItemModel> snapshot) {
    return GridView.builder(
      itemCount: snapshot.data!.results.length,
      gridDelegate:
          new SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
      itemBuilder: (BuildContext context, int index) {
        return Image.network(
          'https://image.tmdb.org/t/p/w185${snapshot.data!
              .results[index].poster_path}',
          fit: BoxFit.cover,
        );
      }
    );
  }
}