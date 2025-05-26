import 'package:common/common.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gen/gen.dart';

import '../../../core/components/app_text.dart';
import '../../../product/constants/constants.dart';
import '../../../remote/entities/houses/house_entity.dart';
import '../../../utils/extensions.dart';

class NotificationCard extends StatefulWidget {
  const NotificationCard({super.key, this.house});
  final HouseEntity? house;

  @override
  State<NotificationCard> createState() => _NotificationCardState();
}

class _NotificationCardState extends State<NotificationCard> {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width * 0.35;
    const aspect = 131 / 198;
    return InkWell(
      onTap: () {},
      child: ConstrainedBox(
        constraints: BoxConstraints(
          maxWidth: width,
        ),
        child: AspectRatio(
          aspectRatio: aspect,
          child: Container(
            //width: MediaQuery.of(context).size.width * 0.35,
            //padding:const EdgeInsets.symmetric(vertical: 12).h,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(9).r,
              border: Border.all(
                width: 1.w,
                color: const Color(0xFFDDDDDD),
              ),
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  blurRadius: 3.2,
                  color: const Color(0xFF000000).withOpacity(0.25),
                ),
              ],
            ),
            child: Column(
              children: [
                Flexible(
                  flex: 61,
                  child: Stack(
                    children: [
                      AspectRatio(
                        aspectRatio: 131/121,
                        child: ClipRRect(
                          borderRadius: BorderRadius.only(
                            topLeft: const Radius.circular(8).r,
                            topRight: const Radius.circular(8).r,
                          ),
                          child:const HousesNotCarouselSlider(
                            //imgUrls: widget.house!.images,
                          ),
                        ),
                      ),
                      Positioned(
                        top: 8,
                        right: 8,
                        child: Assets.icons.icFavoriteDarkFill.svg(package: 'gen'),
                      ),
                    ],
                  ),
                ),
                Flexible(
                  flex: 39,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 4).h,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        4.boxH,
                        Align(
                          alignment: Alignment.topLeft,
                          child: AppText.s14w400BdM(
                            'Kwartira', //widget.house!.name ?? '',
                            fontWeight: FontWeight.w400,
                            fontFamily: StringConstants.roboto,
                            fontSize: 12.sp,
                            color: const Color(0xFF000000),
                          ),
                        ),
                        Align(
                          alignment: Alignment.topLeft,
                          child: AppText.s14w400BdM(
                            'Şu gün 16:16', //widget.house!.createdAt ?? '',
                            fontSize: 10.sp,
                            fontFamily: StringConstants.roboto,
                            fontWeight: FontWeight.w400,
                            color: const Color(0xFF757575),
                          ),
                        ),
                        Align(
                          alignment: Alignment.topLeft,
                          child: AppText.s14w400BdM(
                            'Aşgabat-parahat 1', //widget.house!.location.parentName,
                            fontSize: 10.sp,
                            fontFamily: StringConstants.roboto,
                            fontWeight: FontWeight.w400,
                            color: const Color(0xFF757575),
                          ),
                        ),
                        Align(
                          alignment: Alignment.topLeft,
                          child: AppText.s14w400BdM(
                            '133 800 TMT', //widget.house!.price ?? '',
                            fontWeight: FontWeight.w400,
                            fontFamily: StringConstants.roboto,
                            fontSize: 12.sp,
                            color: const Color(0xFF000000),
                          ),
                        ),
                        4.boxH,
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class HousesNotCarouselSlider extends StatefulWidget {
  const HousesNotCarouselSlider({
    super.key,
    this.imgUrls,
  });

  final List<ImageUrl>? imgUrls;

  @override
  State<HousesNotCarouselSlider> createState() => _HousesCarouselSliderState();
}

class _HousesCarouselSliderState extends State<HousesNotCarouselSlider> {
  final PageController _controller = PageController(keepPage: false);
  final ValueNotifier<int> _pageNotifier = ValueNotifier<int>(0);
  List<String> images = [
    'assets/house.jpg',
    'assets/house.jpg',
    'assets/house.jpg',
    'assets/house.jpg',
    'assets/house.jpg',
  ];

  @override
  Widget build(BuildContext context) {
    //final width = MediaQuery.of(context).size.width * 0.35;
    const aspect = 131 / 121;
    return Stack(
      children: [
        PageView.builder(
          itemCount: images.length, //widget.imgUrls?.length,
          controller: _controller,
          onPageChanged: (value) => _pageNotifier.value = value,
          itemBuilder: (context, index) {
            //final img = widget.imgUrls?[index];
            final img = images[index];
            return AspectRatio(
              aspectRatio: aspect,
              child: OverflowBox(
                child: Image.asset(
                  img,
                  width: MediaQuery.of(context).size.width * 0.35,
                  fit: BoxFit.cover,
                ),
                // CustomNetworkImage(
                //   memCache: CustomMemCache(
                //     height: height.toInt().withDevicePixel(context),
                //     width: width.toInt().withDevicePixel(context),
                //   ),
                //   imageUrl: img?.url,
                // ),
              ),
            );
          },
        ),
        if ((images.length) > 2)
          Positioned(
            bottom: 6,
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
                      images.length,
                      (index) => AnimatedContainer(
                        duration: const Duration(milliseconds: 300),
                        width: index == (page % images.length)
                            ? 10.h * 0.5
                            : 10.h * 0.4,
                        height: index == (page % images.length)
                            ? 10.h * 0.5
                            : 10.h * 0.4,
                        margin: const EdgeInsets.symmetric(horizontal: 3).w,
                        decoration: BoxDecoration(
                          color: index == (page % images.length)
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
