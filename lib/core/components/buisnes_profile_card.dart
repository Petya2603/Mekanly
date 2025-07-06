import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gen/gen.dart';
import '../../features/business_porfile_detail/business_porfile_detail_view.dart';
import '../../product/constants/constants.dart';
import '../../product/transitions/custom_page_route.dart';
import '../../remote/entities/business_profile/business_profile_entity.dart';
import '../../utils/extensions.dart';
import 'app_text.dart';

class BusinessProfileCard extends StatelessWidget {
  const BusinessProfileCard({super.key, this.profile});

  final BusinessProfileEntity? profile;

  @override
  Widget build(BuildContext context) {
    if (profile == null || profile?.id == null) return const SizedBox.shrink();
    final brand = profile?.brand ?? '';
    final desc = profile?.description?.tk ?? '';
    final logoUrl = profile?.logo ?? '';

    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          CustomPageRoute.slide(
            BusinessProfileDetailView.builder(context, profile!.id!),
          ),
        );
      },
      child: Container(
        constraints: BoxConstraints(
          maxHeight: 86.w,
        ),
        padding: const EdgeInsets.symmetric(horizontal: 14).w,
        child: DecoratedBox(
          decoration: BoxDecoration(
            border: Border.all(
              color: ColorName.notifyShadow,
            ),
            borderRadius: BorderRadius.circular(5).r,
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.horizontal(
                  left: const Radius.circular(5).r,
                ),
                child: SizedBox(
                  width: 84.w,
                  height: 86.w,
                  // child: CustomNetworkImage(
                  //   imageUrl: logoUrl,
                  //   memCache: CustomMemCache(
                  //     height: 86.w.toInt().withDevicePixel(context),
                  //   ),
                  // ),
                  child: CachedNetworkImage(
                    imageUrl: logoUrl,
                    width: 84.w,
                    height: 86.w,
                    fit: BoxFit.cover,
                    placeholder: (context, url) => Container(
                      width: 84.w,
                      height: 86.w,
                      alignment: Alignment.center,
                      child: const CircularProgressIndicator(strokeWidth: 1),
                    ),
                    errorWidget: (context, url, error) => Container(
                      width: 84.w,
                      height: 86.w,
                      color: Colors.grey.shade200,
                      alignment: Alignment.center,
                      child: const Icon(Icons.error, color: Colors.red),
                    ),
                    memCacheHeight: 86.w.toInt(),
                    cacheKey: logoUrl,
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 15,
                    vertical: 12,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AppText.s12w400BdS(
                        brand,
                        color: ColorName.darkGrey,
                        fontFamily: StringConstants.roboto,
                      ),
                      8.boxH,
                      AppText.s10w400LbS(
                        desc,
                        color: const Color(0xff717171),
                        fontFamily: StringConstants.roboto,
                        maxLines: 2,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
