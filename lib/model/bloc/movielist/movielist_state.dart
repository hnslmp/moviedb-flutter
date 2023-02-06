part of 'movielist_cubit.dart';

class MovieListState extends Equatable {
  Genre genre;
  List<MovieObject> movieList;
  bool isLoaded;

  MovieListState(this.genre, this.movieList, this.isLoaded);

  @override
  List<Object> get props => [this.movieList];
}
