import 'package:flutter/material.dart';
import 'package:flutter_cartelera/core/data/injector.dart';
import 'package:flutter_cartelera/feature/home/domain/presentation/home_page.dart';

import 'feature/details/domain/presentation/detail_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await configure('dev');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      initialRoute: '/',
      routes: {
        '/': (context) => const HomePage(),
        'details': (context) => const DetailsPage(),
      },
    );
  }
}
