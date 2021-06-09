import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/movies_provider.dart';

class MovieItem extends StatelessWidget {
  final Map<String, dynamic> _movieDetails;

  MovieItem(this._movieDetails);

  @override
  Widget build(BuildContext context) {
    final movieData = _movieDetails;
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            color: Colors.grey[300],
            height: 150,
            width: double.infinity,
            child: Center(
              child: Text('No image available at the moment.'),
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 8,
            ),
            child: Text(
              movieData['title'],
              style: Theme.of(context).textTheme.headline1,
              textAlign: TextAlign.center,
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(
              horizontal: 16,
            ),
            child: Text(
              movieData['tagline'] == '' ? '-' : movieData['tagline'],
              textAlign: TextAlign.center,
            ),
          ),
          SizedBox(height: 8),
          Container(
            margin: const EdgeInsets.symmetric(
              horizontal: 16,
            ),
            width: double.infinity,
            child: Text(
              'Overview',
              style: TextStyle(
                fontSize: 16,
                color: Theme.of(context).accentColor,
              ),
              textAlign: TextAlign.left,
            ),
          ),
          SizedBox(height: 4),
          Container(
            margin: const EdgeInsets.symmetric(
              horizontal: 24,
            ),
            width: double.infinity,
            child: Text(
              movieData['overview'],
              style: TextStyle(
                fontSize: 14,
              ),
              textAlign: TextAlign.left,
            ),
          ),
          SizedBox(height: 8),
          Container(
            margin: const EdgeInsets.symmetric(
              horizontal: 16,
            ),
            width: double.infinity,
            child: Text(
              'Release Date',
              style: TextStyle(
                fontSize: 16,
                color: Theme.of(context).accentColor,
              ),
              textAlign: TextAlign.left,
            ),
          ),
          SizedBox(height: 4),
          Container(
            margin: const EdgeInsets.symmetric(
              horizontal: 24,
            ),
            width: double.infinity,
            child: Row(
              children: [
                Icon(Icons.calendar_today),
                SizedBox(width: 8),
                Text(
                  movieData['release_date'],
                  style: TextStyle(
                    fontSize: 14,
                  ),
                  textAlign: TextAlign.left,
                ),
              ],
            ),
          ),
          SizedBox(height: 8),
          Container(
            margin: const EdgeInsets.symmetric(
              horizontal: 16,
            ),
            width: double.infinity,
            child: Text(
              'Run Time',
              style: TextStyle(
                fontSize: 16,
                color: Theme.of(context).accentColor,
              ),
              textAlign: TextAlign.left,
            ),
          ),
          SizedBox(height: 4),
          Container(
            margin: const EdgeInsets.symmetric(
              horizontal: 24,
            ),
            width: double.infinity,
            child: Row(
              children: [
                Icon(Icons.timer),
                SizedBox(width: 8),
                Text(
                  '${movieData['runtime'].toString()} mins',
                  style: TextStyle(
                    fontSize: 14,
                  ),
                  textAlign: TextAlign.left,
                ),
              ],
            ),
          ),
          SizedBox(height: 8),
          Container(
            margin: const EdgeInsets.symmetric(
              horizontal: 16,
            ),
            width: double.infinity,
            child: Text(
              'Revenue',
              style: TextStyle(
                fontSize: 16,
                color: Theme.of(context).accentColor,
              ),
              textAlign: TextAlign.left,
            ),
          ),
          SizedBox(height: 4),
          Container(
            margin: const EdgeInsets.symmetric(
              horizontal: 24,
            ),
            width: double.infinity,
            child: Row(
              children: [
                Icon(Icons.attach_money_rounded),
                SizedBox(width: 8),
                Text(
                  '${movieData['revenue'].toString()}',
                  style: TextStyle(
                    fontSize: 14,
                  ),
                  textAlign: TextAlign.left,
                ),
              ],
            ),
          ),
          SizedBox(height: 8),
          Container(
            margin: const EdgeInsets.symmetric(
              horizontal: 16,
            ),
            width: double.infinity,
            child: Text(
              'Status',
              style: TextStyle(
                fontSize: 16,
                color: Theme.of(context).accentColor,
              ),
              textAlign: TextAlign.left,
            ),
          ),
          SizedBox(height: 4),
          Container(
            margin: const EdgeInsets.symmetric(
              horizontal: 24,
            ),
            width: double.infinity,
            child: Row(
              children: [
                Icon(Icons.info_outline),
                SizedBox(width: 8),
                Text(
                  movieData['status'],
                  style: TextStyle(
                    fontSize: 14,
                  ),
                  textAlign: TextAlign.left,
                ),
              ],
            ),
          ),
          SizedBox(height: 8),
          Container(
            margin: const EdgeInsets.symmetric(
              horizontal: 16,
            ),
            width: double.infinity,
            child: Text(
              'Rating',
              style: TextStyle(
                fontSize: 16,
                color: Theme.of(context).accentColor,
              ),
              textAlign: TextAlign.left,
            ),
          ),
          SizedBox(height: 4),
          Container(
            margin: const EdgeInsets.symmetric(
              horizontal: 24,
            ),
            width: double.infinity,
            child: Row(
              children: [
                Icon(Icons.star_border_rounded),
                SizedBox(width: 8),
                Text(
                  '${(movieData['vote_average'] * 10).toStringAsFixed(0)}%',
                  style: TextStyle(
                    fontSize: 14,
                  ),
                  textAlign: TextAlign.left,
                ),
              ],
            ),
          ),
          SizedBox(height: 8),
          Container(
            margin: const EdgeInsets.symmetric(
              horizontal: 16,
            ),
            width: double.infinity,
            child: Text(
              'Genre',
              style: TextStyle(
                fontSize: 16,
                color: Theme.of(context).accentColor,
              ),
              textAlign: TextAlign.left,
            ),
          ),
          SizedBox(height: 4),
          Container(
            height: 100,
            margin: const EdgeInsets.symmetric(
              horizontal: 24,
            ),
            width: double.infinity,
            child: Consumer<Movies>(
              builder: (ctx, genreData, child) => ListView.builder(
                itemCount: genreData.genres.length,
                itemBuilder: (ctx, i) => Text(
                  genreData.genres[i]['name'],
                  style: TextStyle(
                    fontSize: 14,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
