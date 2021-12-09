import 'package:dialed_health/app.dart';
import 'package:dialed_health/services/auth_service.dart';
import 'package:dialed_health/services/navigation_service.dart';
import 'package:dialed_health/services/storage_service.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

void main() {
  // set up error tracking service
  registerServices();

  runApp(const App());
}

void registerServices() {
  // Get it registration
  GetIt.I.registerSingleton(NavigationService());
  GetIt.I.registerSingleton(StorageService());
  GetIt.I.registerSingleton(AuthService());
}
