import 'package:boxicons/boxicons.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:remixicon/remixicon.dart';

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
              height: 48.0,
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
                      await Clipboard.setData(
                        const ClipboardData(text: "토스뱅크 1000-0004-7369"),
                      );

                      Fluttertoast.showToast(
                        msg: "✅ 은행과 계좌번호 복사 완료! 붙여넣을 수 있어요",
                        toastLength: Toast.LENGTH_LONG,
                        gravity: ToastGravity.BOTTOM,
                        timeInSecForIosWeb: 2,
                        backgroundColor: Colors.black.withOpacity(0.7),
                        textColor: Colors.white,
                        webPosition: "center",
                        webBgColor: "#4d4d4d",
                      );
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 24.0,
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
                      await Clipboard.setData(
                        const ClipboardData(text: "신한은행 110-354-982959"),
                      );
                      Fluttertoast.showToast(
                        msg: "✅ 은행과 계좌번호 복사 완료! 붙여넣을 수 있어요",
                        toastLength: Toast.LENGTH_LONG,
                        gravity: ToastGravity.BOTTOM,
                        timeInSecForIosWeb: 2,
                        backgroundColor: Colors.black.withOpacity(0.7),
                        textColor: Colors.white,
                        webPosition: "center",
                        webBgColor: "#4d4d4d",
                      );
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 24.0,
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
                            "신한은행",
                            style: TextStyle(
                              fontSize: 14.0,
                              fontWeight: FontWeight.w500,
                              color: Color(0xFF3E3E3E),
                            ),
                          ),
                          Text(
                            "110-354-982959",
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
              height: 12.0,
            ),
            _makeSection(
              context,
              icon: const Icon(
                Boxicons.bx_dish,
                color: Colors.white,
                size: 20.0,
              ),
              iconColor: const Color(0xFFFF823C),
              title: "식사 안내",
              description: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  RichText(
                    text: const TextSpan(
                      children: [
                        TextSpan(
                          text: "연회장은 지하 1층",
                          style: TextStyle(
                            fontSize: 15.0,
                            color: Color(0xFF3E3E3E),
                            fontWeight: FontWeight.bold,
                            fontFamily: "Pretendard",
                            height: 1.8,
                          ),
                        ),
                        TextSpan(
                          text: "에 위치해 있습니다.",
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
              height: 12.0,
            ),
            _makeSection(
              context,
              icon: const Icon(
                Remix.car_line,
                color: Colors.white,
                size: 20.0,
              ),
              iconColor: const Color(0xFFFF823C),
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
              height: 12.0,
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
    required String title,
    required Widget description,
    Color backgroundColor = const Color(0xFFF9F9F9),
  }) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
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

  Widget _cirleIcon({required Icon icon, required Color iconColor}) {
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
          const SizedBox(
            height: 2.0,
          )
        ],
      ),
    );
  }
}
