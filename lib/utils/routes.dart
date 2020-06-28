import 'package:flutter/material.dart';
import 'package:flutterappdemo/ui/pages/details_page.dart';
import 'package:flutterappdemo/ui/pages/error_page.dart';
import 'package:flutterappdemo/ui/pages/home_page.dart';
import 'package:flutterappdemo/utils/constants.dart';

/// Class that holds both route names & generate methods.
/// Used by the Flutter routing system
class Routes {
  // Static route names
  static const home = '/';
  static const details = '/details';
  static const recent = '/recent';
  static const trending = '/trending';

  /// Methods that generate all routes
  static Route<dynamic> generateRoute(RouteSettings routeSettings) {
    try {
      final Map<String, dynamic> args = routeSettings.arguments;

      switch (routeSettings.name) {
        case home:
          return MaterialPageRoute(
            settings: routeSettings,
            builder: (_) => HomePage(),
          );

        case details:
          return MaterialPageRoute(
            settings: routeSettings,
            builder: (_) => DetailsPage(args[AppConstants.KEY_DATA]),
          );
        default:
          return errorRoute(routeSettings);
      }
    } catch (_) {
      return errorRoute(routeSettings);
    }
  }

  /// Method that calles the error screen when neccesary
  static Route<dynamic> errorRoute(RouteSettings routeSettings) => MaterialPageRoute(
      settings: routeSettings,
      builder: (_) => ErrorPage(),
    );
}
