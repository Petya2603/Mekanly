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
          height: 20.w,
          width: 20.w,
          child: typeOfHouseIcon ?? Assets.icons.icLux.svg(package: 'gen'),
        ),
        10.boxW,
        Text(
          'Elitka',
          style: TextStyle(
            fontSize: 16.sp,
            fontWeight: FontWeight.w400,
            fontFamily: StringConstants.roboto,
            color: const Color(0xff555555),
          ),
        ),
        10.boxW,
        _divider(),
        10.boxW,
        SizedBox(
          height: 20.w,
          width: 20.w,
          child: Assets.icons.icCalendar.svg(package: 'gen'),
        ),
        10.boxW,
        Text(
          Helpers.formatDateAsMMDDYYYY(data?.updatedAt),
          style: TextStyle(
            fontSize: 16.sp,
            fontWeight: FontWeight.w400,
            fontFamily: StringConstants.roboto,
            color: const Color(0xff555555),
          ),
        ),
        10.boxW,
        _divider(),
        10.boxW,
        SizedBox(
          height: 20.w,
          width: 20.w,
          child: Assets.icons.icEye.svg(package: 'gen'),
        ),
        10.boxW,
        Text(
          data?.viewed.toString() ?? '0',
          style: TextStyle(
            fontSize: 16.sp,
            fontWeight: FontWeight.w400,
            fontFamily: StringConstants.roboto,
            color: const Color(0xff555555),
          ),
        ),
      ],
    );
  }

  SizedBox _divider() {
    return SizedBox(
      height: 16.w,
      child: VerticalDivider(
        width: 5.w,
        indent: 1,
        endIndent: 1,
        color: const Color(0xffB3CFF4),
      ),
    );
  }
}
