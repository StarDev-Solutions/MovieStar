import 'package:get/get.dart';
import 'package:moviestar/src/authentication/presentation/pages/detail_page.dart';
import 'package:moviestar/src/authentication/presentation/pages/home_page.dart';
import 'package:moviestar/src/authentication/presentation/pages/main_page.dart';

abstract class Pages {
  static final pages = <GetPage>[
    GetPage(
      name: Routes.mainRoute,
      page: () => const MainPage(),
    ),
    GetPage(
      name: Routes.homeRoute,
      page: () => const HomePage(),
    ),
    GetPage(
      name: Routes.detailRoute,
      page: () => const DetailPage(),
    ),
  ];
}

abstract class Routes {
  static const String mainRoute = '/main';
  static const String homeRoute = '/home';
  static const String detailRoute = '/detail';
}
