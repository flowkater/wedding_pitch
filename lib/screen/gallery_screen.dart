import 'package:boxicons/boxicons.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:remixicon/remixicon.dart';
import 'package:video_player/video_player.dart';
import 'package:wedding_pitch/style/size.dart';

class GalleryScreen extends StatefulWidget {
  final VideoPlayerController videoController;

  const GalleryScreen({
    required this.videoController,
    super.key,
  });

  @override
  State<GalleryScreen> createState() => _GalleryScreenState();
}

class _GalleryScreenState extends State<GalleryScreen> {
  bool _soundOn = false;

  void _toggleSound() {
    setState(() {
      _soundOn = !_soundOn;
      _toggleVolume(_soundOn);
    });
  }

  void _toggleVolume(bool soundOn) {
    if (soundOn) {
      widget.videoController.setVolume(1);
    } else {
      widget.videoController.setVolume(0);
    }
  }

  @override
  void initState() {
    super.initState();
    widget.videoController.play();
  }

  @override
  Widget build(BuildContext context) {
    final appSize = AppSize.getMaxSize(
      MediaQuery.of(context).size.width,
      MediaQuery.of(context).size.height,
    );

    final screenWidth = appSize.width;
    final screenHeight = appSize.height;

    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.only(
              left: 24.0,
              right: 24.0,
            ),
            color: Colors.white,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                _headerSection(screenWidth),
                const SizedBox(
                  height: 24.0,
                ),
                _vidoSection(screenWidth, screenHeight),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        elevation: 0,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0),
          child: _bottomButton(screenWidth),
        ),
      ),
    );
  }

  Widget _headerSection(double screenWidth) {
    return SizedBox(
      width: screenWidth,
      child: const Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Text(
            "동백과 같은 마음과 태도로",
            style: TextStyle(
              fontSize: 24.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            "함께하는 이 길을 사랑하겠습니다.",
            style: TextStyle(
              fontSize: 24.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }

  Widget _vidoSection(double screenWidth, double screenHeight) {
    return Stack(
      children: [
        Container(
          width: screenWidth,
          height: screenHeight * 0.65,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(24.0),
            color: const Color(0xFFF9F9F9),
          ),
          child: widget.videoController.value.isInitialized
              ? ClipRRect(
                  borderRadius: BorderRadius.circular(24.0),
                  child: FittedBox(
                    fit: BoxFit.cover,
                    child: SizedBox(
                      width: widget.videoController.value.size.width,
                      height: widget.videoController.value.size.height,
                      child: VideoPlayer(widget.videoController),
                    ),
                  ),
                )
              : ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Image.asset(
                    'assets/images/cover-test.png',
                    fit: BoxFit.cover,
                  ),
                ),
        ),
        GestureDetector(
          onTap: () {
            widget.videoController.value.isPlaying
                ? widget.videoController.pause()
                : widget.videoController.play();
          },
          child: Container(
            color: Colors.transparent,
            width: screenWidth,
            height: screenHeight * 0.65,
          ),
        ),
        _soundButton(),
      ],
    );
  }

  Widget _bottomButton(double screenWidth) {
    return InkWell(
      onTap: () async {
        widget.videoController.pause();

        final result = await context.push("/album") as bool;
        // final result = await Navigator.of(context).push(
        //   MaterialPageRoute(
        //     // fullscreenDialog: true,
        //     builder: (context) => const AlbumScreen(),
        //   ),
        // );

        if (result) widget.videoController.play();
      },
      child: Container(
        width: screenWidth,
        height: 60.0,
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 18.0),
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(24.0),
            topRight: Radius.circular(24.0),
          ),
          color: Colors.black,
        ),
        child: const Center(
          child: Text(
            "재우와 이경의 사진 보기 →",
            style: TextStyle(
              fontSize: 16.0,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }

  Widget _soundButton() {
    return Positioned(
      top: 20.0,
      left: 20.0,
      child: InkWell(
        onTap: _toggleSound,
        child: Container(
          decoration: BoxDecoration(
            color: Colors.black.withOpacity(0.2),
            borderRadius: BorderRadius.circular(50.0),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 8.0,
              horizontal: 12.0,
            ),
            child: Row(
              children: [
                AnimatedOpacity(
                  duration: const Duration(milliseconds: 300),
                  opacity: _soundOn ? 1.0 : 0.2,
                  child: const Icon(
                    Boxicons.bxs_music,
                    color: Colors.white,
                  ),
                ),
                _soundOn
                    ? const Icon(
                        Boxicons.bx_check,
                        color: Colors.white,
                      )
                    : const Icon(
                        Remix.close_line,
                        color: Colors.white,
                      ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
