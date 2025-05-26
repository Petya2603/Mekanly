import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gen/gen.dart';

import '../../../core/components/app_text.dart';
import '../../../product/constants/constants.dart';

class OptionHolderSwitcher extends StatefulWidget {
  const OptionHolderSwitcher({
    super.key,
    required this.onChanged,
    this.padding,
    required this.isOwner,
  });

  final ValueChanged<bool> onChanged;
  final EdgeInsets? padding;
  final bool? isOwner;

  @override
  State<OptionHolderSwitcher> createState() => _OptionHolderSwitcherState();
}

class _OptionHolderSwitcherState extends State<OptionHolderSwitcher> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: widget.padding ?? EdgeInsets.symmetric(horizontal: 16.w),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8).r,
        border: Border.all(
          color: const Color(0xffEEEEEE),
          width: 1.w,
        ),
      ),
      child: Row(
        children: [
          Expanded(
            child: GestureDetector(
              onTap: () => widget.onChanged(true),
              child: AnimatedContainer(
                key: const Key('holder'),
                duration: const Duration(milliseconds: 300),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: widget.isOwner ?? false
                      ? ColorName.main
                      : const Color(0xffF3F3F3),
                  borderRadius: BorderRadius.only(
                    topLeft: const Radius.circular(8).r,
                    bottomLeft: const Radius.circular(8).r,
                  ),
                ),
                padding: const EdgeInsets.symmetric(vertical: 8).w,
                child: AppText.s12w400BdS(
                  'Eýesi',
                  color: widget.isOwner ?? false ? Colors.white : null,
                  fontFamily: StringConstants.roboto,
                ),
              ),
            ),
          ),
          const VerticalDivider(
            thickness: 2,
            endIndent: 0,
            indent: 0,
            width: 1,
          ),
          Expanded(
            child: GestureDetector(
              onTap: () => widget.onChanged(false),
              child: AnimatedContainer(
                key: const Key('not_holder'),
                duration: const Duration(milliseconds: 300),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: !(widget.isOwner ?? true)
                      ? ColorName.main
                      : const Color(0xffF3F3F3),
                  borderRadius: BorderRadius.only(
                    topRight: const Radius.circular(8).r,
                    bottomRight: const Radius.circular(8).r,
                  ),
                ),
                padding: const EdgeInsets.symmetric(vertical: 8).w,
                child: AppText.s12w400BdS(
                  'Reiltor',
                  color: !(widget.isOwner ?? true) ? Colors.white : null,
                  fontFamily: StringConstants.roboto,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
