import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:wedding_pitch/screen/album_screen.dart';
import 'package:wedding_pitch/screen/main_navigation_page.dart';
import 'package:wedding_pitch/screen/senior_main_screen.dart';

final GoRouter router = GoRouter(
  initialLocation: '/main',
  routes: [
    GoRoute(
      path: '/main',
      builder: (context, state) => const MainNavigationPage(),
    ),
    GoRoute(
      path: '/album',
      pageBuilder: (context, state) => MaterialPage(
        key: state.pageKey,
        child: const AlbumScreen(),
        fullscreenDialog: true,
      ),
    ),
    GoRoute(
      path: '/simple',
      builder: (context, state) => const SeniorMainScreen(),
    ),
  ],
  errorPageBuilder: (context, state) {
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
