// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:flutter_cartelera/core/data/config/config.dart' as _i6;
import 'package:flutter_cartelera/core/data/injectable_module.dart' as _i7;
import 'package:flutter_cartelera/core/domain/services/app_api.dart' as _i3;
import 'package:flutter_cartelera/feature/home/domain/repositories/movies_repository.dart'
    as _i5;
import 'package:flutter_cartelera/feature/home/domain/services/movies_api.dart'
    as _i4;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

/// ignore_for_file: unnecessary_lambdas
/// ignore_for_file: lines_longer_than_80_chars
extension GetItInjectableX on _i1.GetIt {
  /// initializes the registration of main-scope dependencies inside of [GetIt]
  _i1.GetIt init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final registerApi = _$RegisterApi();
    final injectableModule = _$InjectableModule();
    final registerRepositories = _$RegisterRepositories();
    gh.lazySingleton<_i3.AppApi>(() => registerApi.api());
    gh.factory<_i4.MoviesApi>(() => injectableModule.movieApi);
    gh.lazySingleton<_i5.MoviesRepository>(
        () => registerRepositories.moviesRepository());
    return this;
  }
}

class _$RegisterApi extends _i6.RegisterApi {}

class _$RegisterRepositories extends _i6.RegisterRepositories {}

class _$InjectableModule extends _i7.InjectableModule {}