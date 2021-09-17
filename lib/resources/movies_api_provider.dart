import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' show Client;
import '../models/item_model.dart';

class MoviesApiProvider {
  final Client _client = Client();
  final _apiKey = '155415cb210347aeb27c371c259a0bff';

  Future<ItemModel> fetchMovieList() async {
    print( 'entered' );
    final response = await _client.get(
      Uri.parse( 'http://api.themoviedb.org/3/movie/popular?api_key=$_apiKey' ),
    );
    print( response.body );
    if( response.statusCode == 200 ) {
      //If the call to the server was successful, parse the JSON
      return ItemModel.fromJson( jsonDecode( response.body ) );
    } else {
      //If that call wasn't successful, throw an error
      throw Exception( 'Failed to load movie post' );
    }
  }
}
