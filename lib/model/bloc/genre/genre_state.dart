part of 'genre_cubit.dart';

class GenreState extends Equatable {
  List<Genre> genres;
  bool isLoaded;

  GenreState(this.genres, this.isLoaded);

  @override
  List<Object> get props => [this.genres];
}
