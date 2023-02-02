import 'package:flutter/material.dart';
import 'package:moviedb_flutter/model/movielist_response.dart';
import '../services.dart';

class MovieListPage extends StatefulWidget {
  const MovieListPage({super.key});

  @override
  State<MovieListPage> createState() => _MovieListPageState();
}

class _MovieListPageState extends State<MovieListPage> {
  MovieListResponse? movieListResponse;
  var isLoaded = false;

  @override
  void initState() {
    super.initState();
    fetchMovieList();
  }

  fetchMovieList() async {
    movieListResponse = await Services().fetchMovieList("Crime", 1);

    var results = movieListResponse?.results;

    if (results != null) {
      for (var result in results) {
        print(result.title);
      }
    }

    if (movieListResponse != null) {
      setState(() {
        isLoaded = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Select your movie"),
      ),
    );
  }
}
