import 'package:flutter/material.dart';

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final bool _isLargeText = false;

  @override
  Widget build(BuildContext context) {
    print("build");
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Stack(
            alignment: Alignment.center,
            children: [
              AnimatedAlign(
                alignment:
                    _isLargeText ? Alignment.topCenter : Alignment.center,
                duration: const Duration(seconds: 1),
                curve: Curves.easeInOut,
                child: AnimatedDefaultTextStyle(
                  style: _isLargeText
                      ? const TextStyle(fontSize: 50, color: Colors.blue)
                      : const TextStyle(fontSize: 20, color: Colors.red),
                  duration: const Duration(seconds: 1),
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        // _isLargeText = !_isLargeText;
                      });
                    },
                    child: const Text("Tap me!"),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
