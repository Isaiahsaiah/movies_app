import 'package:flutter/material.dart';

import '../page/favorite_page.dart';

class MainDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Container(
            height: 120,
            width: double.infinity,
            padding: EdgeInsets.all(21),
            alignment: Alignment.centerLeft,
            color: Theme.of(context).accentColor,
            child: Text(
              '#MoviesApp',
              style: TextStyle(
                fontWeight: FontWeight.w900,
                fontSize: 30,
                color: Theme.of(context).primaryColor,
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          ListTile(
            leading: Icon(
              Icons.movie_filter_outlined,
              color: Theme.of(context).accentColor,
              size: 26,
            ),
            title: Text(
              'Search',
              style: TextStyle(
                fontFamily: 'Lato',
                fontSize: 21,
                fontWeight: FontWeight.bold,
              ),
            ),
            onTap: () {
              Navigator.of(context).pushReplacementNamed(
                '/',
              );
            },
          ),
          ListTile(
            leading: Icon(
              Icons.favorite_rounded,
              color: Theme.of(context).accentColor,
              size: 26,
            ),
            title: Text(
              'Favorites',
              style: TextStyle(
                fontFamily: 'Lato',
                fontSize: 21,
                fontWeight: FontWeight.bold,
              ),
            ),
            onTap: () {
              Navigator.of(context).pushReplacementNamed(
                FavoritePage.routeName,
              );
            },
          ),
        ],
      ),
    );
  }
}
