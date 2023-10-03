import 'package:boxicons/boxicons.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';

class LinkCopyWidget extends StatelessWidget {
  const LinkCopyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 21.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Icon(
            Boxicons.bx_link_alt,
            color: Color(0xFF6B7280),
            size: 18.0,
          ),
          const SizedBox(width: 10.0),
          InkWell(
            onTap: () async {
              await Clipboard.setData(
                const ClipboardData(text: "https://bitly.com"),
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
              "청첩장 링크 복사하기",
              style: TextStyle(
                fontSize: 14.0,
                color: Color(0xFF6B7280),
                fontWeight: FontWeight.w500,
                decoration: TextDecoration.underline,
                height: 1.2,
              ),
            ),
          )
        ],
      ),
    );
  }
}
