import 'package:injectable/injectable.dart';

import 'package:flutter_cartelera/feature/home/domain/models/trending_movies.dart';
import 'package:flutter_cartelera/feature/home/domain/repositories/movies_repository.dart';

abstract class MoviesUseCase {
  Future<TrendingMovies?> getTrendingMovies();
}

@Injectable(as: MoviesUseCase)
class MoviesUseCaseImpl implements MoviesUseCase {
  MoviesUseCaseImpl(this._repository);

  final MoviesRepository _repository;

  @override
  Future<TrendingMovies?> getTrendingMovies() =>
      _repository.getTrendingMovies();
}
