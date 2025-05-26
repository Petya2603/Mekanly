import 'package:common/common.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../remote/entities/houses/house_entity.dart';
import '../../utils/extensions.dart';

class CommonProductCardWidget extends StatefulWidget {
  const CommonProductCardWidget({super.key});

  @override
  State<CommonProductCardWidget> createState() =>
      _CommonProductCardWidgetState();
}

class _CommonProductCardWidgetState extends State<CommonProductCardWidget> {
  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 167 / 225,
      child: Container(
      ),
    );
  }
}



class HousesCarouselSlider extends StatefulWidget {
  const HousesCarouselSlider({
    super.key,
    this.imgUrls,
  });

  final List<ImageUrl>? imgUrls;

  @override
  State<HousesCarouselSlider> createState() => _HousesCarouselSliderState();
}

class _HousesCarouselSliderState extends State<HousesCarouselSlider> {
  final PageController _controller = PageController(keepPage: false);
  final ValueNotifier<int> _pageNotifier = ValueNotifier<int>(0);

  @override
  Widget build(BuildContext context) {
    final width = context.mediaQuery.size.width - 40.w;

    return Stack(
      children: [
        PageView.builder(
          itemCount: widget.imgUrls?.length,
          controller: _controller,
          onPageChanged: (value) => _pageNotifier.value = value,
          itemBuilder: (context, index) {
            final img = widget.imgUrls?[index];
            return CustomNetworkImage(
              memCache: CustomMemCache(
                height: 235.withDevicePixel(context),
                width: width.toInt().withDevicePixel(context),
              ),
              imageUrl: img?.url,
            );
          },
        ),
        if ((widget.imgUrls?.length ?? 0) > 2)
          Positioned(
            bottom: 10,
            left: 0,
            right: 0,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 20).w,
              height: 10.h,
              alignment: Alignment.center,
              child: ValueListenableBuilder<int>(
                valueListenable: _pageNotifier,
                builder: (_, page, __) {
                  return Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(
                      widget.imgUrls!.length,
                      (index) => AnimatedContainer(
                        duration: const Duration(milliseconds: 300),
                        width: index == (page % widget.imgUrls!.length)
                            ? 10.h * 0.5
                            : 10.h * 0.4,
                        height: index == (page % widget.imgUrls!.length)
                            ? 10.h * 0.5
                            : 10.h * 0.4,
                        margin: const EdgeInsets.symmetric(horizontal: 3).w,
                        decoration: BoxDecoration(
                          color: index == (page % widget.imgUrls!.length)
                              ? Colors.white
                              : Colors.white60,
                          shape: BoxShape.circle,
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
      ],
    );
  }
}
