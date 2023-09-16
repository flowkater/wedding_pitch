import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:wedding_pitch/style/size.dart';
import 'package:wedding_pitch/widget/wedding_title.dart';

class HomeScreen extends StatefulWidget {
  final String coverImage;
  final ValueNotifier<bool> isInNavigation;

  const HomeScreen({
    required this.coverImage,
    required this.isInNavigation,
    super.key,
  });

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  final PageController _pageController = PageController();
  late AnimationController _animationController;
  late Animation<double> _scaleAnimation;

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

    _animationController = AnimationController(
      duration: const Duration(milliseconds: 500),
      vsync: this,
    );

    _scaleAnimation =
        Tween<double>(begin: 2.0, end: 1).animate(_animationController);

    widget.isInNavigation.addListener(_handleNavigationChange);

    _handleNavigationChange();

    // if (widget.isInNavigation) {
    //   // 500ms 후에 두 번째 페이지로 자동 스크롤
    //   Future.delayed(
    //     const Duration(milliseconds: 500),
    //     () => _onTap(1),
    //   );
    // }
  }

  void _handleNavigationChange() {
    print("handleNavigationChange");
    if (widget.isInNavigation.value) {
      _animationController.forward();
    } else {
      _animationController.reverse();
    }
  }

  @override
  void dispose() {
    widget.isInNavigation.removeListener(_handleNavigationChange);

    _animationController.dispose();
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
                animation: _animationController,
                builder: (context, child) {
                  return Transform.scale(
                    scale: _scaleAnimation.value,
                    child: ImageFiltered(
                      imageFilter: ImageFilter.blur(
                        sigmaX: !isInNavigation ? 30.0 : 0.0,
                        sigmaY: !isInNavigation ? 30.0 : 0.0,
                      ),
                      child: Image.asset(
                        widget.coverImage,
                        height: screenHeight + 30,
                        width: screenWidth + 30,
                        fit: BoxFit.cover,
                      ),
                    ),
                  );
                },
              ),
              !isInNavigation
                  ? Scaffold(
                      backgroundColor: Colors.transparent,
                      body: SafeArea(
                        child: WeddingMainTitle(
                          widget: widget,
                        ),
                      ),
                    )
                  : Scaffold(
                      backgroundColor: Colors.transparent,
                      body: SafeArea(
                        child: PageView(
                          controller: _pageController,
                          scrollDirection: Axis.vertical,
                          children: const [
                            // WeddingMainTitle(widget: widget, onTap: () => _onTap(1)),
                            WeddingSubTitle(),
                          ],
                        ),
                      ),
                    ),
            ],
          );
        });
  }
}
