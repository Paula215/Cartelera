import 'package:flutter_cartelera/feature/home/domain/services/movies_api.dart';

import '../../../feature/details/domain/service/movies_api.dart';

abstract class AppApi {
  MoviesApi get movieApi;
  MovieApi get movieapi;
}
