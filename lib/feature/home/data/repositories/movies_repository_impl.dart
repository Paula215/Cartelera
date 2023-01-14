import 'package:flutter_cartelera/core/domain/model/api_error.dart';
import 'package:flutter_cartelera/feature/home/domain/models/trending_movies.dart';
import 'package:flutter_cartelera/feature/home/domain/repositories/movies_repository.dart';
import 'package:flutter_cartelera/feature/home/domain/services/movies_api.dart';

class MoviesRepositoryImpl implements MoviesRepository {
  MoviesRepositoryImpl(this._api);

  final MoviesApi _api;

  @override
  Future<TrendingMovies?> getTrendingMovies() async {
    final apiResult = await _api.getTrendingMovies();
    return apiResult.when(
        success: (data) => data,
        failure: (statusCode, errors) => throw SubmitError(statusCode, errors));
  }
}
