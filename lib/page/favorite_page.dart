import 'package:flutter/material.dart';
import 'package:movies_app/page/movie_detail_page.dart';
import 'package:provider/provider.dart';

import '../widgets/main_drawer.dart';
import '../providers/movies_provider.dart';

class FavoritePage extends StatefulWidget {
  static const routeName = '/favorites';

  @override
  _FavoritePageState createState() => _FavoritePageState();
}

class _FavoritePageState extends State<FavoritePage> {
  var _isLoading = false;

  @override
  void initState() {
    setState(() {
      _isLoading = true;
    });
    Provider.of<Movies>(context, listen: false).fetchFavoriteMovies().then((_) {
      setState(() {
        _isLoading = false;
      });
    });
    super.initState();
  }

  void selectMovie(BuildContext ctx, int id) {
    Navigator.of(ctx).pushNamed(
      MovieDetailPage.routeName,
      arguments: id,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Favorites'),
      ),
      drawer: MainDrawer(),
      body: _isLoading
          ? Center(
              child: CircularProgressIndicator(),
            )
          : Consumer<Movies>(
              builder: (ctx, movieData, child) => ListView.builder(
                itemCount: movieData.favoriteMovies.length,
                itemBuilder: (ctx, i) {
                  return InkWell(
                    onTap: () {
                      selectMovie(context, movieData.favoriteMovies[i].id);
                    },
                    child: Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      elevation: 4,
                      margin: const EdgeInsets.all(10),
                      child: Column(
                        children: [
                          Stack(
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(15),
                                  topRight: Radius.circular(15),
                                ),
                                child: Container(
                                  height: 200,
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                    gradient: LinearGradient(
                                      colors: [
                                        Theme.of(context).accentColor,
                                        Theme.of(context).primaryColor,
                                      ],
                                      begin: Alignment.topLeft,
                                      end: Alignment.bottomRight,
                                    ),
                                  ),
                                ),
                              ),
                              Positioned(
                                bottom: 20,
                                left: 0,
                                child: Container(
                                  padding: EdgeInsets.symmetric(
                                    vertical: 5,
                                    horizontal: 20,
                                  ),
                                  width: 320,
                                  color: Colors.black54,
                                  child: Text(
                                    movieData.favoriteMovies[i].title,
                                    style: TextStyle(
                                      fontSize: 26,
                                      color: Colors.white,
                                    ),
                                    softWrap: true,
                                    overflow: TextOverflow.fade,
                                  ),
                                ),
                              ),
                              Positioned(
                                top: 20,
                                right: 0,
                                child: Container(
                                  padding: EdgeInsets.symmetric(
                                    vertical: 5,
                                    horizontal: 20,
                                  ),
                                  width: 320,
                                  child: Text(
                                    '${movieData.favoriteMovies[i].overview.split(' ')[0]} ${movieData.favoriteMovies[i].overview.split(' ')[1]} ${movieData.favoriteMovies[i].overview.split(' ')[2]} ${movieData.favoriteMovies[i].overview.split(' ')[3]} ${movieData.favoriteMovies[i].overview.split(' ')[4]} ${movieData.favoriteMovies[i].overview.split(' ')[5]}...',
                                    textAlign: TextAlign.right,
                                    style: TextStyle(
                                      fontSize: 18,
                                      color: Colors.black,
                                    ),
                                    softWrap: true,
                                    overflow: TextOverflow.fade,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.all(20),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Row(
                                  children: [
                                    Icon(Icons.calendar_today),
                                    SizedBox(width: 5),
                                    Text(movieData
                                        .favoriteMovies[i].releaseDate),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Icon(Icons.star_border_rounded),
                                    SizedBox(width: 5),
                                    Text(movieData.favoriteMovies[i].popularity
                                        .toStringAsFixed(2)),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
    );
  }
}
