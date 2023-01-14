import 'package:flutter_cartelera/core/domain/model/client.dart';
import 'package:flutter_cartelera/core/domain/services/app_api.dart';

import 'package:flutter_cartelera/feature/home/data/services/movies_api_impl.dart';
import 'package:flutter_cartelera/feature/home/domain/services/movies_api.dart';

class AppApiImpl implements AppApi {
  AppApiImpl() {
    Client.instance.init(
        baseUrl: 'https://api.themoviedb.org/3/',
        headers: {'Content-Type': 'application/json', 'Accept-Language': 'en'});
  }

  @override
  MoviesApi get movieApi => MoviesApiImpl();
}
