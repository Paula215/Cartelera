import 'package:flutter_cartelera/feature/details/domain/models/movieid.dart';
import 'package:flutter_cartelera/feature/details/domain/models/trailer.dart';

abstract class MovieRepository {
  Future<Movieid?> getMovieid(String id);
  Future<Trailer?> getTrailer(String id);
}
