import 'package:flutter_cartelera/feature/details/domain/models/movieid.dart';

abstract class MovieRepository {
  Future<Movieid?> getMovieid(String id);
  Future<Movieid?> getTrailer(String id);
}
