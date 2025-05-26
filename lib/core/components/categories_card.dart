import 'package:common/common.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gen/gen.dart';

import '../../features/business_porfile/sub_category/mebel_we_interier_grid_view.dart';
import '../../remote/entities/business_profile/business_profile_category_entity.dart';
import '../../utils/extensions.dart';
import 'app_text.dart';

class CategoriesCard extends StatelessWidget {
  const CategoriesCard({super.key, this.categories});

  final List<BusinessProfileCategoryEntity>? categories;

  @override
  Widget build(BuildContext context) {
    return GridView(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        mainAxisSpacing: 7.w,
        crossAxisSpacing: 6.w,
        childAspectRatio: 107.w / 90.w,
      ),
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12).w,
      children: categories?.map((c) {
            return _CategoryCard(
              title: c.title ?? '',
              count: '${c.businessProfiles ?? 0}',
              icon: c.buildIcon,
            );
          }).toList() ??
          [],
    );
  }
}

class _CategoryCard extends StatelessWidget {
  const _CategoryCard({
    required this.title,
    required this.count,
    required this.icon,
  });
  final String title;
  final String count;
  final Widget icon;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: ColorName.lightGrayish,
          borderRadius: BorderRadius.circular(10).r,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 10,
                vertical: 8,
              ).w,
              child: AppText.s10w400LbS(
                title,
                color: ColorName.grayMediumDark,
              ),
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                6.boxW,
                Container(
                  margin: const EdgeInsets.only(bottom: 6).w,
                  alignment: Alignment.bottomCenter,
                  padding: count.length < 2
                      ? const EdgeInsets.all(6).w
                      : const EdgeInsets.all(4).w,
                  decoration: const BoxDecoration(
                    color: ColorName.superLightGray,
                    shape: BoxShape.circle,
                  ),
                  child: AppText.s10w400LbS(count),
                ),
                Expanded(
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: icon,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
