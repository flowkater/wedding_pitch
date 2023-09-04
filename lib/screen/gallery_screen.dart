import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:remixicon/remixicon.dart';
import 'package:video_player/video_player.dart';
import 'package:wedding_pitch/widget/bottom_button.dart';
import 'package:widget_mask/widget_mask.dart';

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
  late VideoPlayerController _controller;
  bool _soundOn = true;

  void _toggleSound() {
    setState(() {
      _soundOn = !_soundOn;
      _toggleVolume(_soundOn);
    });
  }

  void _toggleVolume(bool soundOn) {
    if (soundOn) {
      _controller.setVolume(1);
    } else {
      _controller.setVolume(0);
    }
  }

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.asset("assets/images/vllo.mp4")
      ..initialize().then((_) {
        _controller.setLooping(true);
      });

    if (widget.isActive) {
      setState(() {
        _controller.play();
      });
    }
  }

  @override
  void didUpdateWidget(covariant GalleryScreen oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (oldWidget.isActive != widget.isActive) {
      if (widget.isActive) {
        _controller.play();
      } else {
        _controller.pause();
      }
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SelectionArea(
      child: SafeArea(
        child: Container(
          color: Colors.white,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      WidgetMask(
                        mask: Image.asset(
                          'assets/images/subtract.png',
                          fit: BoxFit.fill,
                        ),
                        child: _controller.value.isInitialized
                            ? SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * 0.7,
                                child: AspectRatio(
                                  aspectRatio: _controller.value.aspectRatio,
                                  child: VideoPlayer(_controller),
                                ),
                              )
                            : Image.asset(
                                'assets/images/cover-test.png',
                                fit: BoxFit.cover,
                              ),
                      ),
                      GestureDetector(
                        onTap: () {
                          _controller.value.isPlaying
                              ? _controller.pause()
                              : _controller.play();
                        },
                        child: Container(
                          width: MediaQuery.of(context).size.height *
                                  0.7 *
                                  _controller.value.aspectRatio +
                              2,
                          height: MediaQuery.of(context).size.height * 0.7 + 2,
                          decoration: BoxDecoration(
                            border: Border.all(
                                color: Colors.white, width: 1), // 테두리 설정
                            image: const DecorationImage(
                              image: AssetImage('assets/images/subtract.png'),
                              fit: BoxFit.fill,
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        // top: 0.0,
                        top: MediaQuery.of(context).size.height * 0.1,
                        left: 20.0,
                        child: GestureDetector(
                          onTap: _toggleSound,
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.black,
                              borderRadius: BorderRadius.circular(16.0),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                vertical: 4.0,
                                horizontal: 12.0,
                              ),
                              child: Row(
                                children: [
                                  AnimatedOpacity(
                                    duration: const Duration(milliseconds: 300),
                                    opacity: _soundOn ? 1.0 : 0.2,
                                    child: const Icon(
                                      Remix.music_2_fill,
                                      color: Colors.white,
                                    ),
                                  ),
                                  _soundOn
                                      ? const Icon(
                                          Remix.check_line,
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
                      ),
                    ],
                  ),
                ),
                Column(
                  children: [
                    BottomButton(
                      onTap: () {
                        context.go('/album');
                      },
                      buttonText: "앨범 펼쳐보기 +",
                    ),
                    const SizedBox(
                      height: 48.0,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
