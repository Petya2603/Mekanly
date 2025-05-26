import 'package:common/common.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gen/gen.dart';

import '../../product/constants/constants.dart';
import '../../remote/entities/top_ads/top_ads_entity.dart';
import '../../utils/extensions.dart';
import 'app_text.dart';

class AnnouncementCard extends StatelessWidget {
  const AnnouncementCard({super.key, this.topAds});

  final TopAdsEntity? topAds;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      constraints: BoxConstraints(
        maxHeight: 106.w,
      ),
      child: DecoratedBox(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(7).r,
          color: ColorName.white,
          boxShadow: [
            BoxShadow(
              color: ColorName.black.withValues(alpha: 0.25),
              blurRadius: 2.5,
            ),
          ],
        ),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.horizontal(
                left: const Radius.circular(7).r,
              ),
              child: SizedBox(
                height: 106.w,
                width: 106.w,
                child: CustomNetworkImage(
                  imageUrl: topAds?.image,
                  memCache: CustomMemCache(
                    height: 106.w.toInt().withDevicePixel(context),
                    width: 106.w.toInt().withDevicePixel(context),
                  ),
                ),
              ),
            ),
            10.boxW,
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  6.boxH,
                  AppText.s14w400BdM(
                    topAds?.name ?? '',
                    fontFamily: StringConstants.roboto,
                  ),
                  2.boxH,
                  AppText.s10w400LbS(
                    '${topAds?.location?.parent ?? ''}/${topAds?.location?.name ?? ''} mkr1,  02.08.2024',
                    color: const Color(0xff717171),
                    fontFamily: StringConstants.roboto,
                    maxLines: 1,
                  ),
                  2.boxH,
                  AppText.s10w400LbS(
                    topAds?.description ?? '',
                    color: const Color(0xff717171),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    fontFamily: StringConstants.roboto,
                  ),
                  6.boxH,
                  AppText.s14w400BdM(
                    '10 000 TMT',
                    color: ColorName.black,
                    fontFamily: StringConstants.roboto,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
