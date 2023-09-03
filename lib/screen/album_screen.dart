import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AlbumScreen extends StatelessWidget {
  const AlbumScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios,
            color: Colors.white,
          ),
          onPressed: () {
            context.pop();
            context.go("/main-navigation");
          },
        ),
      ),
      backgroundColor: Colors.blueAccent,
      body: Center(
        child: Text(
          'Album Screen',
          style: Theme.of(context).textTheme.displayLarge,
        ),
      ),
    );
  }
}
