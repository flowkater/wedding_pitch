import 'package:flutter/material.dart';

class CeremonyTabView extends StatefulWidget {
  const CeremonyTabView({super.key});

  @override
  State<CeremonyTabView> createState() => _CeremonyTabViewState();
}

class _CeremonyTabViewState extends State<CeremonyTabView> {
  String _getTimeRemaining() {
    final targetDate = DateTime(2023, 11, 4, 4, 10);
    final currentDate = DateTime.now();

    if (currentDate.isAfter(targetDate)) {
      return '🫶 지난 시간입니다 🫶';
    }

    final difference = targetDate.difference(currentDate);

    final days = difference.inDays;
    final hours = difference.inHours - days * 24;
    final minutes = difference.inMinutes - (difference.inHours * 60);

    return '🫶 $days일 $hours시간 $minutes분 남았어요 🫶';
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
              height: 48.0,
            ),
            _makeSection(
              context,
              number: "1",
              title: "포토부스를 준비했어요!",
              description: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "평소에도 네컷사진을 좋아해서 준비했어요!",
                    style: TextStyle(
                      fontSize: 15.0,
                      color: Color(0xFF3E3E3E),
                    ),
                  ),
                  Text(
                    "함께 재밌고 즐거운 시간을 꼭꼭 즐겨주세요🫶",
                    style: TextStyle(
                      fontSize: 15.0,
                      color: Color(0xFF3E3E3E),
                    ),
                  ),
                  SizedBox(
                    height: 12.0,
                  ),
                  Text(
                    "↘ 신부대기실 앞쪽에 위치해있어요",
                    style: TextStyle(
                      fontSize: 15.0,
                      color: Color(0xFF3E3E3E),
                    ),
                  ),
                  Text(
                    "↘ 3시 10분부터 4시 40분까지 찍을 수 있어요",
                    style: TextStyle(
                      fontSize: 15.0,
                      color: Color(0xFF3E3E3E),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 24.0,
            ),
            _makeSection(
              context,
              number: "2",
              title: "예식 전 입사드려요!",
              description: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "심장은 쿵쾅여도, 한껏 차분하려 애쓰고 있어요🥹",
                    style: TextStyle(
                      fontSize: 15.0,
                      color: Color(0xFF3E3E3E),
                    ),
                  ),
                  Text(
                    "따뜻한 축하와 유쾌한 셀카로 함께해주세요.",
                    style: TextStyle(
                      fontSize: 15.0,
                      color: Color(0xFF3E3E3E),
                    ),
                  ),
                  SizedBox(
                    height: 12.0,
                  ),
                  Text(
                    "↘ 재우는 로비에, 이경은 신부대기실에 있어요",
                    style: TextStyle(
                      fontSize: 15.0,
                      color: Color(0xFF3E3E3E),
                    ),
                  ),
                  Text(
                    "↘ 예식 시작 전인 4시까지 인사드릴게요",
                    style: TextStyle(
                      fontSize: 15.0,
                      color: Color(0xFF3E3E3E),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 24.0,
            ),
            _makeSection(
              context,
              number: "3",
              title: "저희의 결혼 예식을 시작합니다",
              description: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 23.0,
                          vertical: 6.0,
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          color: const Color(0xFFFFF7AB),
                        ),
                        child: Center(
                          child: Text(
                            _getTimeRemaining(),
                            style: const TextStyle(
                              fontSize: 13.0,
                              color: Color(0xFFFF9900),
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 12.0,
                  ),
                  const Text(
                    "즐겁고 행복하게, 예쁘게 살아가는 모습으로",
                    style: TextStyle(
                      fontSize: 15.0,
                      color: Color(0xFF3E3E3E),
                    ),
                  ),
                  const Text(
                    "여러분의 축하에 보답하겠습니다❤️",
                    style: TextStyle(
                      fontSize: 15.0,
                      color: Color(0xFF3E3E3E),
                    ),
                  ),
                  const SizedBox(
                    height: 12.0,
                  ),
                  const Text(
                    "↘ 4시 10분, 결혼 예식을 시작합니다!",
                    style: TextStyle(
                      fontSize: 15.0,
                      color: Color(0xFF3E3E3E),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _makeSection(
    BuildContext context, {
    required String number,
    required String title,
    required Widget description,
  }) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: const Color(0xFFF9F9F9),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _cirleNumber(number: number),
          Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 12.0,
            ),
            child: Text(
              title,
              style: const TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          description,
          const SizedBox(
            height: 12.0,
          ),
        ],
      ),
    );
  }

  Widget _cirleNumber({required String number}) {
    return Container(
      width: 32.0,
      height: 32.0,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(50),
        color: const Color(0xFF386FFC),
      ),
      child: Center(
        child: Text(
          number,
          textAlign: TextAlign.center,
          style: const TextStyle(
              color: Colors.white, fontSize: 14, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
