import 'package:boxicons/boxicons.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:remixicon/remixicon.dart';
import 'package:video_player/video_player.dart';
import 'package:wedding_pitch/style/size.dart';

class GalleryScreen extends StatefulWidget {
  final bool isActive;
  const GalleryScreen({
    required this.isActive,
    super.key,
  });

  @override
  State<GalleryScreen> createState() => _GalleryScreenState();
}

class _GalleryScreenState extends State<GalleryScreen> {
  late VideoPlayerController _videoController;
  bool _soundOn = false;

  void _toggleSound() {
    setState(() {
      _soundOn = !_soundOn;
      _toggleVolume(_soundOn);
    });
  }

  void _toggleVolume(bool soundOn) {
    if (soundOn) {
      _videoController.setVolume(1);
    } else {
      _videoController.setVolume(0);
    }
  }

  @override
  void didUpdateWidget(GalleryScreen oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (oldWidget.isActive != widget.isActive) {
      if (widget.isActive) {
        setState(() {
          _videoController.play();
        });
      } else {
        setState(() {
          _videoController.pause();
        });
      }
    }
  }

  @override
  void initState() {
    super.initState();
    _videoController = VideoPlayerController.asset("assets/images/hd.mp4")
      ..initialize().then(
        (_) {
          _videoController.setLooping(true);
          _videoController.setVolume(0);
        },
      );
    _videoController.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    _videoController.removeListener(() {
      setState(() {});
    });

    _videoController.dispose();
    super.dispose();
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
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/gallery_bg.png"),
                fit: BoxFit.cover,
              ),
            ),
            padding: const EdgeInsets.only(
              left: 24.0,
              right: 24.0,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 24.0,
                ),
                _headerSection(screenWidth),
                const SizedBox(
                  height: 24.0,
                ),
                _vidoSection(screenWidth, screenHeight),
                const SizedBox(
                  height: 48.0,
                ),
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
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(height: 12.0),
          Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 10,
              vertical: 8,
            ),
            width: 60.0,
            child: Image.asset(
              "assets/images/flower.gif",
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(height: 12.0),
          Image.asset(
            "assets/images/gallery_headline.png",
            fit: BoxFit.cover,
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
          height: screenHeight * 0.76,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16.0),
            color: const Color(0xFFF9F9F9),
          ),
          child: _videoController.value.isInitialized
              ? ClipRRect(
                  borderRadius: BorderRadius.circular(16.0),
                  child: FittedBox(
                    fit: BoxFit.cover,
                    child: SizedBox(
                      width: _videoController.value.size.width,
                      height: _videoController.value.size.height,
                      child: VideoPlayer(_videoController),
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
            _videoController.value.isPlaying
                ? _videoController.pause()
                : _videoController.play();
          },
          child: Container(
            color: Colors.transparent,
            width: screenWidth,
            height: screenHeight * 0.76,
          ),
        ),
        _soundButton(),
        _remainigTimeText(),
      ],
    );
  }

  Widget _bottomButton(double screenWidth) {
    return InkWell(
      onTap: () async {
        _videoController.pause();

        final result = await context.push("/album") as bool;

        if (result) _videoController.play();
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
            "재우와 이경의 사진 보기 ↑",
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
            padding: const EdgeInsets.only(
              top: 4.0,
              bottom: 10.0,
              left: 12.0,
              right: 12.0,
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
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

  Widget _remainigTimeText() {
    final Duration remaining =
        _videoController.value.duration - _videoController.value.position;
    final String minutes =
        (remaining.inMinutes % 60).toString().padLeft(2, '0');
    final String seconds =
        (remaining.inSeconds % 60).toString().padLeft(2, '0');

    return Positioned(
      top: 20.0,
      right: 20.0,
      child: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 8.0,
          horizontal: 12.0,
        ),
        child: Center(
          child: Text(
            '$minutes:$seconds',
            style: const TextStyle(
              fontSize: 14.0,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
