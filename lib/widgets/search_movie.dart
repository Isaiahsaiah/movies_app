import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/movies_provider.dart';

class SearchMovie extends StatefulWidget {
  const SearchMovie({Key? key}) : super(key: key);

  @override
  _SearchMovieState createState() => _SearchMovieState();
}

class _SearchMovieState extends State<SearchMovie> {
  final _controller = new TextEditingController();
  var _movieTitle = '';

  void _searchMovie() {
    FocusScope.of(context).unfocus();
    Provider.of<Movies>(context, listen: false).searchMovies(_movieTitle);
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8),
      padding: const EdgeInsets.all(8),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              controller: _controller,
              decoration: InputDecoration(
                labelText: 'Search for a movie...',
              ),
              onChanged: (value) {
                setState(() {
                  _movieTitle = value;
                });
              },
            ),
          ),
          SizedBox(width: 8),
          IconButton(
            onPressed: _movieTitle.trim().isEmpty ? null : _searchMovie,
            icon: Icon(Icons.search),
          ),
        ],
      ),
    );
  }
}
