import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:wedding_pitch/old/test_screen.dart';
import 'package:wedding_pitch/screen/album_screen.dart';
import 'package:wedding_pitch/screen/gallery_screen.dart';
import 'package:wedding_pitch/screen/main_navigation_page.dart';
import 'package:wedding_pitch/screen/root_screen.dart';

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
          path: 'gallery',
          pageBuilder: (context, state) => MaterialPage(
            key: state.pageKey,
            child: const GalleryScreen(
              isActive: true,
            ),
            fullscreenDialog: true,
          ),
        ),
        GoRoute(
            path: 'album',
            pageBuilder: (context, state) => CustomTransitionPage<void>(
                  child: const AlbumScreen(),
                  transitionDuration: const Duration(milliseconds: 500),
                  transitionsBuilder:
                      (context, animation, secondaryAnimation, child) {
                    const begin = Offset(1.0, 0.0);
                    const end = Offset.zero;
                    const curve = Curves.easeInOut;
                    var tween = Tween(begin: begin, end: end)
                        .chain(CurveTween(curve: curve));
                    var offsetAnimation = animation.drive(tween);

                    return SlideTransition(
                        position: offsetAnimation, child: child);
                  },
                )),
        GoRoute(
          path: 'test',
          builder: (context, state) => const TestScreen(),
        ),
      ],
    )
  ],
);
