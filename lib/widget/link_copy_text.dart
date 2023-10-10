import 'package:boxicons/boxicons.dart';
import 'package:flutter/material.dart';
import 'package:wedding_pitch/utils/clip_borad_js.dart';

class LinkCopyWidget extends StatelessWidget {
  const LinkCopyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () async {
        clipboardAndAlert(
          text: "http://jwik1104.com/welcome",
          alertText: "✅ 복사 완료!",
        );
      },
      child: const Padding(
        padding: EdgeInsets.symmetric(vertical: 21.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.only(bottom: 4.0),
              child: Icon(
                Boxicons.bx_link_alt,
                color: Color(0xFF6B7280),
                size: 18.0,
              ),
            ),
            SizedBox(width: 10.0),
            Text(
              "청첩장 링크 복사하기",
              style: TextStyle(
                fontSize: 14.0,
                color: Color(0xFF6B7280),
                fontWeight: FontWeight.w500,
                decoration: TextDecoration.underline,
                height: 1.2,
              ),
            )
          ],
        ),
      ),
    );
  }
}
