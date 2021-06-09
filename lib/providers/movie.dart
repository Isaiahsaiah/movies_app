import 'package:flutter/foundation.dart';

class Movie with ChangeNotifier {
  final int id;
  final String overview;
  final double popularity;
  final String releaseDate;
  final String title;
  bool isFavorite;

  Movie({
    this.id = 0,
    this.overview = '',
    this.popularity = 0.0,
    this.releaseDate = '',
    this.title = '',
    this.isFavorite = false,
  });

  // void _setFavValue(bool newValue) {
  //   isFavorite = newValue;
  //   notifyListeners();
  // }

  // Future<void> toggleFavoriteStatus() async {
  //   final oldStatus = isFavorite;
  //   isFavorite = !isFavorite;
  //   notifyListeners();
  //   final url =
  //       'https://flutter-movies-4ba76-default-rtdb.asia-southeast1.firebasedatabase.app/movies/$id.json';
  //   try {
  //     final response = await http.patch(
  //       Uri.parse(url),
  //       body: json.encode({
  //         'isFavorite': isFavorite,
  //       }),
  //     );
  //     if (response.statusCode >= 400) {
  //       _setFavValue(oldStatus);
  //     }
  //   } catch (error) {
  //     _setFavValue(oldStatus);
  //   }
  // }
}
