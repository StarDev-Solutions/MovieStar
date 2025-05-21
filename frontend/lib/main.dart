import 'package:flutter/material.dart';
import 'package:frontend/src/core/route.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

void main() {
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
        return GetMaterialApp(
          title: 'Movies Star',
          debugShowCheckedModeBanner: false,
          initialRoute: mainPage,
          onGenerateRoute: CustomRouter.onGenerateRoute,
        );
      },
    );
  }
}
