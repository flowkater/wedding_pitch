import 'package:flutter/material.dart';
import 'package:remixicon/remixicon.dart';
import 'package:url_launcher/url_launcher_string.dart';

class LocationTabView extends StatelessWidget {
  const LocationTabView({super.key});

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
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "여의도 더파티움, 2층 파티움홀",
                  style: TextStyle(
                    fontSize: 19.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    print("주소 복사");
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
            const SizedBox(
              height: 24.0,
            ),
            InkWell(
              onTap: () {
                showDialog(
                    context: context,
                    builder: (context) {
                      print("지도");
                      return const OpenMapDialog();
                    });
              },
              child: Image.asset("assets/images/map.png"),
            ),
          ],
        ),
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
          horizontal: 32.0,
          vertical: 40.0,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.0),
          color: Colors.white,
        ),
        child: const Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
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
                  mapUrl: "https://www.tmap.co.kr",
                  mapImage: "assets/images/tmap.png",
                ),
              ],
            ),
            SizedBox(
              height: 32.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(Remix.file_copy_2_line),
                SizedBox(
                  width: 4.0,
                ),
                Text(
                  "서울 영등포구 은행로 30 중소기업중앙회",
                  style: TextStyle(
                    decoration: TextDecoration.underline,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 12.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(Remix.file_copy_2_line),
                SizedBox(
                  width: 4.0,
                ),
                Text(
                  "서울 영등포구 여의도동 16-2",
                  style: TextStyle(
                    decoration: TextDecoration.underline,
                  ),
                ),
              ],
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
          Image.asset(mapImage),
          const SizedBox(
            height: 8.0,
          ),
          Text(
            mapName,
            style: const TextStyle(
              fontSize: 16.0,
              fontWeight: FontWeight.bold,
            ),
          )
        ],
      ),
    );
  }
}
