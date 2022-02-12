import 'package:farm_setu_assignment/modules/home-screen/home_screen.dart';
import 'package:farm_setu_assignment/modules/initial/initial_screen.dart';
import 'package:flutter/material.dart';

class Routes {
  //LOGIN
  static const String login = 'login';

  static const String register = 'register';

//HOME
  static const String home = 'home';

  //INITIAL
  static const String initial = 'initial';

  static Route<dynamic>? getGeneratedRoute(RouteSettings settings) {
    switch (settings.name) {
      case home:
        return MaterialPageRoute(
          settings: const RouteSettings(name: home),
          builder: (_) => const MyHomePage(),
        );

      case initial:
        return MaterialPageRoute(
          settings: const RouteSettings(name: initial),
          builder: (_) => const InitScreen(),
        );

      default:
        return null;
    }
  }
}
