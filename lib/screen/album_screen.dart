import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
// import 'package:just_audio/just_audio.dart';
import 'package:remixicon/remixicon.dart';
import 'package:wedding_pitch/model/photo_model.dart';
import 'package:wedding_pitch/style/size.dart';
import 'package:scroll_to_index/scroll_to_index.dart';

class AlbumScreen extends StatefulWidget {
  const AlbumScreen({super.key});

  @override
  State<AlbumScreen> createState() => _AlbumScreenState();
}

class _AlbumScreenState extends State<AlbumScreen> {
  final AutoScrollController _controller = AutoScrollController();
  final FocusNode _focusNode = FocusNode();
  // final player = AudioPlayer();
  double currentOffset = 0;
  bool currentOffsetIsOver = false;

  @override
  void initState() {
    super.initState();

    // player.setUrl('assets/images/album-bgm.mp3');
    // player.play();

    _controller.addListener(() {
      if (_controller.offset > 5000 && !currentOffsetIsOver) {
        setState(() {
          currentOffsetIsOver = true;
        });
      } else if (_controller.offset < 5000 && currentOffsetIsOver) {
        setState(() {
          currentOffsetIsOver = false;
        });
      }
    });
  }

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  // void _toggleAudio() {
  //   if (player.playing) {
  //     player.pause();
//     setState(() {});
  //   } else {
  //     player.play();
  //     setState(() {});
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    final appSize = AppSize.getMaxSize(
      MediaQuery.of(context).size.width,
      MediaQuery.of(context).size.height,
    );

    final screenWidth = appSize.width;
    final screenHeight = appSize.height;

    final paddingHorizontal = screenWidth * 0.05 - 2;
    final paddingVertical = screenHeight * 0.05 - 6;

    return Scaffold(
      backgroundColor: currentOffsetIsOver ? Colors.black : Colors.white,
      body: Stack(
        children: [
          SafeArea(
            child: _photoAlbumListView(screenWidth),
          ),
          Positioned(
            left: 12.0,
            right: 12.0,
            bottom: 24.0,
            child: _bottomButton(
              context,
              paddingHorizontal: paddingHorizontal,
              paddingVertical: paddingVertical,
            ),
          ),
        ],
      ),
    );
  }

  Widget _bottomButton(BuildContext context,
      {required double paddingHorizontal, required double paddingVertical}) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(50.0),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50.0),
            color: Colors.black.withOpacity(0.1),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // InkWell(
              //   onTap: _toggleAudio,
              //   child: _bottomIconButton(
              //     iconData:
              //         player.playing ? Remix.music_2_fill : Remix.close_line,
              //     padding: EdgeInsets.only(
              //       top: paddingHorizontal,
              //       bottom: paddingHorizontal + 4,
              //       left: paddingVertical * 3 / 4,
              //       right: paddingVertical * 1 / 4,
              //     ),
              //   ),
              // ),
              Container(
                height: 12,
                width: 0.2,
                color: Colors.white,
              ),
              InkWell(
                onTap: () {
                  _controller.scrollToIndex(
                    0,
                    duration: const Duration(milliseconds: 300),
                    preferPosition: AutoScrollPosition.begin,
                  );
                  _controller.scrollToIndex(
                    0,
                    duration: const Duration(milliseconds: 10),
                    preferPosition: AutoScrollPosition.begin,
                  );
                },
                child: _scrollButton(
                  text: "첫번째",
                  paddingHorizontal: paddingHorizontal,
                  paddingVertical: paddingVertical,
                ),
              ),
              Container(
                height: 12,
                width: 0.2,
                color: Colors.white,
              ),
              InkWell(
                onTap: () {
                  _controller.scrollToIndex(
                    12,
                    duration: const Duration(milliseconds: 300),
                    preferPosition: AutoScrollPosition.begin,
                  );
                  _controller.scrollToIndex(
                    12,
                    duration: const Duration(milliseconds: 10),
                    preferPosition: AutoScrollPosition.begin,
                  );
                },
                child: _scrollButton(
                  text: "두번째",
                  paddingHorizontal: paddingHorizontal,
                  paddingVertical: paddingVertical,
                ),
              ),
              Container(
                height: 12,
                width: 0.2,
                color: Colors.white,
              ),
              InkWell(
                onTap: () {
                  _controller.scrollToIndex(
                    19,
                    duration: const Duration(milliseconds: 300),
                    preferPosition: AutoScrollPosition.begin,
                  );
                  _controller.scrollToIndex(
                    19,
                    duration: const Duration(milliseconds: 10),
                    preferPosition: AutoScrollPosition.begin,
                  );
                },
                child: _scrollButton(
                  text: "세번째",
                  paddingHorizontal: paddingHorizontal,
                  paddingVertical: paddingVertical,
                ),
              ),
              Container(
                height: 12,
                width: 0.2,
                color: Colors.white,
              ),
              InkWell(
                onTap: () {
                  context.pop(true);
                  // player.stop();
                },
                child: _bottomIconButton(
                  iconData: Remix.close_circle_fill,
                  padding: EdgeInsets.only(
                    top: paddingHorizontal,
                    bottom: paddingHorizontal + 4,
                    left: paddingVertical * 1 / 4,
                    right: paddingVertical * 3 / 4,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Container _scrollButton({
    required String text,
    required paddingVertical,
    required paddingHorizontal,
  }) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: paddingHorizontal,
        vertical: paddingVertical * 1 / 2,
      ),
      child: Text(
        text,
        style: const TextStyle(
          fontSize: 14.0,
          color: Colors.white,
        ),
      ),
    );
  }

  Container _bottomIconButton({
    required IconData iconData,
    EdgeInsetsGeometry? padding,
  }) {
    return Container(
      padding: padding ??
          const EdgeInsets.only(
            top: 20.0,
            bottom: 20.0,
            left: 20.0,
            right: 20.0,
          ),
      child: Icon(
        iconData,
        color: Colors.white,
      ),
    );
  }

  EdgeInsetsGeometry _getPaddingByIndex(int index) {
    if (index == 0) {
      return const EdgeInsets.only(
        left: 24.0,
        right: 24.0,
        bottom: 18.0,
        top: 48.0,
      );
    } else if (index == 11 || index == 18 || index == 36) {
      return const EdgeInsets.only(
        left: 24.0,
        right: 24.0,
        bottom: 90.0,
        top: 24.0,
      );
    } else if (index == 12 || index == 19) {
      return const EdgeInsets.only(
        left: 24.0,
        right: 24.0,
        bottom: 18.0,
        top: 80.0,
      );
    } else {
      return const EdgeInsets.symmetric(
        horizontal: 24.0,
        vertical: 24.0,
      );
    }
  }

  Widget _photoAlbumListView(double screenWidth) {
    final listViewWidth = screenWidth - 48.0;

    return ListView.builder(
      controller: _controller,
      padding: EdgeInsets.zero,
      itemCount: photoModels.length,
      itemBuilder: (context, index) {
        final photo = photoModels[index];

        return AutoScrollTag(
          index: index,
          controller: _controller,
          key: ValueKey(index),
          child: _photoItem(
            listViewWidth,
            albumColor: photo.albumColor,
            imagePath: photo.imagePath,
            imageRate: photo.imageRate,
            imageSortType: photo.imageSortType,
            padding: _getPaddingByIndex(index),
          ),
        );
      },
    );
  }

  Widget _photoItem(
    double listViewWidth, {
    required double imageRate,
    required Color albumColor,
    required String imagePath,
    required ImageSortType imageSortType,
    EdgeInsetsGeometry padding = const EdgeInsets.symmetric(
      horizontal: 24.0,
      vertical: 24.0,
    ),
  }) {
    return Container(
      padding: padding,
      decoration: BoxDecoration(
        color: albumColor,
      ),
      child: Row(
        mainAxisAlignment: _getMainAxisAlignment(imageSortType),
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8.0),
            child: Image.asset(
              imagePath,
              fit: BoxFit.cover,
              width: listViewWidth * imageRate,
            ),
          ),
        ],
      ),
    );
  }

  MainAxisAlignment _getMainAxisAlignment(ImageSortType imageSortType) {
    switch (imageSortType) {
      case ImageSortType.full:
        return MainAxisAlignment.center;
      case ImageSortType.left:
        return MainAxisAlignment.start;
      case ImageSortType.right:
        return MainAxisAlignment.end;
    }
  }
}
