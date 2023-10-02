import 'package:flutter/material.dart';
import 'package:news_app/resources/string_manager.dart';
import 'package:news_app/screens/allNews_screen/allNews_screen.dart';
import 'package:news_app/screens/business_screen/businessScreen.dart';
import 'package:news_app/screens/health_screen/health_screen.dart';
import 'package:news_app/screens/home_screen/HomeScreen.dart';
import 'package:news_app/screens/settings_screen/settings_screen.dart';
import 'package:news_app/screens/sports_screen/SportsScreen.dart';
import 'package:news_app/screens/worldNews_screen/WorldScreen.dart';

class AppRoutes {
  static const String splashRoute = '/';
  static const String homeRoute = '/home';
  static const String worldRoute = '/world';
  static const String businessRoute = '/business';
  static const String sportRoute = '/sport';
  static const String settingRoute = '/setting';
  static const String healthRoute = '/health';
  static const String allNews = '/all';
}

class RoutesManager {
  static Route<dynamic> getRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRoutes.allNews:
        return MaterialPageRoute(builder: (context) => const AllNewsScreen());
      case AppRoutes.worldRoute:
        return MaterialPageRoute(builder: (context) => const WorldScreen());
      case AppRoutes.homeRoute:
        return MaterialPageRoute(builder: (context) => const HomeScreen());
      case AppRoutes.businessRoute:
        return MaterialPageRoute(builder: (context) => const BusinessScreen());
      case AppRoutes.sportRoute:
        return MaterialPageRoute(builder: (context) => const SportsScreen());
      case AppRoutes.settingRoute:
        return MaterialPageRoute(builder: (context) => const SettingsScreen());
      case AppRoutes.healthRoute:
        return MaterialPageRoute(builder: (context) => const HealthScreen());
      default:
        return nonRoutes();
    }
  }

  static Route<dynamic> nonRoutes() {
    return MaterialPageRoute(
        builder: (context) => Scaffold(
              appBar: AppBar(
                title: const Text(AppString.nonRoute),
              ),
              body: const Center(child: Text(AppString.nonRoute)),
            ));
  }
}
