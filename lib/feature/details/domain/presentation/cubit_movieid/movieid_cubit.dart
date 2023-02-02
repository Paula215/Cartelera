import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_cartelera/feature/details/domain/models/movieid.dart';
import 'package:injectable/injectable.dart';

import '../../../../../core/domain/model/api_error.dart';
import '../../usecase/movie_usecase.dart';
part 'movieid_state.dart';

@injectable
class MovieIdCubit extends Cubit<MovieIdState> {
  MovieIdCubit(this._movieUseCase) : super(MovieIdState.initial());
  final MovieidUseCase _movieUseCase;

  Future<void> getMovie(String id) async {
    emit(MovieIdState.loading());
    try {
      // final video = await _movieUseCase.getTrailer(id);
      final movieid = await _movieUseCase.getMovieid(id);

      final url =
          'https://www.youtube.com/watch?v=NRdoMn-v8b4&list=RDNRdoMn-v8b4&start_radio=1';

      emit(MovieIdState.sucessfull(movieid, url));
    } on ApiError catch (_) {
      emit(MovieIdState.error());
    }
  }
}
