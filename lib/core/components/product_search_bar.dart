import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gen/gen.dart';
import 'package:mekanly/product/constants/app_colors.dart';
import 'package:mekanly/product/constants/app_dimensions.dart';

import 'search_field_business.dart';

class ProductSearchBar extends StatelessWidget {
  const ProductSearchBar({
    super.key,
    required this.onSearchTap,
    required this.onClearTap,
    required this.onFilterTap,
  });

  final VoidCallback onSearchTap;
  final VoidCallback onClearTap;
  final VoidCallback onFilterTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: ColorName.main,
        boxShadow: [
          BoxShadow(
            color: AppColors.searchBarShadow,
            offset: Offset(0, AppDimensions.searchBarShadowOffsetY),
            spreadRadius: AppDimensions.searchBarShadowSpreadRadius,
            blurRadius: AppDimensions.searchBarShadowBlurRadius,
          ),
        ],
      ),
      padding: EdgeInsets.symmetric(
        vertical: AppDimensions.searchBarPaddingVertical,
        horizontal: AppDimensions.searchBarPaddingHorizontal,
      ),
      child: Row(
        children: [
          Expanded(
            child: Padding(
              padding:
                  EdgeInsets.only(right: AppDimensions.searchBarRightPadding),
              child: SearchFieldBusiness(
                onSearchTap: onSearchTap,
                onClearTap: onClearTap,
              ),
            ),
          ),
          GestureDetector(
            onTap: onFilterTap,
            child: Assets.icons.icFilter.svg(
              package: 'gen',
              width: AppDimensions.searchBarFilterIconSize,
              height: AppDimensions.searchBarFilterIconSize,
            ),
          ),
        ],
      ),
    );
  }
}
