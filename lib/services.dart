import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:moviedb_flutter/model/movielist_response.dart';
import 'model/genres_response.dart';

class Services {
  Future<GenresResponse?> fetchGenres() async {
    final response = await http.get(Uri.parse(
        'https://api.themoviedb.org/3/genre/movie/list?api_key=52f66e7ba6b8f4b3b79b9625b47b7861'));

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
        'https://api.themoviedb.org/3/discover/movie?api_key=52f66e7ba6b8f4b3b79b9625b47b7861&with_genres=' +
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
}
