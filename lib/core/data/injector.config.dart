// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:flutter_cartelera/core/data/config/config.dart' as _i13;
import 'package:flutter_cartelera/core/data/injectable_module.dart' as _i14;
import 'package:flutter_cartelera/core/domain/services/app_api.dart' as _i3;
import 'package:flutter_cartelera/feature/details/domain/presentation/cubit_movieid/movieid_cubit.dart'
    as _i12;
import 'package:flutter_cartelera/feature/details/domain/repositories/movies_repository.dart'
    as _i5;
import 'package:flutter_cartelera/feature/details/domain/service/movies_api.dart'
    as _i4;
import 'package:flutter_cartelera/feature/details/domain/usecase/movie_usecase.dart'
    as _i6;
import 'package:flutter_cartelera/feature/home/domain/presentation/cubit/cubit_upcoming_movies/upcoming_movies_cubit.dart'
    as _i11;
import 'package:flutter_cartelera/feature/home/domain/presentation/cubit/trending_movies_cubit/trending_movies_cubit.dart'
    as _i10;
import 'package:flutter_cartelera/feature/home/domain/repositories/movies_repository.dart'
    as _i8;
import 'package:flutter_cartelera/feature/home/domain/services/movies_api.dart'
    as _i7;
import 'package:flutter_cartelera/feature/home/domain/usecase/movies_usecase.dart'
    as _i9;
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
    gh.factory<_i4.MovieApi>(() => injectableModule.movieapi);
    gh.lazySingleton<_i5.MovieRepository>(
        () => registerRepositories.movieRepository());
    gh.factory<_i6.MovieidUseCase>(
        () => _i6.MovieidUseCaseImpl(gh<_i5.MovieRepository>()));
    gh.factory<_i7.MoviesApi>(() => injectableModule.movieApi);
    gh.lazySingleton<_i8.MoviesRepository>(
        () => registerRepositories.moviesRepository());
    gh.factory<_i9.MoviesUseCase>(
        () => _i9.MoviesUseCaseImpl(gh<_i8.MoviesRepository>()));
    gh.factory<_i10.TrendingMoviesCubit>(
        () => _i10.TrendingMoviesCubit(gh<_i9.MoviesUseCase>()));
    gh.factory<_i11.UpcomingMoviesCubit>(
        () => _i11.UpcomingMoviesCubit(gh<_i9.MoviesUseCase>()));
    gh.factory<_i12.MovieIdCubit>(
        () => _i12.MovieIdCubit(gh<_i6.MovieidUseCase>()));
    return this;
  }
}

class _$RegisterApi extends _i13.RegisterApi {}

class _$RegisterRepositories extends _i13.RegisterRepositories {}

class _$InjectableModule extends _i14.InjectableModule {}
