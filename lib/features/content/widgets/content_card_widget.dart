// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/components/app_text.dart';
import '../../../product/constants/constants.dart';
import '../../../product/transitions/custom_page_route.dart';
import '../../../utils/extensions.dart';
import '../../house_detail/house_detail_view_owner.dart';
import '../content_view.dart';

class ContentCardWidget extends StatefulWidget {
  const ContentCardWidget({
    super.key,
    required this.id,
    this.imgUrls,
    this.title,
    this.description,
    this.price,
    this.status,
    this.statusColor,
    this.favorited,
    this.type,
    required this.onDeleted,
  });
  final int id;
  final List<String?>? imgUrls;
  final String? title;
  final String? description;
  final String? price;
  final String? status;
  final Color? statusColor;
  final String? type;

  final VoidCallback onDeleted;

  final bool? favorited;

  @override
  State<ContentCardWidget> createState() => _ContentCardWidgetState();
}

class _ContentCardWidgetState extends State<ContentCardWidget> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        final data = HouseDetailOwnerRoute(
          type: widget.type,
          imgUrl: widget.imgUrls,
          id: widget.id,
          status: widget.status,
          favorited: widget.favorited,
        );
        Navigator.push(
          context,
          // ignore: inference_failure_on_function_invocation
          CustomPageRoute.slide(
            HouseDetailViewOwner.builder(
              context,
              data,
              status: widget.status,
              type: widget.type,
            ),
          ),
        ).then((value) {
          if (value == true) {
            widget.onDeleted();
          }
        });
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8).r,
          color: const Color(0xFFFFFFFF),
          boxShadow: [
            BoxShadow(
              blurRadius: 3.2,
              // ignore: deprecated_member_use
              color: const Color(0xFF000000).withOpacity(0.25),
            ),
          ],
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              flex: 69,
              child: Stack(
                children: [
                  ContentHouseImageCarousel(
                    imgUrls: widget.imgUrls,
                  ),
                  _houseStatus(
                    widget.status,
                    widget.statusColor,
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 30,
              child: Padding(
                padding: const EdgeInsets.all(8).w,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: AppText.s14w400BdM(
                        widget.title ?? '',
                        fontFamily: StringConstants.roboto,
                        fontWeight: FontWeight.w400,
                        maxLines: 1,
                        fontSize: 12.sp,
                        overflow: TextOverflow.ellipsis,
                        color: const Color(0xFF222222),
                      ),
                    ),
                    2.boxH,
                    Expanded(
                      child: AppText.s14w400BdM(
                        widget.description ?? '',
                        fontFamily: StringConstants.roboto,
                        fontWeight: FontWeight.w400,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        fontSize: 11.sp,
                        color: const Color(0xFF757575),
                      ),
                    ),
                    2.boxH,
                    Expanded(
                      child: AppText.s14w400BdM(
                        '${widget.price ?? ''} TMT',
                        fontFamily: StringConstants.roboto,
                        fontWeight: FontWeight.w400,
                        fontSize: 12.sp,
                        color: const Color(0xFF222222),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _houseStatus(String? status, Color? statusColor) {
    if (status == null) return const SizedBox.shrink();
    return Positioned(
      top: 8,
      left: 6,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(40).r,
          border: Border.all(
            color: const Color(0xFFFFFFFF),
            width: 1.sp,
          ),
          gradient: const LinearGradient(
            colors: [
              Color(0xFFF1F1F1),
              Color(0xFFFFFFFF),
              Color(0xFFFFFFFF),
              Color(0xFFF1F1F1),
            ],
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 6,
            vertical: 2,
          ),
          child: Row(
            children: [
              Container(
                width: 6.sp,
                height: 6.sp,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: statusColor,
                ),
              ),
              4.boxW,
              AppText.s14w400BdM(
                status,
                fontSize: 10.sp,
                fontWeight: FontWeight.w400,
                fontFamily: StringConstants.roboto,
                color: const Color(0xFF222222),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
