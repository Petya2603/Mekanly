import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../core/components/app_text.dart';
import '../../../product/constants/constants.dart';
import '../../../utils/extensions.dart';

class TitledSwitcherWidget extends StatelessWidget {
  const TitledSwitcherWidget({
    super.key,
    required this.title,
    this.accepted = false,
    required this.onChanged,
    this.padding,
  });
  final String title;
  final bool accepted;
  final ValueChanged<bool> onChanged;
  final EdgeInsets? padding;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onChanged.call(!accepted),
      child: Container(
        padding: padding ?? EdgeInsets.symmetric(horizontal: 16.w),
        child: Row(
          children: [
            Expanded(
              child: AppText.s14w400BdM(
                title,
                fontSize: 15.sp,
                fontFamily: StringConstants.roboto,
              ),
            ),
            10.boxW,
            Transform.scale(
              scale: .7,
              child:
              // Switch(
              //   value: accepted,
              //   onChanged: (value) => onChanged.call(!accepted),
              //   activeTrackColor: const Color(0xFF3A8BCF),
              // ),
              CupertinoSwitch(
                value: accepted,
                activeTrackColor:const Color(0xFF3A8BCF),
                onChanged: (value) => onChanged.call(!accepted),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
