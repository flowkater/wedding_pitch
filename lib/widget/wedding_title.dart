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
                        // context.go("/main-navigation");
                      },
                  child: const Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 24.0,
                      vertical: 18.0,
                    ),
                    child: Hero(
                      tag: "wedding-title-button",
                      child: Material(
                        type: MaterialType.transparency,
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

class WeddingSubTitle extends StatelessWidget {
  final int coverIndex;

  const WeddingSubTitle({
    required this.coverIndex,
    super.key,
  });

  bool isTop() => coverIndex == 1;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 24.0,
      ),
      child: Column(
        mainAxisAlignment:
            isTop() ? MainAxisAlignment.start : MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
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
              Text(
                '↘ 2023년 11월 4일, 오후 4시 10분',
                style: TextStyle(
                  fontSize: 15.0,
                  color: isTop() ? Colors.black : Colors.white,
                ),
              ),
              const SizedBox(
                height: 4.0,
              ),
              Text(
                '↘ 여의도 더파티움 파티움홀 2층',
                style: TextStyle(
                  fontSize: 15.0,
                  color: isTop() ? Colors.black : Colors.white,
                ),
              ),
              const SizedBox(
                height: 48.0,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
