import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HomeScreen extends StatefulWidget {
  final bool isInNavigation;

  const HomeScreen({
    this.isInNavigation = false,
    super.key,
  });

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final PageController _pageController = PageController();

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

    // if (widget.isInNavigation) {
    //   // 500ms 후에 두 번째 페이지로 자동 스크롤
    //   Future.delayed(
    //     const Duration(milliseconds: 500),
    //     () => _onTap(1),
    //   );
    // }
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SelectionArea(
      child: SafeArea(
        child: !widget.isInNavigation
            ? WeddingMainTitle(widget: widget)
            : PageView(
                controller: _pageController,
                scrollDirection: Axis.vertical,
                children: const [
                  // WeddingMainTitle(widget: widget, onTap: () => _onTap(1)),
                  WeddingSubTitle(),
                ],
              ),
      ),
    );
  }
}

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
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const SizedBox(
            height: 10,
          ),
          Column(
            children: [
              Hero(
                tag: "wedding-title-icon",
                child: Material(
                  type: MaterialType.transparency,
                  child: Image.asset(
                    "assets/images/wedding-icon.png",
                  ),
                ),
              ),
              const SizedBox(
                height: 24.0,
              ),
              const Hero(
                tag: "wedding-title-name",
                child: Material(
                  type: MaterialType.transparency,
                  child: Text(
                    "이경 x 재우",
                    style: TextStyle(
                      fontSize: 56.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              const Hero(
                tag: "wedding-title-sub",
                child: Material(
                  type: MaterialType.transparency,
                  child: Text(
                    "결혼합니다",
                    style: TextStyle(
                      fontSize: 56.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 24.0,
              ),
              const Text(
                "2023년 11월 4일, 오후 4시 10분",
                style: TextStyle(
                  fontSize: 18.0,
                ),
              ),
              const Hero(
                tag: "wedding-title-location",
                child: Material(
                  type: MaterialType.transparency,
                  child: Text(
                    "여의도 더파티움 파티움홀 2층",
                    style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),
          Column(
            children: [
              GestureDetector(
                onTap: onTap ??
                    () {
                      if (widget.isInNavigation) {
                        return;
                      }

                      context.go('/main-navigation');
                    },
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20.0),
                    border: Border.all(
                      color: Colors.black,
                    ),
                  ),
                  child: const Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 24.0,
                      vertical: 18.0,
                    ),
                    child: Hero(
                      tag: "wedding-title-button",
                      child: Material(
                        type: MaterialType.transparency,
                        child: Text(
                          "시작하기 → --->",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 16.0,
                          ),
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
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(
                height: 48.0,
              ),
              Hero(
                tag: "wedding-title-icon",
                child: Material(
                  type: MaterialType.transparency,
                  child: Image.asset(
                    "assets/images/wedding-icon.png",
                  ),
                ),
              ),
              const SizedBox(
                height: 24.0,
              ),
              const Hero(
                tag: "wedding-title-sub",
                child: Material(
                  type: MaterialType.transparency,
                  child: Text(
                    "11월 4일 오후 4시,",
                    style: TextStyle(
                      fontSize: 36.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              const Hero(
                tag: "wedding-title-name",
                child: Material(
                  type: MaterialType.transparency,
                  child: Text(
                    "재우와 이경 결혼합니다",
                    style: TextStyle(
                      fontSize: 36.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 12.0,
              ),
              Hero(
                tag: "wedding-title-location",
                child: Material(
                  type: MaterialType.transparency,
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.grey.shade700,
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12.0,
                      vertical: 8.0,
                    ),
                    child: const Text(
                      "여의도 더파티움 파티움홀 2층",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          Column(
            children: [
              GestureDetector(
                onTap: () {
                  print("tapped");
                },
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(28.0),
                    border: Border.all(
                      color: Colors.black,
                    ),
                  ),
                  child: const Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 24.0,
                      vertical: 18.0,
                    ),
                    child: Hero(
                      tag: "wedding-title-button",
                      child: Material(
                        type: MaterialType.transparency,
                        child: Text(
                          "아래로 내려볼 수 있어요 ↓",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 14.0,
                            fontWeight: FontWeight.bold,
                          ),
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
