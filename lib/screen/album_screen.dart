import 'package:flutter/material.dart';
import 'package:wedding_pitch/style/color.dart';

class AlbumScreen extends StatelessWidget {
  const AlbumScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SelectionArea(
      child: SafeArea(
        child: Scaffold(
          backgroundColor: WeddingColor.albumStudioColor,
          body: Center(
            child: ListView.builder(
              itemBuilder: (context, index) {
                if (index == 0) {
                  return Container(
                    padding: const EdgeInsets.only(
                      left: 24.0,
                      right: 24.0,
                      bottom: 18.0,
                      top: 48.0,
                    ),
                    color: WeddingColor.albumStudioColor,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Image.asset(
                          "assets/images/album-studio-title.png",
                          fit: BoxFit.cover,
                          width: 245,
                          height: 48,
                        ),
                      ],
                    ),
                  );
                }

                if (index == 1) {
                  return Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 24.0,
                      vertical: 24.0,
                    ),
                    color: WeddingColor.albumStudioColor,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(8.0),
                          child: Image.asset(
                            "assets/images/101-DSC00294.jpg",
                            fit: BoxFit.cover,
                            width: 327,
                            height: 490,
                          ),
                        ),
                      ],
                    ),
                  );
                }

                if (index == 2) {
                  return Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 24.0,
                      vertical: 24.0,
                    ),
                    color: WeddingColor.albumStudioColor,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(8.0),
                          child: Image.asset(
                            "assets/images/102-DSC00548.jpg",
                            fit: BoxFit.cover,
                            width: 250,
                            height: 375.5,
                          ),
                        ),
                      ],
                    ),
                  );
                }

                return Container(
                  height: 20,
                  color: Colors.red,
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
