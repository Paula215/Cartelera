import 'package:flutter_cartelera/feature/home/domain/models/trending_movies.dart';

import '../models/upcoming_movies.dart';

abstract class MoviesRepository {
  Future<TrendingMovies?> getTrendingMovies();
  Future<UpcomingMovies?> getUpcomingMovies();
}
