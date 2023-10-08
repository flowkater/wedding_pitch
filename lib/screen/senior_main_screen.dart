import 'package:boxicons/boxicons.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:go_router/go_router.dart';
import 'package:url_launcher/url_launcher_string.dart';
import 'package:wedding_pitch/style/color.dart';
import 'package:wedding_pitch/widget/location_tab_view.dart';

class SeniorMainScreen extends StatelessWidget {
  const SeniorMainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _topTitle(),
              const SizedBox(
                height: 24.0,
              ),
              _topCover(),
              // _invitationSection(),
              // _gallerySection(context),
              // _locationSection(context),
              // _paybackSection(),
              // _scheduleSection(),
              // _bottomSection(context),
            ],
          ),
        ),
      ),
    );
  }

  Widget _gallerySection(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(
            height: 45.0,
          ),
          Image.asset(
            width: 140.0,
            "assets/images/senior/label02.png",
            fit: BoxFit.cover,
          ),
          const SizedBox(
            height: 40.0,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 32.0),
            child: InkWell(
              onTap: () {
                context.push("/album");
              },
              child: Image.asset(
                "assets/images/senior/image-gallery.png",
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(
            height: 75.0,
          ),
        ],
      ),
    );
  }

  Widget _locationSection(BuildContext context) {
    return Container(
      color: WeddingColor.seniorSubBgColor,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(
            height: 45.0,
          ),
          Image.asset(
            width: 140.0,
            "assets/images/senior/label03.png",
            fit: BoxFit.cover,
          ),
          const SizedBox(
            height: 40.0,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 32.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text(
                  "더파티움 여의도",
                  style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                    color: WeddingColor.seniorMainSubTitleColor,
                    height: 1.8,
                  ),
                  textAlign: TextAlign.center,
                ),
                InkWell(
                  onTap: () async {
                    await Clipboard.setData(
                      const ClipboardData(
                        text: "서울 영등포구 은행로 30 (중소기업중앙회 건물)",
                      ),
                    );

                    Fluttertoast.showToast(
                      msg: "✅ 복사 완료!",
                      toastLength: Toast.LENGTH_LONG,
                      gravity: ToastGravity.BOTTOM,
                      timeInSecForIosWeb: 2,
                      backgroundColor: Colors.black.withOpacity(0.7),
                      textColor: Colors.white,
                      webPosition: "center",
                      webBgColor: "#4d4d4d",
                    );
                  },
                  child: const Text(
                    "서울 영등포구 은행로 30 (중소기업중앙회 건물)",
                    style: TextStyle(
                      fontSize: 13.0,
                      color: WeddingColor.seniorMainSubTitleColor,
                      decoration: TextDecoration.underline,
                      height: 1.8,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                const SizedBox(
                  height: 24.0,
                ),
                Container(
                  color: Colors.white,
                  child: Column(
                    children: [
                      InkWell(
                        onTap: () {
                          showDialog(
                              context: context,
                              builder: (context) {
                                return const OpenMapDialog();
                              });
                        },
                        child: Image.asset(
                          "assets/images/senior/map.png",
                          fit: BoxFit.cover,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          vertical: 10.0,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            const Spacer(),
                            InkWell(
                              onTap: () async {
                                await launchUrlString(
                                  "https://map.kakao.com/?map_type=TYPE_MAP&target=car&rt=,,482938,1119063&rt1=&rt2=더파티움%20여의도&rtIds=,1485166493",
                                );
                              },
                              child: const Text(
                                "카카오네비",
                                style: TextStyle(
                                  fontSize: 14.0,
                                  color: WeddingColor.seniorMainSubTitleColor,
                                  height: 1.8,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                            const Spacer(),
                            Align(
                              alignment: Alignment.center,
                              child: Container(
                                width: 1.0,
                                height: 20.0,
                                color: Colors.black.withOpacity(0.2),
                              ),
                            ),
                            const Spacer(),
                            InkWell(
                              onTap: () async {
                                await launchUrlString(
                                  "https://map.naver.com/v5/directions/-/14128964.840800937,4512964.9050928075,더파티움,1018318622,PLACE_POI/-/transit?c=15,0,0,0,dh",
                                );
                              },
                              child: const Text(
                                "네이버지도",
                                style: TextStyle(
                                  fontSize: 14.0,
                                  color: WeddingColor.seniorMainSubTitleColor,
                                  height: 1.8,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                            const Spacer(),
                            Align(
                              alignment: Alignment.center,
                              child: Container(
                                width: 1.0,
                                height: 20.0,
                                color: Colors.black.withOpacity(0.2),
                              ),
                            ),
                            const Spacer(),
                            InkWell(
                              onTap: () async {
                                await launchUrlString(
                                  "https://apis.openapi.sk.com/tmap/app/routes?appKey=iol29hhWyX4CdjoqDICKw18XvuBRMSMR2IPfh4qa&name=%EB%8D%94%ED%8C%8C%ED%8B%B0%EC%9B%80&lon=126.92272&lat=37.52827",
                                );
                              },
                              child: const Text(
                                "티맵",
                                style: TextStyle(
                                  fontSize: 14.0,
                                  color: WeddingColor.seniorMainSubTitleColor,
                                  height: 1.8,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                            const Spacer(),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 24.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Flexible(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "자가용",
                            style: TextStyle(
                              fontSize: 15.0,
                              fontWeight: FontWeight.bold,
                              color: WeddingColor.seniorMainSubTitleColor,
                              height: 2.0,
                            ),
                          ),
                          const Text(
                            "• 더파티움 여의도 (중소기업중앙회)",
                            style: TextStyle(
                              fontSize: 15.0,
                              color: WeddingColor.seniorMainSubTitleColor,
                              height: 2.0,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 12.0),
                            child: InkWell(
                              onTap: () async {
                                await Clipboard.setData(
                                  const ClipboardData(
                                    text: "서울 영등포구 은행로 30 (여의도동 16-2)",
                                  ),
                                );

                                Fluttertoast.showToast(
                                  msg: "✅ 복사 완료!",
                                  toastLength: Toast.LENGTH_LONG,
                                  gravity: ToastGravity.BOTTOM,
                                  timeInSecForIosWeb: 2,
                                  backgroundColor:
                                      Colors.black.withOpacity(0.7),
                                  textColor: Colors.white,
                                  webPosition: "center",
                                  webBgColor: "#4d4d4d",
                                );
                              },
                              child: const Text(
                                "서울 영등포구 은행로 30 (여의도동 16-2)",
                                style: TextStyle(
                                  fontSize: 15.0,
                                  color: WeddingColor.seniorMainSubTitleColor,
                                  decoration: TextDecoration.underline,
                                  height: 2.0,
                                ),
                              ),
                            ),
                          ),
                          const Text(
                            "• 만차 시, 제2주차장을 이용하실 수 있습니다.",
                            style: TextStyle(
                              fontSize: 15.0,
                              color: WeddingColor.seniorMainSubTitleColor,
                              height: 2.0,
                            ),
                          ),
                          const Padding(
                            padding: EdgeInsets.only(left: 12.0),
                            child: Text(
                              "한국기계회관 (서울 영등포구 은행로 37)",
                              style: TextStyle(
                                fontSize: 15.0,
                                color: WeddingColor.seniorMainSubTitleColor,
                                height: 2.0,
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 14.0,
                          ),
                          const Text(
                            "지하철 이용시",
                            style: TextStyle(
                              fontSize: 15.0,
                              fontWeight: FontWeight.bold,
                              color: WeddingColor.seniorMainSubTitleColor,
                              height: 2.0,
                            ),
                          ),
                          const Text(
                            "• 5호선 여의나루역 1번 출구 : 셔틀버스 수시운행",
                            style: TextStyle(
                              fontSize: 15.0,
                              color: WeddingColor.seniorMainSubTitleColor,
                              height: 2.0,
                            ),
                          ),
                          const Text(
                            "• 9호선 국회의사당역 3번 출구 : 도보 5분",
                            style: TextStyle(
                              fontSize: 15.0,
                              color: WeddingColor.seniorMainSubTitleColor,
                              height: 2.0,
                            ),
                          ),
                          const SizedBox(
                            height: 14.0,
                          ),
                          const Text(
                            "버스 하차",
                            style: TextStyle(
                              fontSize: 15.0,
                              fontWeight: FontWeight.bold,
                              color: WeddingColor.seniorMainSubTitleColor,
                              height: 2.0,
                            ),
                          ),
                          const Text(
                            "• 기계회관 정류장 : 일반[20], 마을[영등포10]",
                            style: TextStyle(
                              fontSize: 15.0,
                              color: WeddingColor.seniorMainSubTitleColor,
                              height: 2.0,
                            ),
                          ),
                          const Text(
                            "• 산업은행 본점 : 일반[20], 간선[463] 등",
                            style: TextStyle(
                              fontSize: 15.0,
                              color: WeddingColor.seniorMainSubTitleColor,
                              height: 2.0,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 64.0,
          ),
        ],
      ),
    );
  }

  Widget _paybackSection() {
    const textColor = Color(0xFF6B5E5E);
    const circleBgColor = Color(0xFFF8F5F5);

    return Container(
      color: Colors.white,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(
            height: 45.0,
          ),
          Image.asset(
            "assets/images/senior/deco.png",
            fit: BoxFit.cover,
            width: 111,
          ),
          const SizedBox(
            height: 12.0,
          ),
          const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "마음 정하실 곳",
                    style: TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold,
                      color: textColor,
                      height: 1.8,
                    ),
                  ),
                  SizedBox(
                    height: 28.0,
                  ),
                  Text(
                    "참석이 어려우신 분들을 위해 기재하였습니다.\n너그라운 마음으로 양해부탁드립니다.",
                    style: TextStyle(
                      fontSize: 15.0,
                      color: textColor,
                      height: 1.8,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              )
            ],
          ),
          const SizedBox(
            height: 32.0,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 32.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                _accountHead(textColor, title: "신랑", name: "조재우"),
                const Divider(
                  color: textColor,
                  thickness: 1.0,
                ),
                _accountRow(
                  circleBgColor,
                  textColor,
                  accountHolder: "조병윤",
                  bankName: "우리",
                  accountNumber: "2030-232-7400",
                  relation: "부",
                ),
                _accountRow(
                  circleBgColor,
                  textColor,
                  accountHolder: "채은경",
                  bankName: "농협",
                  accountNumber: "302-1017-7471-01",
                  relation: "모",
                ),
                _accountRow(
                  circleBgColor,
                  textColor,
                  accountHolder: "조재우",
                  bankName: "토스",
                  accountNumber: "1000-0004-7369",
                ),
                const SizedBox(
                  height: 24.0,
                ),
                _accountHead(textColor, title: "신부", name: "고이경"),
                const Divider(
                  color: textColor,
                  thickness: 1.0,
                ),
                _accountRow(
                  circleBgColor,
                  textColor,
                  accountHolder: "고광하",
                  bankName: "농협",
                  accountNumber: "207182-52-136211",
                  relation: "부",
                ),
                _accountRow(
                  circleBgColor,
                  textColor,
                  accountHolder: "김예진",
                  bankName: "농협",
                  accountNumber: "207182-51-114083",
                  relation: "모",
                ),
                _accountRow(
                  circleBgColor,
                  textColor,
                  accountHolder: "고이경",
                  bankName: "토스",
                  accountNumber: "1000-1387-2797",
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 66.0,
          ),
        ],
      ),
    );
  }

  Widget _accountHead(
    Color textColor, {
    required String title,
    required String name,
  }) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(
              title,
              style: TextStyle(
                fontSize: 12.0,
                color: textColor,
                fontWeight: FontWeight.bold,
                height: 1.5,
              ),
            ),
            const SizedBox(
              width: 4.0,
            ),
            Text(
              name,
              style: TextStyle(
                fontSize: 14.0,
                color: textColor,
                fontWeight: FontWeight.bold,
                height: 1.5,
              ),
            ),
          ],
        ),
        const Icon(
          Boxicons.bx_chevron_down,
          size: 20.0,
        ),
      ],
    );
  }

  Widget _accountRow(
    Color circleBgColor,
    Color textColor, {
    required String bankName,
    required String accountNumber,
    required String accountHolder,
    String relation = "♥",
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: 28.0,
                height: 28.0,
                decoration: BoxDecoration(
                  color: circleBgColor,
                  borderRadius: BorderRadius.circular(50.0),
                ),
                child: Center(
                  child: Text(
                    relation,
                    style: TextStyle(
                      fontSize: 11.0,
                      color: textColor,
                      fontWeight: FontWeight.bold,
                      height: 1.5,
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 16.0),
              Text(
                accountHolder,
                style: TextStyle(
                  fontSize: 13.0,
                  color: textColor,
                  fontWeight: FontWeight.bold,
                  height: 1.5,
                ),
              ),
              const SizedBox(width: 16.0),
              Text(
                bankName,
                style: TextStyle(
                  fontSize: 13.0,
                  color: textColor,
                  height: 1.5,
                ),
              ),
              const SizedBox(width: 16.0),
              Text(
                accountNumber,
                style: TextStyle(
                  fontSize: 13.0,
                  color: textColor,
                  height: 1.5,
                ),
              ),
            ],
          ),
          const Spacer(),
          InkWell(
            onTap: () async {
              await Clipboard.setData(
                ClipboardData(text: "$bankName $accountNumber"),
              );
              Fluttertoast.showToast(
                msg: "✅ 복사 완료! 계좌 정보를 붙여넣을 수 있습니다.",
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
                vertical: 8.0,
                horizontal: 12.0,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4.0),
                border: Border.all(
                  color: const Color(0xFF666666).withOpacity(0.5),
                  width: 0.6,
                ),
              ),
              child: const Center(
                child: Text(
                  "복사",
                  style: TextStyle(
                    fontSize: 11.0,
                    color: Color(0xFF666666),
                    fontWeight: FontWeight.w500,
                    height: 1.5,
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _scheduleSection() {
    return Container(
      color: const Color(0xFFFAFAFA),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(
            height: 80.0,
          ),
          const Text(
            "2023. 11. 04",
            style: TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
              color: Color(0xFF237136),
              height: 1.8,
            ),
          ),
          const Text(
            "토요일 오후 4시 10분",
            style: TextStyle(
              fontSize: 16.0,
              fontWeight: FontWeight.w300,
              color: WeddingColor.seniorMainSubTitleColor,
              height: 1.8,
            ),
          ),
          const SizedBox(
            height: 24.0,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 32.0),
            child: Image.asset(
              "assets/images/senior/calendar-senior.png",
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(
            height: 60.0,
          ),
        ],
      ),
    );
  }

  Widget _bottomSection(BuildContext context) {
    return Container(
      color: const Color(0xFFD6E3DB),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(32.0),
            child: InkWell(
              onTap: () async {
                await Clipboard.setData(
                  const ClipboardData(text: "http://jwik1104.com/simple"),
                );
                Fluttertoast.showToast(
                  msg: "✅ 복사 완료!",
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
                  vertical: 20.0,
                ),
                decoration: const BoxDecoration(
                  color: Color(0xFF889D90),
                ),
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(bottom: 4.0),
                      child: Icon(
                        Boxicons.bx_link_alt,
                        color: Colors.white,
                        size: 18.0,
                      ),
                    ),
                    SizedBox(width: 10.0),
                    Text(
                      "청첩장 링크 복사하기",
                      style: TextStyle(
                        fontSize: 14.0,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        height: 1.2,
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
          InkWell(
            onTap: () async {
              context.go('/main');
            },
            child: const Text(
              "+ 다른 버전의 청첩장 보기",
              style: TextStyle(
                fontSize: 14.0,
                color: Color(0xFF6B7280),
                height: 1.2,
              ),
            ),
          ),
          const SizedBox(
            height: 16.0,
          ),
          InkWell(
            onTap: () async {
              await launchUrlString(
                "https://rainbow-spring-2bc.notion.site/f3446102673c4a8b9cfdc047451ac66b?pvs=4",
              );
            },
            child: const Text(
              "+ 청첩장 제작후기 보러가기",
              style: TextStyle(
                fontSize: 14.0,
                color: Color(0xFF6B7280),
                height: 1.2,
              ),
            ),
          ),
          const SizedBox(
            height: 70.0,
          )
        ],
      ),
    );
  }

  Widget _invitationSection() {
    return Stack(
      children: [
        Positioned.fill(
          child: Image.asset(
            "assets/images/senior/top-bgimage.png",
            fit: BoxFit.cover,
          ),
        ),
        Align(
          alignment: Alignment.center,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(
                height: 45.0,
              ),
              Image.asset(
                width: 140.0,
                "assets/images/senior/label01.png",
                fit: BoxFit.cover,
              ),
              const SizedBox(
                height: 40.0,
              ),
              const Text(
                "천천히 밀려들어 시작된 우리의 사랑은\n서로가 더욱 온전할 수 있도록 물들였습니다.",
                style: TextStyle(
                  fontSize: 16.0,
                  color: WeddingColor.seniorMainSubTitleColor,
                  height: 1.8,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 14.0,
              ),
              const Text(
                "우리가 바라는 평온과 열정을 향해\n너르고 바른 마음을 품고\n깊고 짙게 사랑하며 나아가겠습니다.",
                style: TextStyle(
                  fontSize: 16.0,
                  color: WeddingColor.seniorMainSubTitleColor,
                  height: 1.8,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 14.0,
              ),
              const Text(
                "두 마음이 함께하는 이 특별한 오늘,\n사랑과 축복으로 가득 함께해 주세요.",
                style: TextStyle(
                  fontSize: 16.0,
                  color: WeddingColor.seniorMainSubTitleColor,
                  height: 1.8,
                ),
                textAlign: TextAlign.center,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 36.0,
                  horizontal: 32.0,
                ),
                child: Image.asset(
                  "assets/images/senior/image-top.png",
                  fit: BoxFit.cover,
                ),
              ),
              _topName(),
              const SizedBox(
                height: 64.0,
              ),
            ],
          ),
        )
      ],
    );
  }

  Widget _topCover() {
    return Stack(
      children: [
        Image.asset(
          "assets/images/senior/maincover.png",
          fit: BoxFit.cover,
        ),
        const Positioned(
          bottom: 20.0,
          right: 32.0,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                "2023년 11월 4일 오후 4시",
                style: TextStyle(
                  fontSize: 14.0,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  height: 1.6,
                ),
              ),
              Text(
                "여의도 더파티움, 파티움홀",
                style: TextStyle(
                  fontSize: 16.0,
                  fontWeight: FontWeight.w300,
                  color: Colors.white,
                  height: 1.6,
                ),
              ),
            ],
          ),
        )
      ],
    );
  }

  Widget _topTitle() {
    return const Padding(
      padding: EdgeInsets.only(
        top: 60.0,
        left: 32.0,
        right: 32.0,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "어느 멋진 가을날,",
            style: TextStyle(
              fontSize: 20.0,
              color: WeddingColor.seniorMainTitleColor,
              height: 1.6,
            ),
          ),
          Text(
            "재우와 이경, 결혼합니다",
            style: TextStyle(
              fontSize: 25.0,
              fontWeight: FontWeight.bold,
              color: WeddingColor.seniorMainTitleColor,
              height: 1.6,
            ),
          ),
        ],
      ),
    );
  }

  Widget _topName() {
    return const Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 80.0,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "조병윤 & 채은경",
                style: TextStyle(
                  fontSize: 15.0,
                  fontWeight: FontWeight.bold,
                  color: WeddingColor.seniorMainSubTitleColor,
                  height: 1.6,
                ),
              ),
              Spacer(),
              Text(
                "첫 아들",
                style: TextStyle(
                  fontSize: 13.0,
                  color: WeddingColor.seniorMainSubTitleColor,
                  height: 1.6,
                ),
              ),
              Spacer(),
              Text(
                "조재우",
                style: TextStyle(
                  fontSize: 15.0,
                  fontWeight: FontWeight.bold,
                  color: WeddingColor.seniorMainSubTitleColor,
                  height: 1.6,
                ),
              ),
            ],
          ),
          SizedBox(
            height: 10.0,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "고광하 & 김예진",
                style: TextStyle(
                  fontSize: 15.0,
                  fontWeight: FontWeight.bold,
                  color: WeddingColor.seniorMainSubTitleColor,
                  height: 1.6,
                ),
              ),
              Spacer(),
              Text(
                "첫 딸",
                style: TextStyle(
                  fontSize: 13.0,
                  color: WeddingColor.seniorMainSubTitleColor,
                  height: 1.6,
                ),
              ),
              Spacer(),
              Text(
                "고이경",
                style: TextStyle(
                  fontSize: 15.0,
                  fontWeight: FontWeight.bold,
                  color: WeddingColor.seniorMainSubTitleColor,
                  height: 1.6,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
