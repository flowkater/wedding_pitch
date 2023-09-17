import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:wedding_pitch/layout/page_layout.dart';
import 'package:wedding_pitch/router.dart';

void main() {
  runApp(
    const WeddingPitchApp(),
  );
}

class WeddingPitchApp extends StatelessWidget {
  const WeddingPitchApp({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerDelegate: router.routerDelegate,
      routeInformationParser: router.routeInformationParser,
      routeInformationProvider: router.routeInformationProvider,
      scrollBehavior: AppScrollBehavior(),
      debugShowCheckedModeBanner: false,
      title: '이경 & 재우 결혼합니다',
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
        primaryColor: Colors.white,
        appBarTheme: const AppBarTheme(
          foregroundColor: Colors.black,
          backgroundColor: Colors.white,
          elevation: 0,
        ),
        fontFamily: 'Pretendard',
      ),
      builder: (context, child) {
        return PageLayout(
          body: child!,
        );
      },
    );
  }
}

class AppScrollBehavior extends MaterialScrollBehavior {
  @override
  Set<PointerDeviceKind> get dragDevices => {
        PointerDeviceKind.touch,
        PointerDeviceKind.mouse,
        PointerDeviceKind.trackpad,
      };
}
