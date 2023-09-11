import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:wedding_pitch/layout/page_layout.dart';
import 'package:wedding_pitch/style/font.dart';

class EntrySecondPage extends StatelessWidget {
  const EntrySecondPage({super.key});

  @override
  Widget build(BuildContext context) {
    return PageLayout(
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              "images/cover.png",
              fit: BoxFit.fill,
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 140.0,
                  ),
                  Hero(
                    tag: "wedding-title",
                    child: Material(
                      type: MaterialType.transparency,
                      child: RichText(
                        text: const TextSpan(
                          text: "결혼합니다",
                          style: TextStyle(
                            color: Colors.black,
                            fontFamily: FontFamily.bold,
                            fontSize: 48.0,
                            letterSpacing: -4,
                            height: 1.1,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Hero(
                    tag: "wedding-subTitle",
                    child: Material(
                      type: MaterialType.transparency,
                      child: RichText(
                        text: const TextSpan(
                          text: "이경과 재우",
                          style: TextStyle(
                            color: Colors.black,
                            fontFamily: FontFamily.regular,
                            fontSize: 64.0,
                            letterSpacing: -4,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Stack(
                    children: [
                      Positioned.fill(
                        child: ClipRect(
                          child: BackdropFilter(
                            filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
                            child: Container(
                              color: Colors.white
                                  .withOpacity(0.2), // 약간의 투명도를 가진 검은색 배경
                            ),
                          ),
                        ),
                      ),
                      const Text(
                        "↘ 2023/11/04 16:10",
                        style: TextStyle(
                          color: Colors.white,
                          fontFamily: FontFamily.bold,
                          fontSize: 20.0,
                          // backgroundColor: Colors.white,
                        ),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 5.0,
                  ),
                  const Text(
                    "↘ 여의도 더파티움 파티움홀 2층",
                    style: TextStyle(
                      color: Colors.white,
                      fontFamily: FontFamily.bold,
                      fontSize: 20.0,
                      backgroundColor: Colors.white,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}

// class EntryPage extends StatelessWidget {
//   const EntryPage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       mainAxisAlignment: MainAxisAlignment.center,
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Hero(
//           tag: "wedding-title",
//           child: Material(
//             type: MaterialType.transparency,
//             child: RichText(
//               text: const TextSpan(
//                 text: "결혼합니다",
//                 style: TextStyle(
//                   color: Colors.black,
//                   fontFamily: FontFamily.regular,
//                   fontSize: 64.0,
//                   letterSpacing: -4,
//                   height: 1.1,
//                 ),
//               ),
//             ),
//           ),
//         ),
//         Hero(
//           tag: "wedding-subTitle",
//           child: Material(
//             type: MaterialType.transparency,
//             child: RichText(
//               text: const TextSpan(
//                 text: "이경과 재우",
//                 style: TextStyle(
//                   color: Colors.black,
//                   fontFamily: FontFamily.bold,
//                   fontSize: 48.0,
//                   letterSpacing: -4,
//                 ),
//               ),
//             ),
//           ),
//         ),
//         const SizedBox(
//           height: 24.0,
//         ),
//         const Text(
//           "↘ 2023/11/04 16:10",
//           style: TextStyle(
//             color: Colors.black,
//             fontFamily: FontFamily.regular,
//             fontSize: 22.0,
//             backgroundColor: Colors.white,
//           ),
//         ),
//         const SizedBox(
//           height: 5.0,
//         ),
//         const Text(
//           "↘ 여의도 더파티움 파티움홀 2층",
//           style: TextStyle(
//             color: Colors.black,
//             fontFamily: FontFamily.regular,
//             fontSize: 22.0,
//             backgroundColor: Colors.white,
//           ),
//         ),
//       ],
//     );
//   }
// }
