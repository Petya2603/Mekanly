import 'package:common/common.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gen/gen.dart';
import 'package:go_router/go_router.dart';

import '../../features/business_porfile_detail/business_porfile_detail_view.dart';
import '../../features/business_porfile_detail/models/business_profile_detail_response.dart';
import '../../product/constants/constants.dart';
import '../../remote/entities/business_profile/business_profile_entity.dart';
import '../../utils/extensions.dart';
import 'app_text.dart';

class BusinessProfileCard extends StatelessWidget {
  const BusinessProfileCard({super.key, this.profile});

  final BusinessProfileEntity? profile;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        if (profile?.id == null) return;
        context.push(
          BusinessProfileDetailView.routePath,
          extra: profile!.id,
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
                  child: CustomNetworkImage(
                    imageUrl: profile?.logo,
                    memCache: CustomMemCache(
                      height: 86.w.toInt().withDevicePixel(context),
                      width: 84.w.toInt().withDevicePixel(context),
                    ),
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
                        profile?.brand ?? '',
                        color: ColorName.darkGrey,
                        fontFamily: StringConstants.roboto,
                      ),
                      8.boxH,
                      AppText.s10w400LbS(
                        profile?.description?.tk ?? '',
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
