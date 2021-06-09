import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../widgets/movie_item.dart';
import '../providers/movies_provider.dart';

class MovieDetailPage extends StatefulWidget {
  static const routeName = '/movie-detail';

  @override
  _MovieDetailPageState createState() => _MovieDetailPageState();
}

class _MovieDetailPageState extends State<MovieDetailPage> {
  @override
  Widget build(BuildContext context) {
    final movieId = ModalRoute.of(context)!.settings.arguments as int;
    final loadedMovie =
        Provider.of<Movies>(context, listen: false).findById(movieId);
    return Scaffold(
      appBar: AppBar(
        title: Text(loadedMovie['title']),
      ),
      body: FutureBuilder(
        future:
            Provider.of<Movies>(context, listen: false).selectMovie(movieId),
        builder: (ctx, movieSnapshot) {
          if (movieSnapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else {
            if (movieSnapshot.error != null) {
              return Center(
                child: Text('An error occured!'),
              );
            } else {
              return Consumer<Movies>(
                builder: (ctx, movieData, child) =>
                    movieData.movieDetails.length == 0
                        ? Center(
                            child: Text('There are no details available.'),
                          )
                        : MovieItem(movieData.movieDetails),
              );
            }
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.favorite_border),
        onPressed: () {
          Provider.of<Movies>(context, listen: false).addToFavorites(
            loadedMovie['id'],
            loadedMovie['title'],
            loadedMovie['overview'],
            loadedMovie['release_date'],
            loadedMovie['popularity'],
            true,
          );
        },
      ),
    );
  }
}
