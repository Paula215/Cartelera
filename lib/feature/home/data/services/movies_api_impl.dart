import 'package:flutter_cartelera/core/data/services/api_request.dart';
import 'package:flutter_cartelera/core/domain/model/api_result.dart';
import 'package:flutter_cartelera/core/domain/model/request.dart';

import 'package:flutter_cartelera/feature/home/domain/models/trending_movies.dart';
import 'package:flutter_cartelera/feature/home/domain/services/movies_api.dart';

class MoviesApiImpl implements MoviesApi {
  @override
  Future<ApiResult<TrendingMovies>> getTrendingMovies() async => request(
        ApiRequest.get(
            'https://api.themoviedb.org/3/trending/movie/week?api_key=964085f4fd433d1a9da9fa8dea8e4e4c'),
        (j) => TrendingMovies.fromJson(j),
      );
}
