part of 'trending_movies_cubit.dart';

enum MoviesStatus {
  initial,
  loading,
  error,
  sucessfull,
}

class TrendingMoviesState extends Equatable {
  final MoviesStatus status;
  final List<TrendingMovie> movies;

  TrendingMoviesState.initial()
      : status = MoviesStatus.initial,
        movies = [];

  TrendingMoviesState.loading()
      : status = MoviesStatus.loading,
        movies = [];

  TrendingMoviesState.error()
      : status = MoviesStatus.error,
        movies = [];

  const TrendingMoviesState.sucessfull(List<TrendingMovie> data)
      : status = MoviesStatus.sucessfull,
        movies = data;

  @override
  List<Object> get props => [status, movies];
}
