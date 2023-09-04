import 'package:flutter/widgets.dart';

class SizeConfig {
  static const double baseWidth = 375.0; // 기준 가로 해상도
  static const double baseHeight = 780.0; // 기준 세로 해상도

  static late double screenWidth;
  static late double screenHeight;

  static late double blockSizeHorizontal;
  static late double blockSizeVertical;

  static late double textMultiplier;
  static late double widthMultiplier; // 가로 비율
  static late double heightMultiplier; // 세로 비율

  void init(BuildContext context) {
    screenWidth = MediaQuery.of(context).size.width;
    screenHeight = MediaQuery.of(context).size.height;

    // 현재 화면 해상도를 100으로 나누어 각 블록의 크기를 설정
    blockSizeHorizontal = screenWidth / 100;
    blockSizeVertical = screenHeight / 100;

    // 기준 해상도 대비 현재 해상도의 비율을 계산하여 multiplier를 설정
    widthMultiplier = blockSizeHorizontal / (baseWidth / 100);
    heightMultiplier = blockSizeVertical / (baseHeight / 100);

    // 텍스트는 세로 비율을 기준으로 설정할 수 있습니다.
    textMultiplier = blockSizeVertical;
  }
}
