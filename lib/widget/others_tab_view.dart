import 'package:boxicons/boxicons.dart';
import 'package:flutter/material.dart';
import 'package:remixicon/remixicon.dart';
import 'package:url_launcher/url_launcher_string.dart';
import 'package:wedding_pitch/utils/clip_borad_js.dart';
import 'package:wedding_pitch/widget/link_copy_text.dart';

class OthersTabView extends StatefulWidget {
  const OthersTabView({super.key});

  @override
  State<OthersTabView> createState() => _OthersTabViewState();
}

class _OthersTabViewState extends State<OthersTabView> {
  @override
  void initState() {
    super.initState();
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
              icon: const Icon(
                Remix.heart_2_line,
                color: Colors.white,
                size: 20.0,
              ),
              backgroundColor: Colors.white,
              iconColor: const Color(0xFFFF3C82),
              iconBottom: 4.0,
              title: "마음 전하실 곳",
              description: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "참석이 어려우신 분들을 위해 계좌번호를 기재하였습니다. 너그러운 마음으로 양해 부탁드립니다.",
                    style: TextStyle(
                      fontSize: 15.0,
                      color: Color(0xFF3E3E3E),
                      height: 1.8,
                    ),
                  ),
                  const SizedBox(
                    height: 24.0,
                  ),
                  InkWell(
                    onTap: () async {
                      clipboardAndAlert(
                        text: "토스뱅크 1000-0004-7369",
                        alertText: "✅ 복사 완료! 계좌 정보를 붙여넣을 수 있습니다",
                      );
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 12.0,
                        vertical: 18.0,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: const Color(0xFFF9F9F9),
                      ),
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text("💙"),
                          Text(
                            "조재우",
                            style: TextStyle(
                              fontSize: 14.0,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                          Text(
                            "토스뱅크",
                            style: TextStyle(
                              fontSize: 14.0,
                              fontWeight: FontWeight.w500,
                              color: Color(0xFF3E3E3E),
                            ),
                          ),
                          Text(
                            "1000-0004-7369",
                            style: TextStyle(
                              fontSize: 14.0,
                              fontWeight: FontWeight.w500,
                              color: Color(0xFF3E3E3E),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 8.0,
                  ),
                  InkWell(
                    onTap: () async {
                      clipboardAndAlert(
                        text: "토스뱅크 1000-1387-2797",
                        alertText: "✅ 복사 완료! 계좌 정보를 붙여넣을 수 있습니다",
                      );
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 12.0,
                        vertical: 18.0,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: const Color(0xFFF9F9F9),
                      ),
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text("💛"),
                          Text(
                            "고이경",
                            style: TextStyle(
                              fontSize: 14.0,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                          Text(
                            "토스뱅크",
                            style: TextStyle(
                              fontSize: 14.0,
                              fontWeight: FontWeight.w500,
                              color: Color(0xFF3E3E3E),
                            ),
                          ),
                          Text(
                            "1000-1387-2797",
                            style: TextStyle(
                              fontSize: 14.0,
                              fontWeight: FontWeight.w500,
                              color: Color(0xFF3E3E3E),
                            ),
                          ),
                        ],
                      ),
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
              icon: const Icon(
                Boxicons.bx_game,
                color: Colors.white,
                size: 20.0,
              ),
              iconColor: const Color(0xFFFF823C),
              iconBottom: 4.0,
              title: "주변엔 이런 곳이!",
              description: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "걸음하신 시간이 조금 더 알찰 수 있도록, 주변에 가볼 만한 곳을 추천해 드려요!",
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
                    "👟 걸어서 10분 거리",
                    style: TextStyle(
                      fontSize: 15.0,
                      color: Color(0xFF3E3E3E),
                      height: 1.8,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(
                    height: 8.0,
                  ),
                  _addressLocationText(
                    context,
                    location: "여의도 공원 가을 단풍길",
                    urlAddress:
                        "https://map.naver.com/p/search/여의도%20공원%20가을%20단풍길?c=14.00,0,0,0,dh",
                  ),
                  _addressLocationText(
                    context,
                    location: "여의도 한강공원",
                    urlAddress: "https://naver.me/I5FcmljL",
                  ),
                  _addressLocationText(
                    context,
                    location: "더 현대 서울",
                    urlAddress: "https://naver.me/5PS2Ritm",
                  ),
                  _addressLocationText(
                    context,
                    location: "IFC몰",
                    urlAddress: "https://naver.me/GDcNdhHm",
                  ),
                  _addressLocationText(
                    context,
                    location: "국회 어린이 박물관",
                    urlAddress: "https://naver.me/5nbrAToG",
                  ),
                  const SizedBox(
                    height: 12.0,
                  ),
                  const Text(
                    "🚗  차량으로 10분 거리",
                    style: TextStyle(
                      fontSize: 15.0,
                      color: Color(0xFF3E3E3E),
                      height: 1.8,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(
                    height: 8.0,
                  ),
                  _addressLocationText(
                    context,
                    location: "영등포 타임스퀘어 및 신세계백화점",
                    urlAddress: "https://naver.me/IDB1n6Md",
                  ),
                  _addressLocationText(
                    context,
                    location: "채그로",
                    transportation: "차량 10분 · 버스 160,260",
                    urlAddress: "https://naver.me/IDB1Bvug",
                  ),
                  _addressLocationText(
                    context,
                    location: "노들섬 잔디마당",
                    transportation: "차량 7분 · 버스 360번",
                    urlAddress: "https://naver.me/xaPgJl4X",
                  ),
                  _addressLocationText(
                    context,
                    location: "양화 한강공원",
                    transportation: "차량 8분 · 버스 70-2번",
                    urlAddress: "https://naver.me/GhENX2nP",
                  ),
                  _addressLocationText(
                    context,
                    location: "선유도 공원",
                    transportation: "차량 8분",
                    urlAddress: "https://naver.me/5kLX5Fnx",
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 24.0,
            ),
            _makeSection(
              context,
              icon: const Icon(
                Boxicons.bx_history,
                color: Colors.white,
                size: 20.0,
              ),
              iconColor: const Color(0xFFB9B9B9),
              iconBottom: 4.0,
              title: "재우와 이경이 만든 청첩장",
              description: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    "다 알고 시작했지만 역시 극악의 효율임을..ㅎㅎ",
                    style: TextStyle(
                      fontSize: 15.0,
                      color: const Color(0xFF222222).withOpacity(0.8),
                      height: 1.6,
                      fontFamily: "Pretendard",
                    ),
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                  Text(
                    "한정된 시간과 쫓기는 기한, 버그와의 싸움. 그리고 틈틈이 욕심내는 OO의 요구사항까지..",
                    style: TextStyle(
                      fontSize: 15.0,
                      color: const Color(0xFF222222).withOpacity(0.8),
                      height: 1.6,
                      fontFamily: "Pretendard",
                    ),
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                  Text(
                    "힘겨운 사투가 분명했지만, 이상하게도 즐거웠던 시간이었어요! 그 과정 속에서 우리는 무언가 더 중요한 것을 찾았기 때문일까요?\n(어랏..? 그건 아마도.. 사랑🫶?)",
                    style: TextStyle(
                      fontSize: 15.0,
                      color: const Color(0xFF222222).withOpacity(0.8),
                      height: 1.6,
                      fontFamily: "Pretendard",
                    ),
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                  RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: "아쉽긴 해도, 낭만을 추구하는 우리의 과정이 궁금한 분들은 ",
                          style: TextStyle(
                            fontSize: 15.0,
                            color: const Color(0xFF222222).withOpacity(0.8),
                            height: 1.6,
                            fontFamily: "Pretendard",
                          ),
                        ),
                        TextSpan(
                          text: "요기↓",
                          style: TextStyle(
                            fontSize: 15.0,
                            color: const Color(0xFF222222).withOpacity(0.8),
                            height: 1.6,
                            fontFamily: "Pretendard",
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        TextSpan(
                          text: "에서 확인할 수 있습니다!",
                          style: TextStyle(
                            fontSize: 15.0,
                            color: const Color(0xFF222222).withOpacity(0.8),
                            height: 1.6,
                            fontFamily: "Pretendard",
                          ),
                        )
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 24.0,
                  ),
                  InkWell(
                    onTap: () async {
                      await launchUrlString(
                        "https://jwik1104.com/tmi_review",
                      );
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        vertical: 12.0,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8.0),
                        color: const Color(0xFF386FFC),
                      ),
                      child: const Center(
                        child: Text(
                          "우리가 함께 만든 청첩장 : 작업일지 읽기 👀",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 14.0,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
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

  Widget _addressLocationText(
    BuildContext context, {
    required String location,
    required String urlAddress,
    String? transportation,
  }) {
    return InkWell(
      onTap: () async {
        await launchUrlString(
          urlAddress,
        );
      },
      child: RichText(
        text: TextSpan(
          children: [
            const TextSpan(
              text: "↘ ",
              style: TextStyle(
                fontSize: 15.0,
                color: Color(0xFF3E3E3E),
                fontWeight: FontWeight.bold,
                height: 1.8,
                fontFamily: "Pretendard",
              ),
            ),
            TextSpan(
              text: location,
              style: const TextStyle(
                fontSize: 15.0,
                color: Color(0xFF3E3E3E),
                height: 1.8,
                fontFamily: "Pretendard",
                decoration: TextDecoration.underline,
              ),
            ),
            TextSpan(
              text: transportation != null ? " ($transportation)" : " ",
              style: const TextStyle(
                fontSize: 15.0,
                color: Color(0xFF3E3E3E),
                height: 1.8,
                fontFamily: "Pretendard",
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _makeSection(
    BuildContext context, {
    required Icon icon,
    required Color iconColor,
    required double iconBottom,
    required String title,
    required Widget description,
    Color backgroundColor = const Color(0xFFF9F9F9),
  }) {
    return Container(
      padding: const EdgeInsets.all(20.0),
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
