import 'package:dialed_health/screens/dashboard_screen.dart';
import 'package:dialed_health/screens/login_screen.dart';
import 'package:dialed_health/services/auth_service.dart';
import 'package:dialed_health/services/navigation_service.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

class LaunchScreen extends StatefulWidget {
  static const route = '/launch';

  const LaunchScreen({Key? key}) : super(key: key);

  @override
  _LaunchScreenState createState() => _LaunchScreenState();
}

class _LaunchScreenState extends State<LaunchScreen> {
  final _authService = GetIt.I.get<AuthService>();
  final _navService = GetIt.I.get<NavigationService>();

  @override
  Widget build(BuildContext context) {
    return const CircularProgressIndicator();
  }


  @override
  void initState() {
    _init();
    super.initState();
  }


  Future _init() async {
    // await _configService.loadConfigFromStorage();
    // _configService.refreshConfig();

    if (await _authService.isLoggedIn()) {
      // navigate to dashboard
      _navService.current.pushNamed(DashboardScreen.route);

      return;
    }

    // navigate to login screen
    _navService.current.pushNamed(LoginScreen.route);
  }
}
