import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:wedding_pitch/screen/baby_screen.dart';
import 'package:wedding_pitch/style/size.dart';
import 'package:wedding_pitch/widget/wedding_title.dart';

class HomeScreen extends StatefulWidget {
  final String coverImage;
  final int coverIndex;
  final ValueNotifier<bool> isInNavigation;
  final VoidCallback onTapStart;
  final AnimationController animationController;

  const HomeScreen({
    required this.coverImage,
    required this.coverIndex,
    required this.isInNavigation,
    required this.onTapStart,
    required this.animationController,
    super.key,
  });

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  final PageController _pageController = PageController();
  late Animation<double> _scaleAnimation;
  late Animation<double> _opacityAnimation;

  int _currentPageIndex = 0;

  void _onPageChanged() {
    final int nextPageIndex = _pageController.page!.round();
    if (_currentPageIndex != nextPageIndex) {
      setState(() {
        _currentPageIndex = nextPageIndex;
      });
    }
  }

  void _onTap(int index) {
    _pageController.animateToPage(
      index,
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeInOut,
    );
  }

  @override
  void initState() {
    super.initState();

    _pageController.addListener(_onPageChanged);

    _scaleAnimation =
        Tween<double>(begin: 2.0, end: 1).animate(widget.animationController);
    _opacityAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: widget.animationController,
        curve: Curves.easeInOut,
      ),
    );
  }

  @override
  void dispose() {
    _pageController.removeListener(_onPageChanged);

    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final appSize = AppSize.getMaxSize(
      MediaQuery.of(context).size.width,
      MediaQuery.of(context).size.height,
    );

    final screenWidth = appSize.width;
    final screenHeight = appSize.height;

    return ValueListenableBuilder(
      valueListenable: widget.isInNavigation,
      builder: (context, isInNavigation, child) {
        return Stack(
          fit: StackFit.expand,
          children: [
            AnimatedBuilder(
              animation: widget.animationController,
              builder: (context, child) {
                return Transform.scale(
                  scale: _scaleAnimation.value,
                  child: ImageFiltered(
                    imageFilter: ImageFilter.blur(
                      sigmaX: !isInNavigation ? 30.0 : 0.0,
                      sigmaY: !isInNavigation ? 30.0 : 0.0,
                    ),
                    child: AnimatedCrossFade(
                      duration: const Duration(milliseconds: 500),
                      firstChild: Image.asset(
                        widget.coverImage,
                        height: screenHeight + 30,
                        width: screenWidth + 30,
                        fit: BoxFit.cover,
                      ),
                      secondChild: Image.asset(
                        "assets/images/cover/child-bg.png",
                        height: screenHeight + 30,
                        width: screenWidth + 30,
                        fit: BoxFit.cover,
                      ),
                      crossFadeState: _currentPageIndex == 0
                          ? CrossFadeState.showFirst
                          : CrossFadeState.showSecond,
                    ),
                  ),
                );
              },
            ),
            Scaffold(
              backgroundColor: Colors.transparent,
              body: SafeArea(
                child: AnimatedSwitcher(
                  duration: const Duration(milliseconds: 500),
                  child: !isInNavigation
                      ? WeddingMainTitle(
                          widget: widget,
                        )
                      : FadeTransition(
                          opacity: _opacityAnimation,
                          child: PageView(
                            controller: _pageController,
                            scrollDirection: Axis.vertical,
                            children: [
                              WeddingSubTitle(
                                coverIndex: widget.coverIndex,
                              ),
                              const BabyScreen()
                            ],
                          ),
                        ),
                ),
              ),
            )
          ],
        );
      },
    );
  }
}
