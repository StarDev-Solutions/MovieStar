import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:moviestar/src/authentication/presentation/controllers/media_controller.dart';
import 'package:moviestar/src/core/route.dart';
import 'package:moviestar/src/core/theme/ui_helpers/ui_helper.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

void main() {
  final WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  ///Mantendo a splashscreen na tela.
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

  runApp(const MainApp());
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (_, _, _) {
        return FutureBuilder(
          future: _precacheImages(context),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) FlutterNativeSplash.remove();

            return GetMaterialApp(
              title: 'Movies Star',
              debugShowCheckedModeBanner: false,
              theme: Style.material3Theme,
              getPages: Pages.pages,
              initialRoute: Routes.mainRoute,
              initialBinding: BindingsBuilder(() {
                Get.put(MediaController());
              }),
            );
          }
        );
      },
    );
  }

  ///Método para realizar o carregamento das imagens em cache.
  Future<void> _precacheImages(BuildContext context) async {
    await Future.wait([
      precacheImage(const AssetImage('assets/images/placeholder_image.png'), context),
    ]);
  }
}
