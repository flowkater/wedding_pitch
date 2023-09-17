import 'package:flutter/material.dart';
import 'package:wedding_pitch/style/color.dart';

class ScheduleTabView extends StatelessWidget {
  const ScheduleTabView({super.key});

  String _getTimeRemaining() {
    final targetDate = DateTime(2023, 11, 4, 4, 10);
    final currentDate = DateTime.now();

    if (currentDate.isAfter(targetDate)) {
      return '🫶 지난 시간입니다 🫶';
    }

    final difference = targetDate.difference(currentDate);

    final days = difference.inDays;

    return '$days일 남았어요♥';
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 24.0,
          vertical: 60.0,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 24.0,
            ),
            const Text(
              "2023년 11월 5일",
              style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 12.0,
            ),
            Text(
              '↘ 첫번째 토요일, 오후 4시 10분 예식',
              style: TextStyle(
                fontSize: 15.0,
                color: Colors.black.withAlpha(200),
              ),
            ),
            const SizedBox(
              height: 6.0,
            ),
            RichText(
              text: TextSpan(children: [
                const TextSpan(
                  text: '↘ 이경과 재우의 결혼식까지 ',
                  style: TextStyle(
                    fontSize: 15.0,
                    color: Colors.black,
                    fontFamily: "Pretendard",
                  ),
                ),
                TextSpan(
                  text: _getTimeRemaining(),
                  style: const TextStyle(
                    fontSize: 15.0,
                    color: WeddingColor.redColor,
                    fontWeight: FontWeight.bold,
                    fontFamily: "Pretendard",
                  ),
                ),
              ]),
            ),
            const SizedBox(
              height: 36.0,
            ),
            Image.asset("assets/images/calendar.png"),
            const SizedBox(
              height: 36.0,
            ),
            const DancingAnimatedImage(),
          ],
        ),
      ),
    );
  }
}

class DancingAnimatedImage extends StatefulWidget {
  const DancingAnimatedImage({super.key});

  @override
  State<DancingAnimatedImage> createState() => _DancingAnimatedImageState();
}

class _DancingAnimatedImageState extends State<DancingAnimatedImage> {
  final images = [
    "assets/images/dancing/dancing01.png",
    "assets/images/dancing/dancing02.png",
    "assets/images/dancing/dancing03.png",
    "assets/images/dancing/dancing04.png",
    "assets/images/dancing/dancing05.png",
    "assets/images/dancing/dancing06.png",
  ];

  int _index = 0;

  @override
  void initState() {
    super.initState();

    _startImageSwitching();
  }

  @override
  dispose() {
    super.dispose();
  }

  _startImageSwitching() async {
    while (false) {
      await Future.delayed(const Duration(milliseconds: 300));
      setState(() {
        _index = (_index + 1) % images.length;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
      transitionBuilder: ((child, animation) => child),
      duration: const Duration(milliseconds: 10),
      child: Image.asset(
        key: ValueKey<int>(_index),
        images[_index],
      ),
    );
  }
}
