// Created by Isaiah Panoga
// June 7, 2021 - 4:50 PM

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import './page/movies_overview_page.dart';
import './page/movie_detail_page.dart';
import './page/favorite_page.dart';
import './providers/movies_provider.dart';
import './providers/movie.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (ctx) => Movies(),
        ),
        ChangeNotifierProvider(
          create: (ctx) => Movie(),
        ),
      ],
      child: MaterialApp(
        title: 'Movies App',
        theme: ThemeData(
          primarySwatch: Colors.amber,
          accentColor: Colors.teal,
          canvasColor: Color.fromRGBO(255, 254, 229, 1),
          fontFamily: 'Lato',
          textTheme: ThemeData.light().textTheme.copyWith(
                headline1: TextStyle(
                  fontSize: 18,
                  fontFamily: 'Raleway',
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
        ),
        home: MoviesOverviewPage(),
        routes: {
          MovieDetailPage.routeName: (ctx) => MovieDetailPage(),
          FavoritePage.routeName: (ctx) => FavoritePage(),
        },
      ),
    );
  }
}

// Comments

// There are couple of things that the developer wasn't able to do.
// Fetch and display the image of the movie
// Toggle favorite status (almost close, keeps on having error on logic, should have focus on fixing/setting up the database/data model)
// Error on displaying movie details from favorites page