import 'package:common/common.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gen/gen.dart';

import '../../../core/components/adv_logo.dart';
import '../../../core/components/app_text.dart';
import '../../../utils/extensions.dart';
import '../../../utils/helpers.dart';

class CollapsibleImageHeader implements SliverPersistentHeaderDelegate {
  CollapsibleImageHeader({
    this.title,
    this.subTitle,
    this.videoUrl,
    this.logoUrl,
    this.bgUrl,
    this.time,
    this.viewCount,
  });
  final String? title;
  final String? subTitle;
  final DateTime? time;
  final int? viewCount;
  final String? videoUrl;
  final String? logoUrl;
  final String? bgUrl;

  @override
  double get maxExtent => 335;

  @override
  double get minExtent => kToolbarHeight.w + 20.w;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return true;
  }

  @override
  Widget build(
    BuildContext context,
    double shrinkOffset,
    bool overlapsContent,
  ) {
    // const maxHeight = 626;
    final width = MediaQuery.sizeOf(context).width;
    final progress = shrinkOffset / (maxExtent - minExtent);
    final currentProgress = progress.clamp(0.0, 1.0);

    // Calculate current height
    final currentHeight =
        maxExtent - shrinkOffset.clamp(0.0, maxExtent - minExtent);

    // Only show AppBar when almost fully collapsed
    final showAppBar = currentProgress > 0.95;
    final actualHeight = currentHeight - 100 < 1 ? null : currentHeight - 100;

    return Stack(
      children: [
        SizedBox(
          height: currentHeight,
          child: Stack(
            children: [
              SizedBox(
                height: actualHeight,
                width: double.infinity,
                child: AspectRatio(
                  aspectRatio: width / 235,
                  child: CustomNetworkImage(
                    imageUrl: bgUrl,
                    memCache: CustomMemCache(
                      height: 235.withDevicePixel(context),
                      width: width.toInt().withDevicePixel(context),
                    ),
                  ),
                ),
              ),
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: Container(
                  color: const Color(0xffE9E9E9),
                  padding: const EdgeInsets.fromLTRB(
                    16,
                    40,
                    16,
                    14,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AppText.s14w400BdM(title ?? ''),
                      6.boxH,
                      Row(
                        children: [
                          SizedBox(
                            height: 16,
                            width: 16,
                            child: Assets.icons.icCalendar.svg(package: 'gen'),
                          ),
                          4.boxW,
                          AppText.s12w400BdS(
                            Helpers.formatDateAsMMDDYYYY(time),
                          ),
                          6.boxW,
                          SizedBox(
                            height: 16,
                            width: 16,
                            child: Assets.icons.icEye.svg(package: 'gen'),
                          ),
                          4.boxW,
                          AppText.s12w400BdS(
                            viewCount?.toString() ?? '',
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                left: 16,
                bottom: 70,
                child: AdvLogo(
                  imageUrl: logoUrl,
                  size: const Size(63, 63),
                ),
              ),
            ],
          ),
        ),
        Positioned(
          top: 0,
          left: 0,
          right: 0,
          height: minExtent,
          child: AppBar(
            surfaceTintColor: Colors.transparent,
            backgroundColor: currentProgress > .45
                ? const Color(0xffE9E9E9)
                : Colors.transparent,
            elevation: 0,
            foregroundColor: Colors.white,
            leading: IconButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              icon: Assets.icons.icBack.svg(
                package: 'gen',
              ),
            ),
            centerTitle: false,
            title: showAppBar
                ? Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      AdvLogo(
                        imageUrl: logoUrl,
                        size: const Size(36, 36),
                      ),
                      6.boxW,
                      AppText.s14w400BdM(title ?? ''),
                    ],
                  )
                : null,
            actions: [
              IconButton(
                icon: Assets.icons.icShare.svg(package: 'gen'),
                onPressed: () {},
              ),
            ],
          ),
        ),
      ],
    );
  }

  @override
  FloatingHeaderSnapConfiguration? get snapConfiguration => null;

  @override
  OverScrollHeaderStretchConfiguration? get stretchConfiguration => null;

  @override
  PersistentHeaderShowOnScreenConfiguration? get showOnScreenConfiguration =>
      null;

  @override
  TickerProvider? get vsync => null;
}
