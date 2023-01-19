import 'package:flutter/material.dart';
import 'package:flutter_cartelera/feature/home/domain/presentation/widgets/header_home.dart';
import 'package:flutter_cartelera/feature/home/domain/presentation/widgets/search_home.dart';
import 'package:flutter_cartelera/feature/home/domain/presentation/widgets/upcoming_movies.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        body: SingleChildScrollView(
          child: SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                HeaderHome(),
                SearchHome(),
                SizedBox(height: 30),
                UpcomingMovies(),
                SizedBox(height: 30),
              ],
            ),
          ),
        ));
  }
}
