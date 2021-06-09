import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import './movie.dart';

const API_KEY = 'bb818941459adea1296cc692482099aa';

class Movies with ChangeNotifier {
  // map handler of response in SEARCH QUERY
  Map<String, dynamic> _items = {};
  // list handler of the results in _items
  List<dynamic> _results = [];
  // getter so we can use outside this class
  List<dynamic> get results {
    return [..._results];
  }

  Future<void> searchMovies(String movieTitle) async {
    final url =
        'https://api.themoviedb.org/3/search/movie?api_key=$API_KEY&query=$movieTitle';
    try {
      final response = await http.get(Uri.parse(url));
      final searchedMovie = json.decode(response.body);
      _items = searchedMovie;
      _results = _items['results'];
      print(_results);
      notifyListeners();
    } catch (error) {
      print(error);
      throw (error);
    }
  }

  // map handler of response in MOVIE DETAILS QUERY
  Map<String, dynamic> _movieDetails = {};
  // getter so we can use outside this class
  Map<String, dynamic> get movieDetails {
    return {..._movieDetails};
  }

  // list handler for genre inside movieDetails
  List<dynamic> _genres = [];
  // getter so we can display data outside this class
  List<dynamic> get genres {
    return [..._genres];
  }

  Future<void> selectMovie(int movieId) async {
    final url = 'https://api.themoviedb.org/3/movie/$movieId?api_key=$API_KEY';
    try {
      final response = await http.get(Uri.parse(url));
      final movieDetail = json.decode(response.body);
      _movieDetails = movieDetail;
      _genres = movieDetail['genres'];
      notifyListeners();
    } catch (error) {
      print(error);
      throw (error);
    }
  }

  dynamic findById(int id) {
    return _results.firstWhere((movie) => movie['id'] == id);
  }

  dynamic findByFavId(int id) {
    return _favoriteMovies.firstWhere((movie) => movie.id == id);
  }

  // empty list of Movie
  List<Movie> _favoriteMovies = [];
  // getter
  List<Movie> get favoriteMovies {
    return [..._favoriteMovies];
  }

  Future<void> addToFavorites(
    int movieId,
    String movieTitle,
    String movieOverview,
    String movieReleaseDate,
    double moviePopularity,
    bool movieFavorite,
  ) async {
    const url =
        'https://flutter-movies-4ba76-default-rtdb.asia-southeast1.firebasedatabase.app/movies.json';
    try {
      await http.post(
        Uri.parse(url),
        body: json.encode({
          'id': movieId,
          'title': movieTitle,
          'overview': movieOverview,
          'releaseDate': movieReleaseDate,
          'popularity': moviePopularity,
          'isFavorite': movieFavorite,
        }),
      );
      final newFavMovie = Movie(
        id: movieId,
        title: movieTitle,
        overview: movieOverview,
        releaseDate: movieReleaseDate,
        popularity: moviePopularity,
        isFavorite: movieFavorite,
      );
      _favoriteMovies.add(newFavMovie);
      notifyListeners();
    } catch (error) {
      print(error);
      throw error;
    }
  }

  Future<void> fetchFavoriteMovies() async {
    const url =
        'https://flutter-movies-4ba76-default-rtdb.asia-southeast1.firebasedatabase.app/movies.json';
    try {
      final response = await http.get(Uri.parse(url));
      final extractedData = json.decode(response.body) as Map<String, dynamic>;
      final List<Movie> loadedMovies = [];
      extractedData.forEach((id, data) {
        loadedMovies.add(
          Movie(
            id: data['id'],
            title: data['title'],
            overview: data['overview'],
            releaseDate: data['releaseDate'],
            popularity: data['popularity'],
            isFavorite: data['isFavorite'],
          ),
        );
      });
      _favoriteMovies = loadedMovies;
      notifyListeners();
    } catch (error) {
      print(error);
      throw error;
    }
  }
}
