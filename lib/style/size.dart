import 'package:wedding_pitch/utils/get_device_type.dart';

class AppSize {
  static const maxWidth = 430.0;
  static const maxHeight = 932.0;

  static MaxSize getMaxSize(double width, double height) {
    return getDeviceType() == DeviceType.Mobile
        ? MaxSize(width: width, height: height)
        : const MaxSize(width: maxWidth, height: maxHeight);
  }
}

class MaxSize {
  final double width;
  final double height;

  const MaxSize({
    required this.width,
    required this.height,
  });
}
