part of 'movieid_cubit.dart';

enum MovieIdStatus {
  initial,
  loading,
  error,
  sucessfull,
}

class MovieIdState extends Equatable {
  final MovieIdStatus status;
  final String url;
  final Movieid movie;

  MovieIdState.initial()
      : status = MovieIdStatus.initial,
        movie = Movieid.initial(),
        url = "";

  MovieIdState.loading()
      : status = MovieIdStatus.loading,
        url = "",
        movie = Movieid.initial();

  MovieIdState.error()
      : status = MovieIdStatus.error,
        url = "",
        movie = Movieid.initial();

  MovieIdState.sucessfull(Movieid? data, String urlData)
      : status = MovieIdStatus.sucessfull,
        url = urlData,
        movie = data ?? Movieid.initial();

  @override
  List<Object> get props => [status, movie, url];
}
