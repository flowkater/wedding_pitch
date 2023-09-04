import 'package:flutter/material.dart';
import 'package:wedding_pitch/utils/get_device_type.dart';

class PageLayout extends StatelessWidget {
  final Widget body;

  const PageLayout({
    required this.body,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ConstrainedBox(
        constraints: getDeviceType() != DeviceType.Mobile
            ? const BoxConstraints(
                maxWidth: 430,
                maxHeight: 932,
              )
            : const BoxConstraints(),
        child: Center(
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8.0),
              boxShadow: const [
                BoxShadow(
                  color: Colors.black12,
                  blurRadius: 10.0,
                  offset: Offset(0, 5),
                ),
              ],
            ),
            child: body,
          ),
        ),
      ),
    );
  }
}
