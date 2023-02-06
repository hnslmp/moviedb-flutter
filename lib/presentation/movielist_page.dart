import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moviedb_flutter/model/bloc/movielist/movielist_cubit.dart';
import 'package:moviedb_flutter/model/reponse/genres_response.dart';
import 'package:moviedb_flutter/model/reponse/movielist_response.dart';
import 'package:moviedb_flutter/presentation/moviedetail_page.dart';
import '../services.dart';

// class MovieListPage extends StatefulWidget {
//   final Genre genre;

//   const MovieListPage({super.key, required this.genre});

//   @override
//   State<MovieListPage> createState() => _MovieListPageState(genre: this.genre);
// }

// class _MovieListPageState extends State<MovieListPage> {
//   final Genre genre;

//   _MovieListPageState({required this.genre});

//   List<MovieObject> movieList = [];

//   MovieListResponse? movieListResponse;
//   var isLoaded = false;

//   @override
//   void initState() {
//     super.initState();
//     fetchMovieList();
//   }

//   fetchMovieList() async {
//     movieListResponse = await Services().fetchMovieList(genre.id, 1);
//     var resultData = movieListResponse?.results;
//     if (resultData != null) {
//       setState(() {
//         movieList.addAll(resultData);
//         isLoaded = true;
//       });
//     }
//   }

//   @override
//   Widget build(BuildContext context) {

//   }
// }

class MovieListPage extends StatelessWidget {
  final Genre selectedGenre;
  const MovieListPage({super.key, required this.selectedGenre});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => MovieListCubit(selectedGenre),
      child: Scaffold(
        appBar: AppBar(
          title: Text(selectedGenre.name + " genre movies"),
        ),
        body: BlocBuilder<MovieListCubit, MovieListState>(
          builder: (context, state) {
            return Visibility(
                visible: state.isLoaded,
                child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 20,
                    mainAxisSpacing: 10,
                  ),
                  itemCount: state.movieList.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => MovieDetailPage(
                                  movie: state.movieList[index],
                                )));
                      },
                      child: GridTile(
                        child:
                            Image.network(state.movieList[index].posterUrl()),
                      ),
                    );
                  },
                ),
                replacement: const Center(
                  child: CircularProgressIndicator(),
                ));
          },
        ),
      ),
    );
  }
}
