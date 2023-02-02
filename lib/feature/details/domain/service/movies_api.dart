import 'package:flutter_cartelera/core/domain/model/api_result.dart';

import '../models/movieid.dart';

abstract class MovieApi {
  Future<ApiResult<Movieid>> getTrailer(String id);
  Future<ApiResult<Movieid>> getMovieid(String id);
}
