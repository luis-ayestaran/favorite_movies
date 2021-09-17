import 'package:bloc_movies/utils/type_aliases.dart';

class ItemModel {

  late int _page;
  late int _totalResults;
  late int _totalPages;
  List<_Result> _results = [];

  ItemModel.fromJson( JSON parsedJson ) {
    //print(parsedJson['results'].length);
    _page = parsedJson['page'];
    _totalResults = parsedJson['total_results'];
    _totalPages = parsedJson['total_pages'];

    List<dynamic> _jsonResults = parsedJson['results'];
    _results = _jsonResults.map((result) => _Result(
      result
    )).toList();
  }

  List<_Result> get results => _results;
  int get totalPages => _totalPages;
  int get totalResults => _totalResults;
  int get page => _page;

}

class _Result {

  late int _voteCount;
  late int _id;
  late bool _video;
  late num _voteAverage;
  late String _title;
  late double _popularity;
  late String _posterPath;
  late String _originalLanguage;
  late String _originalTitle;
  List<int> _genreIds = [];
  late String _backdropPath;
  late bool _adult;
  late String _overview;
  late String _releaseDate;

  _Result(result) {
    _voteCount = result['vote_count'];
    _id = result['id'];
    _video = result['video'];
    _voteAverage = result['vote_average'];
    _title = result['title'];
    _popularity = result['popularity'];
    _posterPath = result['poster_path'];
    _originalLanguage = result['original_language'];
    _originalTitle = result['original_title'];
    List<dynamic> _jsonGenreIds = result['genre_ids'];
    _genreIds = _jsonGenreIds.map((genre_id) => genre_id as int
    ).toList();
    _backdropPath = result['backdrop_path'];
    _adult = result['adult'];
    _overview = result['overview'];
    _releaseDate = result['release_date'];
  }

  String get releaseDate => _releaseDate;
  String get overview => _overview;
  bool get adult => _adult;
  String get backdrop_path => _backdropPath;
  List<int> get genre_ids => _genreIds;
  String get original_title => _originalTitle;
  String get original_language => _originalLanguage;
  String get poster_path => _posterPath;
  double get popularity => _popularity;
  String get title => _title;
  num get vote_average => _voteAverage;
  bool get video => _video;
  int get id => _id;
  int get vote_count => _voteCount;

}