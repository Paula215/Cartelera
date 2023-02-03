import 'package:flutter_cartelera/core/domain/model/api_result.dart';
import 'package:flutter_cartelera/feature/details/domain/models/trailer.dart';

import '../../../../core/data/services/api_request.dart';
import '../../../../core/domain/model/request.dart';
import '../../domain/models/movieid.dart';
import '../../domain/service/movies_api.dart';

class MovieApiImpl implements MovieApi {
  @override
  Future<ApiResult<Trailer>> getTrailer(String id) async => request(
        ApiRequest.get(
            'https://api.themoviedb.org/3/movie/$id/videos?api_key=964085f4fd433d1a9da9fa8dea8e4e4c'),
        (j) => Trailer.fromMap(j),
      );
  @override
  Future<ApiResult<Movieid>> getMovieid(String id) async => request(
        ApiRequest.get(
            'https://api.themoviedb.org/3/movie/$id?api_key=964085f4fd433d1a9da9fa8dea8e4e4c'),
        (j) => Movieid.fromJson(j),
      );
}
