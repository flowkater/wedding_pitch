import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:wedding_pitch/layout/page_layout.dart';
import 'package:wedding_pitch/screen/album_screen.dart';
import 'package:wedding_pitch/screen/main_navigation_page.dart';
import 'package:wedding_pitch/screen/root_screen.dart';
import 'package:wedding_pitch/old/test_screen.dart';

void main() {
  final GoRouter router = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => const RootScreen(),
        routes: [
          GoRoute(
            path: 'main-navigation',
            pageBuilder: (context, state) => CustomTransitionPage<void>(
              key: state.pageKey,
              child: const MainNavigationPage(),
              transitionDuration: const Duration(milliseconds: 500),
              transitionsBuilder:
                  (context, animation, secondaryAnimation, child) =>
                      FadeTransition(opacity: animation, child: child),
            ),
          ),
          GoRoute(
            path: 'album',
            pageBuilder: (context, state) => MaterialPage(
              key: state.pageKey,
              child: const AlbumScreen(),
              // builder: (context, state) => const AlbumScreen(),
              fullscreenDialog: true,
            ),
          ),
          GoRoute(
            path: 'test',
            builder: (context, state) => const TestScreen(),
          ),
        ],
      )
    ],
  );

  runApp(
    WeddingPitchApp(
      goRouter: router,
    ),
  );
}

class WeddingPitchApp extends StatelessWidget {
  final GoRouter goRouter;

  const WeddingPitchApp({
    required this.goRouter,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerDelegate: goRouter.routerDelegate,
      routeInformationParser: goRouter.routeInformationParser,
      routeInformationProvider: goRouter.routeInformationProvider,
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

        // fontFamily: 'HappinessSansRegular',
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
