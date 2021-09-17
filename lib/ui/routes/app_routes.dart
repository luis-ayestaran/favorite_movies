import 'package:flutter/material.dart';

import 'package:bloc_movies/ui/screens/screens.dart';

Map<String, WidgetBuilder> getAppRoutes() => {
  '/'           :   (_) => MovieListScreen(),
  'movie_list'  :   (_) => MovieListScreen(),
};