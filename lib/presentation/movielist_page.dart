import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moviedb_flutter/model/bloc/movielist/movielist_cubit.dart';
import 'package:moviedb_flutter/model/response/genres_response.dart';
import 'package:moviedb_flutter/presentation/moviedetail_page.dart';

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
                      child: Image.network(
                        state.movieList[index].posterUrl(),
                        loadingBuilder: (context, child, loadingProgress) {
                          if (loadingProgress == null) return child;
                          return Container(
                            height: 200,
                            width: 200,
                            child: Center(
                              child: CircularProgressIndicator(),
                            ),
                          );
                        },
                      ),
                    ),
                  );
                },
              ),
              replacement: const Center(
                child: CircularProgressIndicator(),
              ),
            );
          },
        ),
      ),
    );
  }
}
