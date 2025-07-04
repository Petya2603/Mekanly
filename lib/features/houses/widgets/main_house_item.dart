import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gen/gen.dart';

import '../../../core/components/app_text.dart';
import '../../../core/components/common_porduct_card_widget.dart';
import '../../../product/constants/constants.dart';
import '../../../product/transitions/custom_page_route.dart';
import '../../../remote/entities/houses/house_entity.dart';
import '../../../utils/extensions.dart';
import '../../house_detail/house_detail_view.dart';

class MainHouseItem extends StatelessWidget {
  const MainHouseItem({super.key, this.house});

  final HouseEntity? house;

  @override
  Widget build(BuildContext context) {
    // Calculate aspect ratio once
    final width = context.mediaQuery.size.width - 40.w;
    final aspect = width / 235;

    return GestureDetector(
      onTap: () {
        if (house?.id == null) return;
        final imgs = house?.images?.map((e) => e.url).toList();
        final data = HouseDetailRoute(imgUrl: imgs, id: house?.id);
        Navigator.push(
          context,
          CustomPageRoute.slide(HouseDetailView.builder(context, data)),
        );
      },
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: ColorName.notifyShadow, width: 1.w),
          color: Colors.white,
          borderRadius: BorderRadius.circular(11).r,
          boxShadow: [
            BoxShadow(
              blurRadius: 7,
              color: Colors.black.withOpacity(0.25),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Image carousel with badges section
            _buildImageSection(aspect),

            Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 10, horizontal: 10).w,
              child: _buildContentSection(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildImageSection(double aspect) {
    return Stack(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.only(
            topLeft: const Radius.circular(11).r,
            topRight: const Radius.circular(11).r,
          ),
          child: AspectRatio(
            aspectRatio: aspect,
            child: HousesCarouselSlider(imgUrls: house?.images),
          ),
        ),
        Positioned(
          top: 12,
          left: 12,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4).w,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(40).r,
              border: Border.all(color: Colors.white, width: 1.w),
              gradient: const LinearGradient(
                colors: [
                  Color(0xffF1F1F1),
                  Color(0xffFFFFFF),
                  Color(0xffFFFFFF),
                  Color(0xffEFEFEF),
                ],
              ),
            ),
            child: AppText.s12w400BdS(
              house?.categoryName ?? '',
              fontFamily: StringConstants.roboto,
            ),
          ),
        ),
        // HALANLARYM
        Positioned(
          right: 12,
          top: 12,
          child: SizedBox(
            width: 24.w,
            height: 24.w,
            child: Assets.icons.icFavoriteDarkFill.svg(package: 'gen'),
          ),
        ),
      ],
    );
  }

  Widget checkCircleIcon({Color color = Colors.white, double size = 14}) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: color,
      ),
      child: Assets.icons.click.svg(package: 'gen'),
    );
  }

  Widget statusBadge(String text) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 243, 243, 243),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          checkCircleIcon(),
          const SizedBox(width: 6),
          Text(
            text,
            style: const TextStyle(
              color: Color.fromARGB(255, 113, 113, 113),
              fontSize: 12,
              fontFamily: StringConstants.roboto,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildContentSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Expanded(
              child: AppText.s16w400BdL(
                house?.name ?? '',
                fontFamily: StringConstants.roboto,
              ),
            ),
            SizedBox(
              width: 16.w,
              height: 16.w,
              child: Assets.icons.icComment.svg(package: 'gen'),
            ),
            SizedBox(width: 2.w),
            AppText.s10w400LbS(
              '(0)',
              fontFamily: StringConstants.roboto,
            ),
          ],
        ),
        //SUTAYDA duzettmeli goruldi gorulmedi

        if (house?.possibilities?.isNotEmpty ?? false) ...[
          SizedBox(height: 10.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  for (var i = 0; i < (house?.possibilities?.length ?? 0); i++)
                    house?.possibilities?[i].buildIcon() ??
                        const SizedBox.shrink(),
                ],
              ),
              Row(
                children: [
                  // ignore: use_if_null_to_convert_nulls_to_bools
                  if (house?.hasSeen == true) statusBadge('Görüldi'),
                  // ignore: use_if_null_to_convert_nulls_to_bools
                  if (house?.hasSeen == true && house?.contacted == true)
                    SizedBox(width: 8.w),
                  // ignore: use_if_null_to_convert_nulls_to_bools
                  if (house?.contacted == true) statusBadge('Habarlaşyldy'),
                ],
              ),
            ],
          ),
        ],

        SizedBox(height: 10.h),
        AppText.s12w400BdS(
          '${house?.location?.parentName}/${house?.location?.name} 02.08.2024',
          fontFamily: StringConstants.roboto,
          fontSize: 12.sp,
          color: ColorName.addressDate,
        ),
        SizedBox(height: 5.h),
        AppText.s12w400BdS(
          house?.description ?? '',
          fontFamily: StringConstants.roboto,
          fontSize: 12.sp,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          color: ColorName.addressDate,
        ),
        SizedBox(height: 8.h),
        Row(
          children: [
            Expanded(
              child: AppText.s14w400BdM(
                '${house?.price ?? ''} TMT',
                fontSize: 15.sp,
                fontFamily: StringConstants.roboto,
              ),
            ),
            SizedBox(
              width: 14.w,
              height: 14.w,
              child: Assets.icons.icVerified.svg(package: 'gen'),
            ),
          ],
        ),
      ],
    );
  }
}
