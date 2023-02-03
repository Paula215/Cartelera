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
      final videoresponse = await _movieUseCase.getTrailer(id);
      final movieid = await _movieUseCase.getMovieid(id);
      final idyutu = videoresponse?.results[0].key;
      final url = 'https://www.youtube.com/watch?v=$idyutu';
      print(idyutu);

      emit(MovieIdState.sucessfull(movieid, url));
    } on ApiError catch (_) {
      emit(MovieIdState.error());
    }
  }
}
