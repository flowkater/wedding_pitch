import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:wedding_pitch/screen/main_screen.dart';
import 'package:wedding_pitch/screen/photo_album_screen.dart';
import 'package:wedding_pitch/screen/test_screen.dart';

void main() {
  runApp(const MyApp());
}

final GoRouter _router = GoRouter(routes: [
  GoRoute(
    path: '/',
    builder: (context, state) => const MainScreen(),
    routes: [
      GoRoute(
        path: 'photos',
        builder: (context, state) => const PhotoAlbumScreen(),
      ),
      GoRoute(
        path: 'test',
        builder: (context, state) => const TestScreen(),
      ),
    ],
  )
]);

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        useMaterial3: true,
      ),
      routerConfig: _router,
    );
  }
}
