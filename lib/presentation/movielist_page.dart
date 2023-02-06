import 'package:flutter/material.dart';
import 'package:moviedb_flutter/model/reponse/genres_response.dart';
import 'package:moviedb_flutter/model/reponse/movielist_response.dart';
import 'package:moviedb_flutter/presentation/moviedetail_page.dart';
import '../services.dart';

class MovieListPage extends StatefulWidget {
  final Genre genre;

  const MovieListPage({super.key, required this.genre});

  @override
  State<MovieListPage> createState() => _MovieListPageState(genre: this.genre);
}

class _MovieListPageState extends State<MovieListPage> {
  final Genre genre;

  _MovieListPageState({required this.genre});

  List<MovieObject> movieList = [];

  MovieListResponse? movieListResponse;
  var isLoaded = false;

  @override
  void initState() {
    super.initState();
    fetchMovieList();
  }

  fetchMovieList() async {
    movieListResponse = await Services().fetchMovieList(genre.id, 1);
    var resultData = movieListResponse?.results;
    if (resultData != null) {
      setState(() {
        movieList.addAll(resultData);
        isLoaded = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(genre.name + " genre movies"),
      ),
      body: Visibility(
          visible: isLoaded,
          child: GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 20,
              mainAxisSpacing: 10,
            ),
            itemCount: movieList.length,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => MovieDetailPage(
                            movie: movieList[index],
                          )));
                },
                child: GridTile(
                  child: Image.network(movieList[index].posterUrl()),
                ),
              );
            },
          ),
          replacement: const Center(
            child: CircularProgressIndicator(),
          )),
    );
  }
}
