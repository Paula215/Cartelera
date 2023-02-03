import 'package:flutter_cartelera/core/domain/model/api_result.dart';
import 'package:flutter_cartelera/feature/details/domain/models/trailer.dart';

import '../models/movieid.dart';

abstract class MovieApi {
  Future<ApiResult<Trailer>> getTrailer(String id);
  Future<ApiResult<Movieid>> getMovieid(String id);
}
