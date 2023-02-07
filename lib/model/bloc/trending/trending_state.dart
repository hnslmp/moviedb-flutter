part of 'trending_cubit.dart';

class TrendingState extends Equatable {
  List<TrendingMovie> trendingMovies;
  bool isLoaded;

  TrendingState(this.trendingMovies, this.isLoaded);

  @override
  List<Object> get props => [this.trendingMovies];
}
