import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:wedding_pitch/old/test_screen.dart';
import 'package:wedding_pitch/screen/album_screen.dart';
import 'package:wedding_pitch/screen/main_navigation_page.dart';

final GoRouter router = GoRouter(
  initialLocation: '/main',
  routes: [
    GoRoute(
      path: '/main',
      builder: (context, state) => const MainNavigationPage(),
    ),
    GoRoute(
      path: '/album',
      pageBuilder: (context, state) => CustomTransitionPage<void>(
        child: const AlbumScreen(),
        transitionDuration: const Duration(milliseconds: 500),
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          const begin = Offset(1.0, 0.0);
          const end = Offset.zero;
          const curve = Curves.easeInOut;
          var tween =
              Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
          var offsetAnimation = animation.drive(tween);

          return SlideTransition(position: offsetAnimation, child: child);
        },
      ),
    ),
    GoRoute(
      path: '/test',
      builder: (context, state) => const TestScreen(),
    ),
  ],
  errorPageBuilder: (context, state) {
    // 이 부분에서 루트로 리다이렉트를 수행
    WidgetsBinding.instance.addPostFrameCallback((_) {
      router.go('/main');
    });
    return const MaterialPage(
      key: ValueKey('error-page'),
      child: Scaffold(
        body: Center(child: Text('An error occurred, redirecting...')),
      ),
    );
  },
);
