import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:moviedb_flutter/model/response/trendingmovie_response.dart';
import 'package:moviedb_flutter/services.dart';

part 'trending_state.dart';

class TrendingCubit extends Cubit<TrendingState> {
  TrendingCubit() : super(TrendingState([], false)) {
    fetchTrendingMovies();
  }

  Future<void> fetchTrendingMovies() async {
    print("Calling fetch trending movies cubit");
    final response = await Services().fetchTrendingMovies();
    if (response != null) {
      var newState = state;
      newState.trendingMovies = response.results;
      newState.isLoaded = true;
      print("Emiting results");
      emit(newState);
    }
  }
}
