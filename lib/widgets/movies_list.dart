import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/movies_provider.dart';
import '../page/movie_detail_page.dart';

class MoviesList extends StatelessWidget {
  void _goToMovieDetailPage(BuildContext context, int movieId) {
    Navigator.of(context).pushNamed(
      MovieDetailPage.routeName,
      arguments: movieId,
    );
  }

  @override
  Widget build(BuildContext context) {
    final movies = Provider.of<Movies>(context);
    return movies.results.length == 0
        ? Center(
            child: Text('Looking for a movie? We got you!'),
          )
        : ListView.builder(
            itemCount: movies.results.length,
            itemBuilder: (ctx, i) {
              return Column(
                children: [
                  ListTile(
                    leading: CircleAvatar(
                      backgroundColor: Theme.of(context).accentColor,
                      radius: 30,
                      child: Text(movies.results[i]['title'][0]),
                    ),
                    title: Text(
                      movies.results[i]['title'],
                    ),
                    subtitle: Text(
                      movies.results[i]['release_date'] == ''
                          ? '-'
                          : '${movies.results[i]['release_date']}'
                              .split('-')[0],
                    ),
                    trailing: Container(
                      child: Column(
                        children: [
                          Icon(Icons.thumb_up_rounded),
                          Text(
                            movies.results[i]['vote_count'].toString(),
                          ),
                        ],
                      ),
                    ),
                    onTap: () {
                      _goToMovieDetailPage(
                        context,
                        movies.results[i]['id'],
                      );
                    },
                  ),
                  Divider(),
                ],
              );
            },
          );
  }
}
