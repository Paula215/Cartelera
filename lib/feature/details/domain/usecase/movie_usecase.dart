import 'package:flutter_cartelera/feature/details/domain/models/trailer.dart';
import 'package:injectable/injectable.dart';

import '../models/movieid.dart';
import '../repositories/movies_repository.dart';

abstract class MovieidUseCase {
  Future<Movieid?> getMovieid(String id);
  Future<Trailer?> getTrailer(String id);
}

@Injectable(as: MovieidUseCase)
class MovieidUseCaseImpl implements MovieidUseCase {
  MovieidUseCaseImpl(this._repository);

  final MovieRepository _repository;

  @override
  Future<Movieid?> getMovieid(String id) => _repository.getMovieid(id);
  @override
  Future<Trailer?> getTrailer(String id) => _repository.getTrailer(id);
}
