import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import 'package:flutter_cartelera/feature/home/domain/usecase/movies_usecase.dart';

import '../../../../../../core/domain/model/api_error.dart';
import '../../../models/upcoming_movies.dart';
part 'upcoming_movies_state.dart';

@injectable
class UpcomingMoviesCubit extends Cubit<UpcomingMoviesState> {
  UpcomingMoviesCubit(this._moviesUseCase)
      : super(UpcomingMoviesState.initial());
  final MoviesUseCase _moviesUseCase;

  Future<void> getUpcomingMovies() async {
    emit(UpcomingMoviesState.loading());
    try {
      final movies = await _moviesUseCase.getUpcomingMovies();
      final results = movies?.results ?? [];
      if (!isClosed) {
        emit(UpcomingMoviesState.sucessfull(results));
      }
    } on ApiError catch (_) {
      emit(UpcomingMoviesState.error());
    }
  }
}
