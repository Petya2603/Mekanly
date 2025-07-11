import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gen/gen.dart';
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
          height: 14.w,
          width: 12.923076629638672.w,
          child: typeOfHouseIcon ??
              Assets.icons.icCategoryDetail.svg(package: 'gen'),
        ),
        10.boxW,
        Text(
          '${data?.categoryName}',
          style: TextStyle(
            fontSize: 12.sp,
            fontWeight: FontWeight.w400,
            fontFamily: StringConstants.roboto,
            color: const Color.fromARGB(255, 35, 38, 43),
          ),
        ),
        10.boxW,
        _divider(),
        10.boxW,
        SizedBox(
          height: 11.373750686645508.w,
          width: 10.747504234313965.w,
          child: Assets.icons.icCalendar.svg(package: 'gen'),
        ),
        10.boxW,
        Text(
          Helpers.formatDate(DateTime.now()),
          style: TextStyle(
            fontSize: 12.sp,
            fontWeight: FontWeight.w400,
            fontFamily: StringConstants.roboto,
            color: const Color.fromARGB(255, 35, 38, 43),
          ),
        ),
        10.boxW,
        _divider(),
        10.boxW,
        SizedBox(
            height: 12.w,
            width: 13.561497688293457.w,
            child: Assets.icons.icEye.svg(package: 'gen')),
        10.boxW,
        Text(
          data?.viewed.toString() ?? '0',
          style: TextStyle(
            fontSize: 12.sp,
            fontWeight: FontWeight.w400,
            fontFamily: StringConstants.roboto,
            color: const Color.fromARGB(255, 35, 38, 43),
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
