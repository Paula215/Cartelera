import 'package:flutter_cartelera/core/domain/model/api_result.dart';
import 'package:flutter_cartelera/feature/home/domain/models/trending_movies.dart';

import '../models/upcoming_movies.dart';

abstract class MoviesApi {
  Future<ApiResult<TrendingMovies>> getTrendingMovies();
  Future<ApiResult<UpcomingMovies>> getUpcomingMovies();
}
