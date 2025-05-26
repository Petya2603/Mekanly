import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gen/gen.dart';
import '../../../core/components/app_text.dart';
import '../../../product/constants/constants.dart';
import '../../../utils/extensions.dart';

class RoundedBlueBorderedChipBtn extends StatefulWidget {
  const RoundedBlueBorderedChipBtn({
    super.key,
    required this.onTap,
    required this.title,
    required this.icon,
  });
  final VoidCallback onTap;
  final String title;
  final Widget icon;

  @override
  State<RoundedBlueBorderedChipBtn> createState() =>
      _RoundedBlueBorderedChipBtnState();
}

class _RoundedBlueBorderedChipBtnState
    extends State<RoundedBlueBorderedChipBtn> {
  late bool isSelected = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          isSelected = !isSelected;
        });
        widget.onTap();
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6).w,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30).w,
          color: isSelected ? ColorName.houseChip : const Color(0xFFF6F6F6),
          border: Border.all(
            color: isSelected ? ColorName.chipIcon : const Color(0xFFE4E4E4),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            4.boxW,
            widget.icon,
            4.boxW,
            AppText.s14w400BdM(
              widget.title,
              color: isSelected ? ColorName.chipIcon : const Color(0xFF717171),
              fontSize: 11.sp,
              fontWeight: FontWeight.w400,
              fontFamily: StringConstants.roboto,
            ),
            4.boxW,
            Align(
              alignment: Alignment.centerRight,
              child: Icon(
                Icons.keyboard_arrow_down,
                size: 10,
                color:
                    isSelected ? ColorName.chipIcon : const Color(0xFF717171),
              ),
            ),
            4.boxW,
          ],
        ),
      ),
    );
  }
}
