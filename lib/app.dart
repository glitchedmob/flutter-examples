import 'package:dialed_health/screens/launch_screen.dart';
import 'package:dialed_health/services/navigation_service.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

final routes = {
  LaunchScreen.route: (context) => LaunchScreen(),
};


class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final navService = GetIt.I.get<NavigationService>();

    return MaterialApp(
      navigatorKey: navService.navigatorKey,
      routes: routes,
      initialRoute: LaunchScreen.route,
    );
  }
}
