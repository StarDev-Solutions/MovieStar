import 'package:flutter/material.dart';
import 'package:frontend/src/authentication/presentation/pages/detail_page.dart';
import 'package:frontend/src/authentication/presentation/pages/home_page.dart';
import 'package:frontend/src/authentication/presentation/pages/main_page.dart';

const String mainPage = '/mainPage';
const String homePage = '/homePage';
const String detailPage = '/detailPage';

class CustomRouter {
  static final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  static Route<dynamic>? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case mainPage:
        return MaterialPageRoute(settings: settings, builder: (context) => MainPage());
      case homePage:
        return MaterialPageRoute(settings: settings, builder: (context) => HomePage());
      case detailPage:
        return MaterialPageRoute(settings: settings, builder: (context) => DetailPage());
    }
    return null;
  }
}