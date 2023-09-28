import 'package:flutter/material.dart';

class BabyScreen extends StatefulWidget {
  const BabyScreen({super.key});

  @override
  State<BabyScreen> createState() => _BabyScreenState();
}

class _BabyScreenState extends State<BabyScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const SizedBox(
            height: 48.0,
          ),
          const Text(
            "함께 맞이하는 일곱 번째 가을,\n아름다운 약속을 시작합니다.",
            style: TextStyle(
              fontSize: 24.0,
              fontWeight: FontWeight.bold,
              color: Colors.black,
              height: 1.6,
            ),
          ),
          const SizedBox(
            height: 8.0,
          ),
          const Text(
            '첫걸음을 향한 축복과 응원, 깊이 간직하겠습니다.\n예쁘게 살아가는 모습으로 보답하겠습니다.',
            style: TextStyle(
              fontSize: 16.0,
              color: Colors.black,
              height: 1.6,
            ),
          ),
          const SizedBox(
            height: 8.0,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                '재우와 이경 올림♡',
                style: TextStyle(
                  fontSize: 11.0,
                  color: Colors.black.withOpacity(0.5),
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
