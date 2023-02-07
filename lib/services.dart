import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:moviedb_flutter/model/bloc/constants.dart';
import 'package:moviedb_flutter/model/response/movielist_response.dart';
import 'package:moviedb_flutter/model/response/trendingmovie_response.dart';
import 'model/response/genres_response.dart';

class Services {
  Future<GenresResponse?> fetchGenres() async {
    final response = await http.get(Uri.parse(
        '${Constants.movieDbBaseApi}/genre/movie/list?api_key=${Constants.movieDbApiKey}'));

    if (response.statusCode == 200) {
      print("success");
      return GenresResponse.fromJson(jsonDecode(response.body));
    } else {
      print("failed");
      throw Exception('Failed to load album');
    }
  }

  Future<MovieListResponse?> fetchMovieList(int genreId, int page) async {
    final response = await http.get(Uri.parse(
        '${Constants.movieDbBaseApi}/discover/movie?api_key=${Constants.movieDbApiKey}&with_genres=' +
            genreId.toString() +
            '&page=1'));

    if (response.statusCode == 200) {
      print("success");
      return MovieListResponse.fromJson(jsonDecode(response.body));
    } else {
      print("failed");
      throw Exception('Failed to load album');
    }
  }

  Future<TrendingMovieResponse?> fetchTrendingMovies() async {
    final response = await http.get(Uri.parse(
        '${Constants.movieDbBaseApi}/trending/movie/day?api_key=${Constants.movieDbApiKey}'));

    if (response.statusCode == 200) {
      print("success");
      return TrendingMovieResponse.fromJson(jsonDecode(response.body));
    } else {
      print("failed");
      throw Exception('Failed to load album');
    }
  }
}
