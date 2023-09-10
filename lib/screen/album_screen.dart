import 'dart:ui';

import 'package:flutter/material.dart';
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
  double currentOffset = 0;
  bool currentOffsetIsOver = false;

  @override
  void initState() {
    super.initState();

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
  Widget build(BuildContext context) {
    final appSize = AppSize.getMaxSize(
      MediaQuery.of(context).size.width,
      MediaQuery.of(context).size.height,
    );

    final screenWidth = appSize.width;
    // final screenHeight = appSize.height;

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
            child: _bottomButton(context),
          ),
        ],
      ),
    );
  }

  Widget _bottomButton(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(50.0),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 20.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50.0),
            color: Colors.black.withOpacity(0.1),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
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
                child: const Text(
                  "오색 꽃밫",
                  style: TextStyle(
                    fontSize: 14.0,
                    color: Colors.white,
                  ),
                ),
              ),
              Container(
                height: 12,
                width: 0.5,
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
                child: const Text(
                  "초록 여름",
                  style: TextStyle(
                    fontSize: 14.0,
                    color: Colors.white,
                  ),
                ),
              ),
              Container(
                height: 12,
                width: 0.5,
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
                child: const Text(
                  "쪽빛 바다",
                  style: TextStyle(
                    fontSize: 14.0,
                    color: Colors.white,
                  ),
                ),
              ),
              Container(
                height: 12,
                width: 0.5,
                color: Colors.white,
              ),
              InkWell(
                onTap: () {
                  Navigator.of(context).pop();
                },
                child: const Icon(
                  Remix.close_circle_fill,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
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
