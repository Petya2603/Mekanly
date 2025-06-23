import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gen/gen.dart';

import '../../../core/components/app_text.dart';
import '../../../product/constants/constants.dart';
import '../../../remote/entities/house_detail/house_detail_response.dart';
import '../../../utils/extensions.dart';
import '../../../utils/helpers.dart';

class RowMainInfoTile extends StatelessWidget {
  const RowMainInfoTile({super.key, this.typeOfHouseIcon, this.data});
  final Widget? typeOfHouseIcon;
  final HouseData? data;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          height: 16.w,
          width: 16.w,
          child: typeOfHouseIcon ?? Assets.icons.icLux.svg(package: 'gen'),
        ),
        10.boxW,
        AppText.s10w400LbS(
          'Elitka',
          fontFamily: StringConstants.roboto,
        ),
        10.boxW,
        _divider(),
        10.boxW,
        SizedBox(
          height: 16.w,
          width: 16.w,
          child: Assets.icons.icCalendar.svg(package: 'gen'),
        ),
        10.boxW,
        AppText.s10w400LbS(
          Helpers.formatDateAsMMDDYYYY(data?.updatedAt),
          fontFamily: StringConstants.roboto,
        ),
        10.boxW,
        _divider(),
        10.boxW,
        SizedBox(
          height: 16.w,
          width: 16.w,
          child: Assets.icons.icEye.svg(package: 'gen'),
        ),
        10.boxW,
        AppText.s10w400LbS(
          data?.viewed.toString() ?? '0',
          fontFamily: StringConstants.roboto,
        ),
      ],
    );
  }

  SizedBox _divider() {
    return SizedBox(
      height: 16.w,
      child: VerticalDivider(
        width: 3.w,
        indent: 1,
        endIndent: 1,
        color: const Color(0xffB3CFF4),
      ),
    );
  }
}
