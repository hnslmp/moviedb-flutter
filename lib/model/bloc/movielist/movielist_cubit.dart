import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:moviedb_flutter/model/response/genres_response.dart';
import 'package:moviedb_flutter/model/response/movielist_response.dart';
import 'package:moviedb_flutter/services.dart';

part 'movielist_state.dart';

class MovieListCubit extends Cubit<MovieListState> {
  MovieListCubit(Genre genre) : super(MovieListState(genre, [], false)) {
    fetchMovieList(genre);
  }

  Future<void> fetchMovieList(Genre genre) async {
    final response = await Services().fetchMovieList(genre.id, 1);
    var resultData = response?.results;
    if (resultData != null) {
      var newState = state;
      newState.movieList = resultData;
      newState.isLoaded = true;
      emit(newState);
    }
  }
}
