import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:url_launcher/url_launcher_string.dart';
import 'package:wedding_pitch/style/size.dart';

class LocationTabView extends StatefulWidget {
  const LocationTabView({super.key});

  @override
  State<LocationTabView> createState() => _LocationTabViewState();
}

class _LocationTabViewState extends State<LocationTabView> {
  final tabs = [
    "자가용",
    "지하철",
    "버스",
  ];

  @override
  Widget build(BuildContext context) {
    final appSize = AppSize.getMaxSize(
      MediaQuery.of(context).size.width,
      MediaQuery.of(context).size.height,
    );

    final screenHeight = appSize.height;

    return SingleChildScrollView(
      child: DefaultTabController(
        length: tabs.length,
        child: Container(
          padding: const EdgeInsets.symmetric(
            vertical: 60.0,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 24.0,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 24.0,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "여의도 더파티움, 2층 파티움홀",
                      style: TextStyle(
                        fontSize: 19.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    InkWell(
                      onTap: () async {
                        await Clipboard.setData(
                          const ClipboardData(text: "서울 영등포구 은행로 30"),
                        );

                        Fluttertoast.showToast(
                          msg: "✅ 복사 완료! 조심히 오셔요 🫶",
                          toastLength: Toast.LENGTH_LONG,
                          gravity: ToastGravity.BOTTOM,
                          timeInSecForIosWeb: 2,
                          backgroundColor: Colors.black.withOpacity(0.7),
                          textColor: Colors.white,
                          webPosition: "center",
                          webBgColor: "#4d4d4d",
                        );
                      },
                      child: Text(
                        "주소 복사",
                        style: TextStyle(
                          fontSize: 12.0,
                          decoration: TextDecoration.underline,
                          color: Colors.black.withAlpha(125),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 24.0,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 24.0,
                ),
                child: InkWell(
                  onTap: () {
                    showDialog(
                        context: context,
                        builder: (context) {
                          return const OpenMapDialog();
                        });
                  },
                  child: Image.asset("assets/images/map.png"),
                ),
              ),
              const SizedBox(
                height: 24.0,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 24.0,
                ),
                child: Container(
                  height: 52,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(32),
                    color: const Color(0xFFF6F6F6),
                  ),
                  child: TabBar(
                    padding: const EdgeInsets.symmetric(
                      vertical: 8.0,
                      horizontal: 8.0,
                    ),
                    indicator: BoxDecoration(
                      borderRadius: BorderRadius.circular(23),
                      color: Colors.white,
                    ),
                    indicatorPadding: EdgeInsets.zero,
                    labelColor: Colors.black,
                    labelStyle: const TextStyle(
                      fontSize: 14.0,
                      fontWeight: FontWeight.bold,
                    ),
                    unselectedLabelColor: Colors.grey.withOpacity(0.4),
                    unselectedLabelStyle: const TextStyle(
                      fontSize: 14.0,
                      fontWeight: FontWeight.bold,
                    ),
                    indicatorSize: TabBarIndicatorSize.label,
                    labelPadding: const EdgeInsets.symmetric(
                      horizontal: 4,
                    ),
                    tabs: [
                      for (var i = 0; i < tabs.length; i++)
                        Tab(
                          child: SizedBox(
                            width: MediaQuery.of(context).size.width / 3.5,
                            child: Align(
                              alignment: Alignment.center,
                              child: Text(
                                tabs[i],
                              ),
                            ),
                          ),
                        ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: screenHeight / 2.5,
                child: TabBarView(
                  physics: const NeverScrollableScrollPhysics(),
                  children: [
                    _makeVehichle(),
                    _makeSubway(),
                    _makeBus(),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  LocationTabBarView _makeBus() {
    return LocationTabBarView(
      topView: Container(
        padding: const EdgeInsets.only(
          top: 12.0,
          left: 32.0,
          right: 32.0,
        ),
        child: Column(
          children: [
            _busItem(
              busStation: "기계회관 정류장",
              howToCome: "도보 100m",
              busNumberLines: [
                const BusNumberLine(
                  busNumberColor: Color(0xFF9CC54F),
                  isColorFilled: true,
                  busNumberText: "10",
                  busLine: "일반",
                ),
                const BusNumberLine(
                  busNumberColor: Color(0xFF9CC54F),
                  isColorFilled: false,
                  busNumberText: "영등포10",
                  busLine: "마을",
                ),
              ],
            ),
            const SizedBox(
              height: 32.0,
            ),
            _busItem(
              busStation: "산업은행 본점",
              howToCome: "도보 200m",
              busNumberLines: [
                const BusNumberLine(
                  busNumberColor: Color(0xFF9CC54F),
                  isColorFilled: true,
                  busNumberText: "10",
                  busLine: "일반",
                ),
                const BusNumberLine(
                  busNumberColor: Color(0xFF9CC54F),
                  isColorFilled: false,
                  busNumberText: "영등포10",
                  busLine: "마을",
                ),
                const BusNumberLine(
                  busNumberColor: Color(0xFF567BFF),
                  isColorFilled: true,
                  busNumberText: "463",
                  busLine: "간선",
                ),
              ],
            ),
            const SizedBox(
              height: 32.0,
            ),
            _busItem(
              busStation: "여의도 환승센터",
              howToCome: "도보 500m",
            ),
          ],
        ),
      ),
    );
  }

  Column _busItem({
    required String busStation,
    required String howToCome,
    List<BusNumberLine> busNumberLines = const [],
  }) {
    return Column(
      children: [
        Row(
          children: [
            Row(
              children: [
                Text(
                  busStation,
                  style: const TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(
                  width: 8.0,
                ),
                const Text(
                  "하차",
                  style: TextStyle(
                    fontSize: 16.0,
                  ),
                ),
              ],
            ),
            Flexible(
              child: Row(
                children: [
                  const SizedBox(
                    width: 12.0,
                  ),
                  Expanded(
                    child: Container(
                      height: 2.0,
                      color: Colors.grey,
                    ),
                  ),
                  const SizedBox(
                    width: 8.0,
                  ),
                  Text(
                    howToCome,
                    style: const TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 8.0,
        ),
        busNumberLines.isNotEmpty
            ? Row(
                children: [
                  for (var numberLine in busNumberLines)
                    Padding(
                      padding: const EdgeInsets.only(right: 12.0),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 5.0,
                              vertical: 1.0,
                            ),
                            decoration: BoxDecoration(
                              color: numberLine.isColorFilled
                                  ? numberLine.busNumberColor
                                  : Colors.white,
                              borderRadius: BorderRadius.circular(6.0),
                              border: Border.all(
                                color: numberLine.busNumberColor,
                                width: 1.0,
                              ),
                            ),
                            child: Text(
                              numberLine.busLine,
                              style: TextStyle(
                                fontSize: 12.0,
                                color: numberLine.isColorFilled
                                    ? Colors.white
                                    : numberLine.busNumberColor,
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 4.0,
                          ),
                          Text(
                            numberLine.busNumberText,
                            style: TextStyle(
                              fontSize: 14.0,
                              color: numberLine.busNumberColor,
                            ),
                          ),
                        ],
                      ),
                    ),
                ],
              )
            : const SizedBox.shrink(),
      ],
    );
  }

  LocationTabBarView _makeSubway() {
    return LocationTabBarView(
      topView: Container(
        padding: const EdgeInsets.only(
          top: 12.0,
          bottom: 36.0,
          left: 32.0,
          right: 32.0,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            _subwayItem(
              subwayNumber: "5",
              numberColor: const Color(0xFF7941D5),
              station: "여의나루역 1번 출구",
              howToCome: "셔틀버스 수시 운행",
              lineSpace: 20.0,
            ),
            const SizedBox(
              height: 12.0,
            ),
            _subwayItem(
              subwayNumber: "9",
              numberColor: const Color(0xFFC3A95E),
              station: "국회의사당역 3번 출구",
              howToCome: "걸어서 5분",
              lineSpace: 20.0,
            ),
            const SizedBox(
              height: 12.0,
            ),
            _subwayItem(
              subwayNumber: "9",
              numberColor: const Color(0xFFC3A95E),
              station: "여의도역 3번 출구",
              howToCome: "걸어서 15분",
              lineSpace: 20.0,
            ),
          ],
        ),
      ),
      bottomView: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "국회의사당역에서 걸어오는 편이 가장 가깝고,",
            style: TextStyle(
              fontSize: 14.0,
              color: Colors.black.withOpacity(0.6),
            ),
          ),
          const SizedBox(
            height: 4.0,
          ),
          Text(
            "여의도/여의나루에서 걸어온다면 단풍구경은 덤!🍁",
            style: TextStyle(
              fontSize: 14.0,
              color: Colors.black.withOpacity(0.6),
            ),
          ),
        ],
      ),
    );
  }

  LocationTabBarView _makeVehichle() {
    return LocationTabBarView(
      topView: Container(
        padding: const EdgeInsets.only(
          top: 12.0,
          bottom: 36.0,
          left: 36.0,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Row(
              children: [
                Text(
                  "• 건물 주변에 주차 안내 직원이 위치해 있습니다",
                  style: TextStyle(
                    fontSize: 16.0,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 8.0,
            ),
            const Row(
              children: [
                Text(
                  "• 만차 시, 제2주차장을 이용해주세요 (도보 100m)",
                  style: TextStyle(
                    fontSize: 16.0,
                    fontFamily: "Pretendard",
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 8.0,
            ),
            Row(
              children: [
                const SizedBox(
                  width: 4.0,
                ),
                const Text(
                  '  한국기계회관',
                  style: TextStyle(
                    fontSize: 16.0,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontFamily: "Pretendard",
                  ),
                ),
                const Text(
                  ' | ',
                  style: TextStyle(
                    fontSize: 16.0,
                    fontFamily: "Pretendard",
                  ),
                ),
                InkWell(
                  onTap: () async {
                    await Clipboard.setData(
                      const ClipboardData(text: "서울 영등포구 은행로 37"),
                    );

                    Fluttertoast.showToast(
                      msg: "✅ 복사 완료! 안전 운전하세요 🚙",
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
                    '서울 영등포구 은행로 37',
                    style: TextStyle(
                      fontSize: 16.0,
                      fontFamily: "Pretendard",
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      bottomView: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "더파티움 건물 내 주차시 이용하실 수 있는",
            style: TextStyle(
              fontSize: 14.0,
              color: Colors.black.withOpacity(0.6),
            ),
          ),
          const SizedBox(
            height: 4.0,
          ),
          RichText(
            text: TextSpan(children: [
              TextSpan(
                text: '90분 무료 주차권',
                style: TextStyle(
                  fontSize: 14.0,
                  color: Colors.black.withOpacity(0.6),
                  fontWeight: FontWeight.bold,
                  fontFamily: "Pretendard",
                ),
              ),
              TextSpan(
                text: '을 안내데스크에서 수령해주세요!',
                style: TextStyle(
                  fontSize: 14.0,
                  color: Colors.black.withOpacity(0.6),
                  fontFamily: "Pretendard",
                ),
              ),
            ]),
          ),
        ],
      ),
    );
  }

  Row _subwayItem({
    required String subwayNumber,
    required Color numberColor,
    required String station,
    required String howToCome,
    required double lineSpace,
  }) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 8.0,
                vertical: 4.0,
              ),
              decoration: BoxDecoration(
                color: numberColor,
                borderRadius: BorderRadius.circular(50.0),
              ),
              child: Text(
                subwayNumber,
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(
              width: 8.0,
            ),
            Text(
              station,
              style: const TextStyle(
                fontSize: 16.0,
              ),
            ),
          ],
        ),
        Flexible(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                width: lineSpace,
              ),
              Expanded(
                child: Container(
                  height: 2.0,
                  color: Colors.grey,
                ),
              ),
              const SizedBox(
                width: 8.0,
              ),
              Text(
                howToCome,
                style: const TextStyle(
                  fontSize: 16.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class LocationTabBarView extends StatelessWidget {
  final Widget topView;
  final Widget? bottomView;

  const LocationTabBarView({
    required this.topView,
    this.bottomView,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          topView,
          bottomView != null
              ? Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 24.0,
                  ),
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    padding: const EdgeInsets.symmetric(
                      vertical: 18.0,
                      horizontal: 24.0,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12.0),
                      border: Border.all(
                        color: Colors.black.withOpacity(0.1),
                        width: 1.0,
                      ),
                    ),
                    child: bottomView,
                  ),
                )
              : const SizedBox.shrink(),
        ],
      ),
    );
  }
}

class OpenMapDialog extends StatelessWidget {
  const OpenMapDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.0),
      ),
      elevation: 0,
      backgroundColor: Colors.transparent,
      child: Container(
        padding: const EdgeInsets.symmetric(
          vertical: 40.0,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.0),
          color: Colors.white,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "⚡ ️네비앱으로 바로 연결할 수 있어요 ⚡️",
              style: TextStyle(
                  fontSize: 14.0, fontWeight: FontWeight.bold, height: 1.5),
            ),
            const SizedBox(
              height: 16.0,
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                MapButton(
                  mapName: "카카오맵",
                  mapUrl:
                      "https://map.kakao.com/?map_type=TYPE_MAP&target=car&rt=,,482938,1119063&rt1=&rt2=더파티움%20여의도&rtIds=,1485166493",
                  mapImage: "assets/images/kakaomap.png",
                ),
                SizedBox(
                  width: 24.0,
                ),
                MapButton(
                  mapName: "네이버지도",
                  mapUrl:
                      "https://map.naver.com/v5/directions/-/14128964.840800937,4512964.9050928075,더파티움,1018318622,PLACE_POI/-/transit?c=15,0,0,0,dh",
                  mapImage: "assets/images/navermap.png",
                ),
                SizedBox(
                  width: 24.0,
                ),
                MapButton(
                  mapName: "티맵",
                  mapUrl:
                      "https://apis.openapi.sk.com/tmap/app/routes?appKey=iol29hhWyX4CdjoqDICKw18XvuBRMSMR2IPfh4qa&name=%EB%8D%94%ED%8C%8C%ED%8B%B0%EC%9B%80&lon=126.92272&lat=37.52827",
                  mapImage: "assets/images/tmap.png",
                ),
              ],
            ),
            const SizedBox(
              height: 16.0,
            ),
            Divider(
              color: Colors.black.withOpacity(0.1),
              thickness: 1.0,
            ),
            const SizedBox(
              height: 16.0,
            ),
            const Text(
              "⚡ ️아래 주소를 클릭하면 복사할 수 있어요 ⚡️",
              style: TextStyle(
                  fontSize: 14.0, fontWeight: FontWeight.bold, height: 1.5),
            ),
            const SizedBox(
              height: 16.0,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 36.0),
              child: InkWell(
                onTap: () async {
                  await Clipboard.setData(
                    const ClipboardData(text: "서울 영등포구 은행로 30"),
                  );

                  Fluttertoast.showToast(
                    msg: "✅ 복사 완료! 조심히 오셔요 🫶",
                    toastLength: Toast.LENGTH_LONG,
                    gravity: ToastGravity.BOTTOM,
                    timeInSecForIosWeb: 2,
                    backgroundColor: Colors.black.withOpacity(0.7),
                    textColor: Colors.white,
                    webPosition: "center",
                    webBgColor: "#4d4d4d",
                  );
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        color: const Color(0xFFF6F6F6),
                        borderRadius: BorderRadius.circular(50.0),
                      ),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 10.0,
                        vertical: 8.0,
                      ),
                      child: const Text(
                        '신주소',
                        style: TextStyle(
                          fontSize: 12.0,
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 8.0,
                    ),
                    const Text(
                      "서울 영등포구 은행로 30",
                      style: TextStyle(
                        decoration: TextDecoration.underline,
                        color: Color(0xFF3E3E3E),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 12.0,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 36.0),
              child: InkWell(
                onTap: () async {
                  await Clipboard.setData(
                    const ClipboardData(text: "서울 영등포구 여의도동 16-2"),
                  );

                  Fluttertoast.showToast(
                    msg: "✅ 복사 완료! 조심히 오셔요 🫶",
                    toastLength: Toast.LENGTH_LONG,
                    gravity: ToastGravity.BOTTOM,
                    timeInSecForIosWeb: 2,
                    backgroundColor: Colors.black.withOpacity(0.7),
                    textColor: Colors.white,
                    webPosition: "center",
                    webBgColor: "#4d4d4d",
                  );
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        color: const Color(0xFFF6F6F6),
                        borderRadius: BorderRadius.circular(50.0),
                      ),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 10.0,
                        vertical: 8.0,
                      ),
                      child: const Text(
                        '구주소',
                        style: TextStyle(
                          fontSize: 12.0,
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 8.0,
                    ),
                    const Text(
                      "서울 영등포구 여의도동 16-2",
                      style: TextStyle(
                        decoration: TextDecoration.underline,
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
    );
  }
}

class MapButton extends StatelessWidget {
  final String mapName;
  final String mapUrl;
  final String mapImage;

  const MapButton({
    required this.mapName,
    required this.mapUrl,
    required this.mapImage,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () async {
        await launchUrlString(
          mapUrl,
        );
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            mapImage,
            height: 64.0,
            width: 64.0,
          ),
          const SizedBox(
            height: 8.0,
          ),
          Text(
            mapName,
            style: const TextStyle(
              fontSize: 16.0,
            ),
          )
        ],
      ),
    );
  }
}

class BusNumberLine {
  final Color busNumberColor;
  final bool isColorFilled;
  final String busLine;
  final String busNumberText;

  const BusNumberLine({
    required this.busNumberColor,
    required this.isColorFilled,
    required this.busNumberText,
    required this.busLine,
  });
}
