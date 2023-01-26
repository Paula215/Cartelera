import 'package:injectable/injectable.dart';

import 'package:flutter_cartelera/feature/home/domain/models/trending_movies.dart';
import 'package:flutter_cartelera/feature/home/domain/repositories/movies_repository.dart';

import '../models/upcoming_movies.dart';

abstract class MoviesUseCase {
  Future<TrendingMovies?> getTrendingMovies();
  Future<UpcomingMovies?> getUpcomingMovies();
}

@Injectable(as: MoviesUseCase)
class MoviesUseCaseImpl implements MoviesUseCase {
  MoviesUseCaseImpl(this._repository);

  final MoviesRepository _repository;

  @override
  Future<TrendingMovies?> getTrendingMovies() =>
      _repository.getTrendingMovies();

  @override
  Future<UpcomingMovies?> getUpcomingMovies() =>
      _repository.getUpcomingMovies();
}
