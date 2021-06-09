import 'package:flutter/material.dart';

import '../widgets/main_drawer.dart';
import '../widgets/search_movie.dart';
import '../widgets/movies_list.dart';

class MoviesOverviewPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Movies App'),
      ),
      drawer: MainDrawer(),
      body: Container(
        child: Column(
          children: [
            SearchMovie(),
            Expanded(
              child: MoviesList(),
            ),
          ],
        ),
      ),
    );
  }
}
