import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:video_player/video_player.dart';
import 'package:wedding_pitch/old/test_screen.dart';
import 'package:wedding_pitch/screen/album_screen.dart';
import 'package:wedding_pitch/screen/gallery_screen.dart';
import 'package:wedding_pitch/screen/main_navigation_page.dart';

final GoRouter router = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const MainNavigationPage(),
      routes: [
        GoRoute(
          path: 'gallery',
          pageBuilder: (context, state) => MaterialPage(
            key: state.pageKey,
            child: GalleryScreen(
              videoController: state.extra as VideoPlayerController,
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
