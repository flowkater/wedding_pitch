import 'package:flutter/material.dart';
import 'package:remixicon/remixicon.dart';
import 'package:wedding_pitch/screen/home_screen.dart';
import 'package:wedding_pitch/style/size.dart';
import 'package:wedding_pitch/widget/hero_text.dart';

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
              const HeroText(
                tag: "wedding-title-name",
                child: Text(
                  "이경 x 재우",
                  style: TextStyle(
                    fontSize: 56.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
              const HeroText(
                tag: "wedding-title-sub",
                child: Text(
                  "결혼합니다",
                  style: TextStyle(
                    fontSize: 56.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
              const SizedBox(
                height: 24.0,
              ),
              const HeroText(
                tag: "wedding-title-date",
                child: Text(
                  "2023년 11월 4일, 오후 4시 10분",
                  style: TextStyle(
                    fontSize: 18.0,
                    color: Colors.white,
                  ),
                ),
              ),
              const HeroText(
                tag: "wedding-title-location",
                child: Text(
                  "여의도 더 파티움 파티움 홀 2층",
                  style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
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
  const WeddingSubTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 24.0,
      ),
      child: const Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                height: 48.0,
              ),
              HeroText(
                tag: "wedding-title-sub",
                child: Text(
                  "11월 4일,",
                  style: TextStyle(
                    fontSize: 32.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              HeroText(
                tag: "wedding-title-name",
                child: Text(
                  "재우와 이경 결혼합니다",
                  style: TextStyle(
                    fontSize: 32.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(
                height: 12.0,
              ),
              HeroText(
                tag: "wedding-title-date",
                child: Text(
                  '↘ 2023년 11월 4일, 오후 4시 10분',
                  style: TextStyle(
                    fontSize: 15.0,
                    color: Colors.black,
                  ),
                ),
              ),
              HeroText(
                tag: "wedding-title-location",
                child: Text(
                  '↘ 여의도 더파티움 파티움홀 2층',
                  style: TextStyle(
                    fontSize: 15.0,
                    color: Colors.black,
                  ),
                ),
              ),
            ],
          ),
          Column(
            children: [
              // GestureDetector(
              //   onTap: () {
              //     print("tapped");
              //   },
              //   child: DecoratedBox(
              //     decoration: BoxDecoration(
              //       borderRadius: BorderRadius.circular(28.0),
              //       border: Border.all(
              //         color: Colors.black,
              //       ),
              //     ),
              //     child: const Padding(
              //       padding: EdgeInsets.symmetric(
              //         horizontal: 24.0,
              //         vertical: 18.0,
              //       ),
              //       child: Hero(
              //         tag: "wedding-title-button",
              //         child: Material(
              //           type: MaterialType.transparency,
              //           child: Text(
              //             "아래로 내려볼 수 있어요 ↓",
              //             style: TextStyle(
              //               color: Colors.black,
              //               fontSize: 14.0,
              //               fontWeight: FontWeight.bold,
              //             ),
              //           ),
              //         ),
              //       ),
              //     ),
              //   ),
              // ),
              SizedBox(
                height: 48.0,
              ),
            ],
          )
        ],
      ),
    );
  }
}
