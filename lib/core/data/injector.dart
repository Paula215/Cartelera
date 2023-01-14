import 'dart:io';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_cartelera/core/data/injector.config.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

GetIt getIt = GetIt.instance;

@InjectableInit(preferRelativeImports: false)
Future<void> configure(String environment) async {
  if (Platform.isIOS || Platform.isAndroid) {
    await Firebase.initializeApp();
  }
  getIt.init(environment: environment);
}
