import 'package:flutter/material.dart';
import 'package:wedding_pitch/screen/home_screen.dart';

class RootScreen extends StatefulWidget {
  const RootScreen({super.key});

  @override
  State<RootScreen> createState() => _RootScreenState();
}

class _RootScreenState extends State<RootScreen> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.greenAccent,
      body: HomeScreen(),
    );
  }
}
