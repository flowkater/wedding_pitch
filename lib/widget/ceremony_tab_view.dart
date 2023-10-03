import 'package:boxicons/boxicons.dart';
import 'package:flutter/material.dart';
import 'package:remixicon/remixicon.dart';
import 'package:wedding_pitch/widget/link_copy_text.dart';

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
              height: 24.0,
            ),
            _makeSection(
              context,
              number: "1",
              title: "포토부스를 준비했어요!",
              description: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "평소에도 네컷사진을 좋아해서 준비했어요!",
                    style: TextStyle(
                      fontSize: 15.0,
                      color: Color(0xFF3E3E3E),
                      height: 1.8,
                    ),
                  ),
                  const Text(
                    "함께 재밌고 즐거운 시간을 꼭꼭 즐겨주세요🥰",
                    style: TextStyle(
                      fontSize: 15.0,
                      color: Color(0xFF3E3E3E),
                      height: 1.8,
                    ),
                  ),
                  const SizedBox(
                    height: 12.0,
                  ),
                  RichText(
                    text: const TextSpan(
                      children: [
                        TextSpan(
                          text: "↘ ",
                          style: TextStyle(
                            fontSize: 15.0,
                            color: Color(0xFF3E3E3E),
                            height: 1.8,
                            fontFamily: "Pretendard",
                          ),
                        ),
                        TextSpan(
                          text: "신부대기실 앞쪽",
                          style: TextStyle(
                            fontSize: 15.0,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF3E3E3E),
                            fontFamily: "Pretendard",
                            height: 1.8,
                          ),
                        ),
                        TextSpan(
                          text: "에 위치해있어요",
                          style: TextStyle(
                            fontSize: 15.0,
                            color: Color(0xFF3E3E3E),
                            fontFamily: "Pretendard",
                            height: 1.8,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const Text(
                    "↘ 3시 10분부터 4시 40분까지 찍을 수 있어요",
                    style: TextStyle(
                      fontSize: 15.0,
                      color: Color(0xFF3E3E3E),
                      height: 1.8,
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
              title: "예식 전 인사드려요!",
              description: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "심장은 쿵쾅여도, 한껏 차분하려 애쓰고 있어요🥹",
                    style: TextStyle(
                      fontSize: 15.0,
                      color: Color(0xFF3E3E3E),
                      height: 1.8,
                    ),
                  ),
                  const Text(
                    "따뜻한 축하와 유쾌한 셀카로 함께해주세요🫶",
                    style: TextStyle(
                      fontSize: 15.0,
                      color: Color(0xFF3E3E3E),
                      height: 1.8,
                    ),
                  ),
                  const SizedBox(
                    height: 12.0,
                  ),
                  RichText(
                    text: const TextSpan(
                      children: [
                        TextSpan(
                          text: "↘ ",
                          style: TextStyle(
                            fontSize: 15.0,
                            color: Color(0xFF3E3E3E),
                            height: 1.8,
                            fontFamily: "Pretendard",
                          ),
                        ),
                        TextSpan(
                          text: "재우는 로비에, 이경은 신부대기실에",
                          style: TextStyle(
                            fontSize: 15.0,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF3E3E3E),
                            fontFamily: "Pretendard",
                            height: 1.8,
                          ),
                        ),
                        TextSpan(
                          text: " 있어요",
                          style: TextStyle(
                            fontSize: 15.0,
                            color: Color(0xFF3E3E3E),
                            fontFamily: "Pretendard",
                            height: 1.8,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const Text(
                    "↘ 예식 시작 전인 4시까지 인사드릴게요",
                    style: TextStyle(
                      fontSize: 15.0,
                      color: Color(0xFF3E3E3E),
                      height: 1.8,
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
              numberRight: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10.0,
                  vertical: 6.0,
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4.0),
                  color: Colors.white,
                ),
                child: Center(
                  child: Text(
                    _getTimeRemaining(),
                    style: const TextStyle(
                      fontSize: 13.0,
                      color: Color(0xFFFF483C),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              title: "저희의 결혼 예식을 시작합니다",
              description: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 12.0,
                  ),
                  Text(
                    "즐겁고 행복하게, 예쁘게 살아가는 모습으로",
                    style: TextStyle(
                      fontSize: 15.0,
                      color: Color(0xFF3E3E3E),
                      height: 1.8,
                    ),
                  ),
                  Text(
                    "여러분의 축하에 보답하겠습니다❤️",
                    style: TextStyle(
                      fontSize: 15.0,
                      color: Color(0xFF3E3E3E),
                      height: 1.8,
                    ),
                  ),
                  SizedBox(
                    height: 12.0,
                  ),
                  Text(
                    "↘ 4시 10분, 결혼 예식을 시작합니다!",
                    style: TextStyle(
                      fontSize: 15.0,
                      color: Color(0xFF3E3E3E),
                      fontWeight: FontWeight.bold,
                      height: 1.8,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 24.0,
            ),
            _makeSectionIcon(
              context,
              icon: const Icon(
                Boxicons.bx_dish,
                color: Colors.white,
                size: 20.0,
              ),
              iconColor: const Color(0xFFFF823C),
              iconBottom: 6.0,
              title: "식사 안내",
              description: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  RichText(
                    text: const TextSpan(
                      children: [
                        TextSpan(
                          text: "연회장은 지하 1층에 위치",
                          style: TextStyle(
                            fontSize: 15.0,
                            color: Color(0xFF3E3E3E),
                            fontWeight: FontWeight.bold,
                            fontFamily: "Pretendard",
                            height: 1.8,
                          ),
                        ),
                        TextSpan(
                          text: "해 있습니다.",
                          style: TextStyle(
                            fontSize: 15.0,
                            color: Color(0xFF3E3E3E),
                            fontFamily: "Pretendard",
                            height: 1.8,
                          ),
                        )
                      ],
                    ),
                  ),
                  const Text(
                    "또한 예식 30분 전부터 식사하실 수 있습니다.",
                    style: TextStyle(
                      fontSize: 15.0,
                      color: Color(0xFF3E3E3E),
                      height: 1.8,
                    ),
                  ),
                  const SizedBox(
                    height: 12.0,
                  ),
                  const Text(
                    "↘ 연회장 이용시간 : 3:40 - 5:40 (총 2시간)",
                    style: TextStyle(
                      fontSize: 15.0,
                      color: Color(0xFF3E3E3E),
                      height: 1.8,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 24.0,
            ),
            _makeSectionIcon(
              context,
              icon: const Icon(
                Remix.car_line,
                color: Colors.white,
                size: 20.0,
              ),
              iconColor: const Color(0xFFFF823C),
              iconBottom: 6.0,
              title: "주차 안내",
              description: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  RichText(
                    text: const TextSpan(
                      children: [
                        TextSpan(
                          text: "무료 주차권",
                          style: TextStyle(
                            fontSize: 15.0,
                            color: Color(0xFF3E3E3E),
                            fontWeight: FontWeight.bold,
                            height: 1.8,
                            fontFamily: "Pretendard",
                          ),
                        ),
                        TextSpan(
                          text: "을 제공해드리고 있습니다. (90분)",
                          style: TextStyle(
                            fontSize: 15.0,
                            color: Color(0xFF3E3E3E),
                            height: 1.8,
                            fontFamily: "Pretendard",
                          ),
                        ),
                      ],
                    ),
                  ),
                  const Text(
                    "필요하신 분은 꼭 말씀 부탁드립니다 :)",
                    style: TextStyle(
                      fontSize: 15.0,
                      color: Color(0xFF3E3E3E),
                      height: 1.8,
                    ),
                  ),
                  const SizedBox(
                    height: 12.0,
                  ),
                  const Text(
                    "↘ 더파티움 건물 내 주차 가능 (중소기업중앙회)",
                    style: TextStyle(
                      fontSize: 15.0,
                      color: Color(0xFF3E3E3E),
                      height: 1.8,
                    ),
                  ),
                  const Text(
                    "↘ 제2주차장 이용 가능 (한국기계회관)",
                    style: TextStyle(
                      fontSize: 15.0,
                      color: Color(0xFF3E3E3E),
                      height: 1.8,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 24.0,
            ),
            const LinkCopyWidget(),
            const SizedBox(
              height: 24.0,
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
    Widget? numberRight,
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
          numberRight != null
              ? Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    _cirleNumber(number: number),
                    numberRight,
                  ],
                )
              : _cirleNumber(number: number),
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

  Widget _makeSectionIcon(
    BuildContext context, {
    required Icon icon,
    required Color iconColor,
    required double iconBottom,
    required String title,
    required Widget description,
    Color backgroundColor = const Color(0xFFF9F9F9),
  }) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16.0),
        color: backgroundColor,
        border: backgroundColor == Colors.white
            ? Border.all(
                color: Colors.black.withOpacity(0.4),
                width: 0.5,
              )
            : null,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _cirleIcon(
            icon: icon,
            iconColor: iconColor,
            bottom: iconBottom,
          ),
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

  Widget _cirleIcon(
      {required Icon icon, required Color iconColor, required double bottom}) {
    return Container(
      width: 32.0,
      height: 32.0,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(50),
        color: iconColor,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          icon,
          SizedBox(
            height: bottom,
          )
        ],
      ),
    );
  }
}
