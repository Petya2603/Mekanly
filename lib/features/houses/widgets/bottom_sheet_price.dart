import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../localization/extensions.dart';
import '../../../product/constants/constants.dart';
import '../../../utils/extensions.dart';
import '../../house_filters/widgets/price_selector_bottom_sheet.dart';

class BottomPriceSelectorSheet extends StatelessWidget {
  const BottomPriceSelectorSheet({super.key});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsGeometry.only(
        bottom: MediaQuery.of(context).viewInsets.bottom + 15.h,
      ),
      child: Container(
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
        ),
        padding: EdgeInsets.symmetric(vertical: 24.h, horizontal: 16.w),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 40.w,
              height: 4.h,
              decoration: BoxDecoration(
                color: Colors.grey[400],
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            16.boxH,
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
              Align(
                child: IconButton(
                  icon: const Icon(Icons.close),
                  onPressed: () => Navigator.pop(context, 'manuel'),
                ),
              ),
              Align(
                child: Text(
                  context.translation.price,
                  style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w500,
                    fontFamily: StringConstants.roboto,
                  ),
                ),
              ),
              TextButton(
                onPressed: () {},
                child: Text(
                  context.translation.clean,
                  style: const TextStyle(
                    color: Color(0xff3A8BCF),
                    fontWeight: FontWeight.w500,
                    fontFamily: StringConstants.roboto,
                  ),
                ),
              ),
            ]),
            20.boxH,
            BottomPriceSelectorSheett(
              minPriceController: TextEditingController(),
              maxPriceController: TextEditingController(),
            ),
            24.boxH,
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(vertical: 14.h),
                  backgroundColor: const Color(0xff3A8BCF),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text(
                  context.translation.verification,
                  style: const TextStyle(
                    fontFamily: StringConstants.roboto,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
