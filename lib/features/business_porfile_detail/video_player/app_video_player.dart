import 'package:common/common.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

import '../../../core/components/loading_indicator.dart';

class StaticVideoComponent extends StatefulWidget {
  const StaticVideoComponent({
    super.key,
    required this.path,
    this.isVertical = false,
    this.ismuted = false,
    this.autoPlay = false,
    this.aspectRatio = 16 / 9,
    this.vPController,
  });
  final VideoPlayerController? vPController;
  final String path;
  final bool isVertical;
  final bool ismuted;
  final bool autoPlay;
  final double? aspectRatio;

  @override
  State<StatefulWidget> createState() => _StaticVideoComponent();
}

class _StaticVideoComponent extends State<StaticVideoComponent> {
  bool started = false;
  VideoPlayerController? videoPlayerController;
  bool isShown = true;
  @override
  void initState() {
    isShown = false;

    super.initState();

    if (widget.vPController == null) {
      videoPlayerController = VideoPlayerController.networkUrl(
        Uri.parse(widget.path),
      )..setLooping(true);

      videoPlayerController!.initialize().then((value) async {
        setState(() {});
        Future.delayed(const Duration(seconds: 3), () {
          setState(() {
            isShown = false;
          });
        });
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    final screenRation = screenWidth / screenHeight;
    final videoRatio = widget.aspectRatio!;

    final capHeight = videoRatio < screenRation;

    double vidHeight;
    double vidWidth;

    if (capHeight) {
      vidHeight = screenHeight - 150;
      vidWidth = vidHeight * videoRatio;
    } else {
      vidWidth = screenWidth - 32;
      vidHeight = vidWidth / videoRatio;
    }

    if (videoPlayerController != null &&
        videoPlayerController!.value.isInitialized) {
      return getWid(videoPlayerController!, vidHeight, vidWidth, videoRatio);
    } else if (widget.vPController != null &&
        widget.vPController!.value.isInitialized) {
      return getWid(widget.vPController!, vidHeight, vidWidth, videoRatio);
    } else {
      return Center(
        child: LoadingIndicator.circle(),
      );
    }
  }

  Widget getWid(
    VideoPlayerController vp,
    double vidHeight,
    double vidWidth,
    double videoRatio,
  ) {
    return InkWell(
      onTap: () {
        setState(() {
          isShown = !isShown;
        });
        if (isShown) {
          Future.delayed(const Duration(seconds: 3), () {
            setState(() {
              isShown = false;
            });
          });
        }
      },
      child: Stack(
        children: [
          Positioned(
            child: Center(
              child: SizedBox(
                height: vidHeight,
                width: vidWidth,
                child: AbsorbPointer(
                  child: Center(
                    child: AspectRatio(
                      aspectRatio: videoRatio,
                      child: VideoPlayer(
                        vp,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
          if (isShown)
            Positioned(
              left: -16,
              right: -16,
              bottom: 0,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const SizedBox(
                    height: 12,
                  ),
                  Directionality(
                    textDirection: TextDirection.ltr,
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(2),
                      ),
                      clipBehavior: Clip.hardEdge,
                      child: VideoPlayerControls(
                        onTap: () {
                          setState(() {
                            isShown = true;
                          });
                          Future.delayed(const Duration(seconds: 3), () {
                            setState(() {
                              isShown = false;
                            });
                          });
                        },
                        controller: vp,
                        isVertical: widget.isVertical,
                        width: vidWidth,
                        ratio: videoRatio,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          if (!started)
            Positioned.fill(
              child: GestureDetector(
                onTap: () {
                  vp.play();
                  setState(() {
                    isShown = true;
                    Future.delayed(const Duration(seconds: 3), () {
                      setState(() {
                        isShown = false;
                      });
                    });
                    started = true;
                  });
                },
                child: ColoredBox(
                  color: Colors.transparent,
                  child: Center(
                    child: Opacity(
                      opacity: 0.75,
                      child: Container(
                        height: 90,
                        width: 90,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.black,
                        ),
                        child: const Center(
                          child: Icon(
                            Icons.play_arrow_rounded,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    try {
      videoPlayerController!.dispose();
    } catch (e) {
      BaseLogger.error(e.toString());
    }

    if (widget.vPController != null) {
      try {
        widget.vPController?.dispose();
      } catch (e) {
        BaseLogger.error(e.toString());
      }
    }
    super.dispose();
  }
}

class VideoPlayerControls extends StatefulWidget {
  const VideoPlayerControls({
    super.key,
    required this.controller,
    this.isVertical = false,
    this.width,
    this.onTap,
    this.ratio = 16 / 9,
    this.exit,
  });
  final VideoPlayerController controller;
  final bool isVertical;
  final double ratio;
  final VoidCallback? exit;
  final VoidCallback? onTap;
  final double? width;

  @override
  State<VideoPlayerControls> createState() => _VideoPlayerControlsState();
}

class _VideoPlayerControlsState extends State<VideoPlayerControls> {
  VideoPlayerController get controller => widget.controller;

  String _printDuration(Duration duration) {
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    final twoDigitMinutes = twoDigits(duration.inMinutes.remainder(60));
    final twoDigitSeconds = twoDigits(duration.inSeconds.remainder(60));
    return '${twoDigits(duration.inHours)}:$twoDigitMinutes:$twoDigitSeconds';
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<VideoPlayerValue>(
      valueListenable: controller,
      builder: (context, value, child) {
        if (!value.isInitialized) {
          return Container();
        }
        return SizedBox(
          height: 120,
          width: widget.width,
          child: Stack(
            children: [
              Positioned(
                left: 0,
                right: 0,
                bottom: -20,
                child: Container(
                  height: 110,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: FractionalOffset.bottomCenter,
                      end: FractionalOffset.topCenter,
                      stops: const [0, .75, 1.0],
                      colors: [
                        Colors.black.withAlpha(242),
                        Colors.black.withAlpha(102),
                        Colors.transparent,
                      ],
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding:
                            const EdgeInsets.only(right: 16, left: 16, top: 9),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              _printDuration(value.position),
                              style: const TextStyle(color: Colors.white),
                            ),
                            Text(
                              _printDuration(value.duration),
                              style: const TextStyle(color: Colors.white),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      VideoProgressIndicator(controller),
                      Row(
                        children: [
                          IconButton(
                            color: Colors.white,
                            splashRadius: 1,
                            icon: Icon(
                              value.isPlaying ? Icons.pause : Icons.play_arrow,
                            ),
                            onPressed: () {
                              widget.onTap?.call();
                              if (value.isPlaying) {
                                controller.pause();
                              } else {
                                try {
                                  controller.play();
                                } catch (e) {
                                  controller.seekTo(Duration.zero);
                                }
                              }
                            },
                          ),
                          IconButton(
                            color: Colors.white,
                            splashRadius: 1,
                            icon: Icon(
                              value.volume == 0
                                  ? Icons.volume_off
                                  : Icons.volume_up,
                            ),
                            onPressed: () => value.volume == 0
                                ? controller.setVolume(1)
                                : controller.setVolume(0),
                          ),
                          const Spacer(),
                          IconButton(
                            color: Colors.white,
                            splashRadius: 1,
                            icon: Icon(
                              widget.exit != null
                                  ? Icons.fullscreen_exit
                                  : Icons.fullscreen,
                            ),
                            onPressed: widget.exit != null
                                ? () => widget.exit!.call()
                                : () {},
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

class VideoProgressIndicator extends StatefulWidget {
  const VideoProgressIndicator(
    this.controller, {
    super.key,
    this.forMoments = false,
  });
  final VideoPlayerController controller;
  final bool forMoments;

  @override
  State<VideoProgressIndicator> createState() => _VideoProgressIndicatorState();
}

class _VideoProgressIndicatorState extends State<VideoProgressIndicator> {
  double? _value;
  bool _isDragging = false;

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<VideoPlayerValue>(
      valueListenable: widget.controller,
      builder: (context, value, child) {
        final isInitialized = widget.controller.value.isInitialized;
        final duration = value.duration.inMilliseconds.toDouble();
        var sliderValue = _isDragging
            ? (_value ?? value.position.inMilliseconds.toDouble())
            : value.position.inMilliseconds.toDouble();
        sliderValue = sliderValue.clamp(0.0, duration);

        try {
          return LayoutBuilder(
            builder: (context, constraints) {
              return SizedBox(
                height: 8,
                width: constraints.maxWidth,
                child: SliderTheme(
                  data: SliderTheme.of(context).copyWith(
                    trackHeight: 3,
                    thumbShape: RoundSliderThumbShape(
                      enabledThumbRadius: widget.forMoments ? 0 : 8,
                    ),
                    thumbColor: Colors.white,
                    activeTrackColor: Colors.white,
                    inactiveTrackColor: widget.forMoments
                        ? Colors.white38
                        : const Color(0xFFB9B9B9),
                    trackShape: const RectangularSliderTrackShape(),
                  ),
                  child: IgnorePointer(
                    ignoring: !isInitialized,
                    child: Slider(
                      max: duration,
                      value: sliderValue,
                      onChanged: (value) {
                        if (mounted) {
                          setState(() {
                            _value = value;
                            _isDragging = true;
                          });
                        }
                      },
                      onChangeStart: (value) =>
                          setState(() => _isDragging = true),
                      onChangeEnd: (value) {
                        if (value >= duration) {
                          widget.controller.seekTo(Duration.zero);
                        } else {
                          widget.controller
                              .seekTo(Duration(milliseconds: value.toInt()));
                        }
                        if (mounted) {
                          setState(() {
                            _value = null;
                            _isDragging = false;
                          });
                        }
                      },
                    ),
                  ),
                ),
              );
            },
          );
        } catch (e) {
          return const SizedBox();
        }
      },
    );
  }
}
