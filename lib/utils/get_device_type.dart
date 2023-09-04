import 'dart:html' as html;

enum DeviceType {
  Mobile,
  Desktop,
  Tablet,
  Unknown,
}

DeviceType getDeviceType() {
  final userAgent = html.window.navigator.userAgent.toLowerCase();

  if (userAgent.contains('android') || userAgent.contains('iphone')) {
    return DeviceType.Mobile;
  } else if (userAgent.contains('ipad') ||
      userAgent.contains('android tablet')) {
    return DeviceType.Tablet;
  } else if (userAgent.contains('windows') ||
      userAgent.contains('macintosh') ||
      userAgent.contains('linux')) {
    return DeviceType.Desktop;
  }

  return DeviceType.Unknown;
}
