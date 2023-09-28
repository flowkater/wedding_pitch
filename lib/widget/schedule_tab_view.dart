import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

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

    return '$days일 남았어요';
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
              "💖 2023년 11월 4일 토요일 💖",
              style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 12.0,
            ),
            Text(
              '↘ 오후 4시 10분, 예식이 시작됩니다!',
              style: TextStyle(
                fontSize: 15.0,
                color: Colors.black.withAlpha(200),
                height: 1.8,
              ),
            ),
            Text(
              '↘ 30분 전부턴 포토부스에서 사진도 찍을 수 있어용🫶',
              style: TextStyle(
                fontSize: 15.0,
                color: Colors.black.withAlpha(200),
                height: 1.8,
              ),
            ),
            const SizedBox(
              height: 24.0,
            ),
            const DancingAnimatedImage(),
            Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 20.0,
                vertical: 20.0,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50.0),
                border: Border.all(
                  color: Colors.black,
                  width: 1.0,
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Text(
                    "이경과 재우의 결혼식까지",
                    style: TextStyle(
                      fontSize: 15.0,
                      color: Colors.black,
                      fontWeight: FontWeight.w500,
                      height: 1.2,
                    ),
                  ),
                  const SizedBox(
                    width: 10.0,
                  ),
                  Text(
                    "♥ ${_getTimeRemaining()} ♥",
                    style: const TextStyle(
                      fontSize: 15.0,
                      color: Color(0xFFFF483C),
                      fontWeight: FontWeight.w600,
                      height: 1.2,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 36.0,
            ),
            Image.asset("assets/images/calendar.png"),
            const SizedBox(
              height: 36.0,
            ),
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
  @override
  Widget build(BuildContext context) {
    return Image.asset(
      "assets/images/jwik.gif",
    );
  }
}
