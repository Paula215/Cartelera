import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

import 'package:flutter_cartelera/core/data/services/app_api_impl.dart';
import 'package:flutter_cartelera/core/domain/services/app_api.dart';
import 'package:flutter_cartelera/feature/home/data/repositories/movies_repository_impl.dart';
import 'package:flutter_cartelera/feature/home/domain/repositories/movies_repository.dart';
import 'package:flutter_cartelera/feature/home/domain/services/movies_api.dart';

@module
abstract class RegisterApi {
  @lazySingleton
  AppApi api() => AppApiImpl();
}

@module
abstract class RegisterRepositories {
  @lazySingleton
  MoviesRepository moviesRepository() =>
      MoviesRepositoryImpl(GetIt.I.get<MoviesApi>());
}
