import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:moviedb_flutter/model/reponse/genres_response.dart';
import 'package:moviedb_flutter/services.dart';

part 'genre_state.dart';

class GenreCubit extends Cubit<GenreState> {
  GenreCubit() : super(GenreState([], false));

  Future<void> fetchGenres() async {
    print("Calling fetch genres cubit");
    final response = await Services().fetchGenres();
    if (response != null) {
      var newState = state;
      newState.genres = response.genres;
      newState.isLoaded = true;
      print("Emiting results");
      emit(newState);
    }
  }
}
