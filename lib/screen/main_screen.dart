import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:wedding_pitch/layout/layout.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return Layout(
      horizontalPadding: 20.0,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                '행복한 모습이 담긴\n사진으로 인사드려요',
                style: TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          ElevatedButton(
            onPressed: () => context.go('/photos'),
            style: ButtonStyle(
              minimumSize: MaterialStateProperty.all(
                Size(width, 60),
              ),
              backgroundColor: MaterialStateProperty.all(Colors.black),
            ),
            child: const Text(
              '앨범 열기',
              style: TextStyle(
                fontSize: 14,
                color: Colors.white,
              ),
            ),
          ),
          ElevatedButton(
            onPressed: () => context.go('/test'),
            style: ButtonStyle(
              minimumSize: MaterialStateProperty.all(
                Size(width, 60),
              ),
              backgroundColor: MaterialStateProperty.all(Colors.black),
            ),
            child: const Text(
              'test',
              style: TextStyle(
                fontSize: 14,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
