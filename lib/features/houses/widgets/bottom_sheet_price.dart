import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../localization/extensions.dart';
import '../../../product/constants/constants.dart';
import '../../../utils/extensions.dart';
import '../../house_filters/widgets/price_selector_bottom_sheet_filter.dart';

class BottomPriceSelectorSheet extends StatefulWidget {
  const BottomPriceSelectorSheet({super.key});

  @override
  State<BottomPriceSelectorSheet> createState() =>
      _BottomPriceSelectorSheetState();
}

class _BottomPriceSelectorSheetState extends State<BottomPriceSelectorSheet> {
  final TextEditingController minPriceController = TextEditingController();
  final TextEditingController maxPriceController = TextEditingController();

  @override
  void dispose() {
    minPriceController.dispose();
    maxPriceController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        bottom: MediaQuery.of(context).viewInsets.bottom + 15.h,
      ),
      child: Container(
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
        ),
        padding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 8.w),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  icon: const Icon(Icons.close),
                  onPressed: () => Navigator.pop(context),
                ),
                Text(
                  context.translation.price,
                  style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w500,
                    fontFamily: StringConstants.roboto,
                  ),
                ),
                TextButton(
                  onPressed: () {
                    minPriceController.clear();
                    maxPriceController.clear();
                  },
                  child: Text(
                    context.translation.clean,
                    style: const TextStyle(
                      color: Color(0xff3A8BCF),
                      fontWeight: FontWeight.w500,
                      fontFamily: StringConstants.roboto,
                    ),
                  ),
                ),
              ],
            ),
            20.boxH,
            BottomPriceSelectorSheettFilter(
              minPriceController: minPriceController,
              maxPriceController: maxPriceController,
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
                  Navigator.pop(context, {
                    'min': int.tryParse(minPriceController.text),
                    'max': int.tryParse(maxPriceController.text),
                  });
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
