import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import 'package:flutter_cartelera/core/domain/model/api_error.dart';
import 'package:flutter_cartelera/feature/home/domain/models/trending_movies.dart';
import 'package:flutter_cartelera/feature/home/domain/usecase/movies_usecase.dart';
part 'trending_movies_state.dart';

@injectable
class TrendingMoviesCubit extends Cubit<TrendingMoviesState> {
  TrendingMoviesCubit(this._moviesUseCase)
      : super(TrendingMoviesState.initial());

  final MoviesUseCase _moviesUseCase;

  Future<void> getTrendingMovies() async {
    emit(TrendingMoviesState.loading());
    try {
      final movies = await _moviesUseCase.getTrendingMovies();
      final results = movies?.results ?? [];
      emit(TrendingMoviesState.sucessfull(results));
    } on ApiError catch (_) {
      emit(TrendingMoviesState.error());
    }
  }
}
