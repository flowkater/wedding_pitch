import 'package:flutter/material.dart';
import 'package:wedding_pitch/style/size.dart';

class BabyScreen extends StatefulWidget {
  const BabyScreen({super.key});

  @override
  State<BabyScreen> createState() => _BabyScreenState();
}

class _BabyScreenState extends State<BabyScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _bounceAnimation;

  final _photoIndex = [1, 2, 3, 4, 5, 6, 7, 8];

  int _currentPhotoIndex = 0;

  void _onTapNextPage() {
    if (_currentPhotoIndex < _photoIndex.length - 1) {
      setState(() {
        _currentPhotoIndex++;
      });
    } else {
      setState(() {
        _currentPhotoIndex = 0;
      });
    }
  }

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      duration: const Duration(milliseconds: 500),
      vsync: this,
    )..repeat(reverse: true);

    _bounceAnimation = Tween<double>(begin: 0, end: 3).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.easeInOut,
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final appSize = AppSize.getMaxSize(
      MediaQuery.of(context).size.width,
      MediaQuery.of(context).size.height,
    );

    final screenHeight = appSize.height;

    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        return Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 48.0,
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 24.0),
                  child: Text(
                    "함께 맞이하는 일곱 번째 가을,\n아름다운 약속을 시작합니다.",
                    style: TextStyle(
                      fontSize: 24.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                      height: 1.6,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 8.0,
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 24.0),
                  child: Text(
                    '첫걸음을 향한 축복과 응원, 깊이 간직하겠습니다.\n예쁘게 살아가는 모습으로 보답하겠습니다.',
                    style: TextStyle(
                      fontSize: 16.0,
                      color: Colors.black,
                      height: 1.6,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 8.0,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        '재우와 이경 올림♡',
                        style: TextStyle(
                          fontSize: 12.0,
                          color: Colors.black.withOpacity(0.5),
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
                Center(
                  child: GestureDetector(
                    onTap: _onTapNextPage,
                    child: SizedBox(
                      height: screenHeight * 0.6,
                      child: AnimatedSwitcher(
                        duration: const Duration(milliseconds: 500),
                        transitionBuilder: (child, animation) {
                          final curvedAnimation = CurvedAnimation(
                            parent: animation,
                            curve: Curves.easeOutBack,
                          );
                          return ScaleTransition(
                            scale: curvedAnimation,
                            child: child,
                          );
                        },
                        child: Image.asset(
                          "assets/images/baby/baby0${_photoIndex[_currentPhotoIndex]}.png",
                          key: ValueKey<int>(_photoIndex[
                              _currentPhotoIndex]), // 각 이미지에 고유한 키를 제공합니다.
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
            Positioned(
              left: 0,
              right: 0,
              top: 0,
              bottom: 20,
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Transform.translate(
                  offset: Offset(0, _bounceAnimation.value),
                  child: const Text('사진을 탭해보세요!'),
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
