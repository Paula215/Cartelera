import 'package:flutter_cartelera/core/domain/model/api_error.dart';
import 'package:flutter_cartelera/feature/details/domain/service/movies_api.dart';

import '../../domain/models/movieid.dart';
import '../../domain/repositories/movies_repository.dart';

class MovieRepositoryImpl implements MovieRepository {
  MovieRepositoryImpl(this._api);

  final MovieApi _api;

  @override
  Future<Movieid?> getMovieid(String id) async {
    final apiResult = await _api.getMovieid(id);
    return apiResult.when(
        success: (data) => data,
        failure: (statusCode, errors) => throw SubmitError(statusCode, errors));
  }

  @override
  Future<Movieid?> getTrailer(String id) async {
    final apiResult = await _api.getTrailer(id);
    return apiResult.when(
        success: (data) => data,
        failure: (statusCode, errors) => throw SubmitError(statusCode, errors));
  }
}
