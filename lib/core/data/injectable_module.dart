import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

import 'package:flutter_cartelera/core/domain/services/app_api.dart';
import 'package:flutter_cartelera/feature/home/domain/services/movies_api.dart';

import '../../feature/details/domain/service/movies_api.dart';

@module
abstract class InjectableModule {
  MoviesApi get movieApi => GetIt.instance.get<AppApi>().movieApi;
  MovieApi get movieapi => GetIt.instance.get<AppApi>().movieapi;
}
