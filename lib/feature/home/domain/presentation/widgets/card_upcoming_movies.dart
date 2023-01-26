import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

import '../../models/upcoming_movies.dart';
import '../cubit/cubit_upcoming_movies/upcoming_movies_cubit.dart';

class UpcomingCard extends StatelessWidget {
  const UpcomingCard({
    Key? key,
    required this.movie,
  }) : super(key: key);

  final UpcomingMovie movie;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          GetIt.I.get<UpcomingMoviesCubit>()..getUpcomingMovies(),
      child: BlocBuilder<UpcomingMoviesCubit, UpcomingMoviesState>(
        builder: (context, state) {
          return InkWell(
            onTap: () {
              // Navigator.pushNamed(context, 'details', arguments: movie.id);
            },
            child: Container(
              width: 190,
              height: 400,
              margin: const EdgeInsets.only(left: 10),
              decoration: BoxDecoration(
                color: const Color(0xFF292B37),
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    color: const Color(0xFF292B37).withOpacity(0.5),
                    spreadRadius: 2,
                    blurRadius: 6,
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ClipRRect(
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(10),
                      topRight: Radius.circular(10),
                    ),
                    child: Image.network(
                      'https://image.tmdb.org/t/p/w500${movie.backdropPath}',
                      height: 250,
                      width: 300,
                      fit: BoxFit.cover,
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
