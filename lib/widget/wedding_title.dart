import 'package:flutter/material.dart';
import 'package:remixicon/remixicon.dart';
import 'package:wedding_pitch/screen/home_screen.dart';
import 'package:wedding_pitch/style/size.dart';

class WeddingMainTitle extends StatelessWidget {
  final HomeScreen widget;
  final VoidCallback? onTap;

  const WeddingMainTitle({
    required this.widget,
    this.onTap,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final appSize = AppSize.getMaxSize(
      MediaQuery.of(context).size.width,
      MediaQuery.of(context).size.height,
    );

    final screenWidth = appSize.width;
    // final screenHeight = appSize.height;

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const SizedBox(
            height: 10,
          ),
          Column(
            children: [
              Image.asset(
                "assets/images/wedding-icon.png",
                fit: BoxFit.cover,
                width: screenWidth * 0.3,
              ),
              const SizedBox(
                height: 24.0,
              ),
              const Text(
                "이경 x 재우",
                style: TextStyle(
                  fontSize: 56.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              const Text(
                "결혼합니다",
                style: TextStyle(
                  fontSize: 56.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              const SizedBox(
                height: 24.0,
              ),
              const Text(
                "2023년 11월 4일, 오후 4시 10분",
                style: TextStyle(
                  fontSize: 18.0,
                  color: Colors.white,
                ),
              ),
              const Text(
                "여의도 더파티움 파티움홀 2층",
                style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ],
          ),
          Column(
            children: [
              Container(
                width: screenWidth * 0.35,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50.0),
                  color: Colors.black.withOpacity(0.1),
                ),
                child: InkWell(
                  borderRadius: BorderRadius.circular(50.0),
                  onTap: onTap ??
                      () {
                        if (widget.isInNavigation.value) {
                          return;
                        }
                        widget.onTapStart();
                      },
                  child: const Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 24.0,
                      vertical: 18.0,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          "시작하기",
                          style: TextStyle(
                            fontSize: 16.0,
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(
                          width: 8.0,
                        ),
                        Icon(
                          Remix.arrow_right_line,
                          color: Colors.white,
                          size: 16.0,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 48.0,
              ),
            ],
          )
        ],
      ),
    );
  }
}

class WeddingSubTitle extends StatefulWidget {
  final int coverIndex;
  final VoidCallback onTapNextPage;

  const WeddingSubTitle({
    required this.coverIndex,
    required this.onTapNextPage,
    super.key,
  });

  @override
  State<WeddingSubTitle> createState() => _WeddingSubTitleState();
}

class _WeddingSubTitleState extends State<WeddingSubTitle>
    with TickerProviderStateMixin {
  late AnimationController _controller;
  late AnimationController _bounceController;
  late Animation<double> _animation1;
  late Animation<double> _animation2;
  late Animation<double> _bounceAnimation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    );

    _bounceController = AnimationController(
      duration: const Duration(milliseconds: 500),
      vsync: this,
    )..repeat(reverse: true);

    _animation1 = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.4, 0.7, curve: Curves.easeOut),
      ),
    );

    _animation2 = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.7, 1.0, curve: Curves.easeOut),
      ),
    );

    _bounceAnimation = Tween<double>(begin: 0, end: 3).animate(
      CurvedAnimation(
        parent: _bounceController,
        curve: Curves.easeInOut,
      ),
    );

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    _bounceController.dispose();
    super.dispose();
  }

  bool isTop() => widget.coverIndex == 1;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: Listenable.merge([_controller, _bounceController]),
      builder: (context, child) {
        return Container(
          padding: const EdgeInsets.symmetric(
            horizontal: 24.0,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (!isTop()) _downToScroll(Position.top),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 48.0,
                  ),
                  Text(
                    "11월 4일,",
                    style: TextStyle(
                      fontSize: 32.0,
                      fontWeight: FontWeight.bold,
                      color: isTop() ? Colors.black : Colors.white,
                    ),
                  ),
                  Text(
                    "재우와 이경 결혼합니다",
                    style: TextStyle(
                      fontSize: 32.0,
                      fontWeight: FontWeight.bold,
                      color: isTop() ? Colors.black : Colors.white,
                    ),
                  ),
                  const SizedBox(
                    height: 12.0,
                  ),
                  Opacity(
                    opacity: _animation1.value,
                    child: Text(
                      '↘ 2023년 11월 4일, 오후 4시 10분',
                      style: TextStyle(
                        fontSize: 15.0,
                        color: isTop() ? Colors.black : Colors.white,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 4.0,
                  ),
                  Opacity(
                    opacity: _animation2.value,
                    child: Text(
                      '↘ 여의도 더파티움 파티움홀 2층',
                      style: TextStyle(
                        fontSize: 15.0,
                        color: isTop() ? Colors.black : Colors.white,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 48.0,
                  ),
                ],
              ),
              if (isTop()) _downToScroll(Position.bottom)
            ],
          ),
        );
      },
    );
  }

  Widget _downToScroll(Position position) {
    return Padding(
      padding: position == Position.top
          ? const EdgeInsets.only(top: 48.0)
          : const EdgeInsets.only(bottom: 48.0),
      child: Transform.translate(
        offset: Offset(0, _bounceAnimation.value),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50.0),
                border: Border.all(
                  color: isTop() ? Colors.black : Colors.white,
                  width: 0.5,
                ),
              ),
              child: InkWell(
                borderRadius: BorderRadius.circular(50.0),
                onTap: widget.onTapNextPage,
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12.0,
                    vertical: 9.0,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        "아래로 스크롤 하기",
                        style: TextStyle(
                          fontSize: 12.0,
                          fontWeight: FontWeight.bold,
                          color: isTop() ? Colors.black : Colors.white,
                        ),
                      ),
                      const SizedBox(
                        width: 8.0,
                      ),
                      Icon(
                        Remix.arrow_down_line,
                        color: isTop() ? Colors.black : Colors.white,
                        size: 12.0,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

enum Position { top, bottom }
