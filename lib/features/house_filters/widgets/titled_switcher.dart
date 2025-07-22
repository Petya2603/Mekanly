import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gen/gen.dart';

import '../../../core/components/app_text.dart';
import '../../../product/constants/constants.dart';
import '../../../utils/extensions.dart';

class MekanlyInfoDialog extends StatelessWidget {
  const MekanlyInfoDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.r),
      ),
      backgroundColor: Colors.white,
      child: Padding(
        padding: EdgeInsets.all(16.w),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Subtitle
            Text(
              'Habarnama',
              style: TextStyle(
                fontSize: 16.sp,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 12.h),

            // Description
            RichText(
              text: TextSpan(
                style: TextStyle(
                  fontSize: 12.sp,
                  color: Colors.black,
                  height: 1.5,
                ),
                children: const [
                  TextSpan(
                      text: 'Bu funksiya jaýyňyzy ',
                      style:
                          // ignore: lines_longer_than_80_chars
                          TextStyle(color: Color.fromARGB(255, 113, 113, 113),),),
                  TextSpan(
                    text: 'Dine Mekanly.com-da ',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(255, 113, 113, 113)),
                  ),
                  TextSpan(
                      text:
                          'platformasynda ýerleşdirýändigiňizi aňladýar. Funksiýany ulanmak bilen, bildirişiňiz her 3 günden bir awtomatiki öňe süýşüriler. Eger-de täze jaý goşulsa, siziň bildirişiňiz aşak süýşer. Bildirişiňiziň başga platformalarda ýerleşdirilendigi barada şikaýat gelse, bu funksiýa awtomatiki öçüriler.',
                      style:
                          TextStyle(color: Color.fromARGB(255, 113, 113, 113))),
                ],
              ),
            ),
            SizedBox(height: 16.h),

            // OK Button
            Align(
              alignment: Alignment.centerRight,
              child: TextButton(
                onPressed: () => Navigator.of(context).pop(),
                child: Text(
                  'OK',
                  style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.bold,
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

class TitledSwitcherWidget extends StatelessWidget {
  const TitledSwitcherWidget({
    super.key,
    required this.title,
    this.accepted = false,
    required this.onChanged,
    this.padding,
    this.showIcon = false,
  });
  final String title;
  final bool accepted;
  final ValueChanged<bool> onChanged;
  final EdgeInsets? padding;
  final bool showIcon;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onChanged.call(!accepted),
      child: Container(
        padding: padding ?? EdgeInsets.symmetric(horizontal: 16.w),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: AppText.s14w400BdM(
                      title,
                      fontSize: 15.sp,
                      fontFamily: StringConstants.roboto,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  if (showIcon) ...[
                    const SizedBox(width: 8),
                    GestureDetector(
                      onTap: () {
                        // ignore: inference_failure_on_function_invocation
                        showDialog(
                          context: context,
                          builder: (context) => const MekanlyInfoDialog(),
                        );
                      },
                      child: SizedBox(
                        width: 18.w,
                        height: 18.w,
                        child: Assets.icons.icHash.svg(package: 'gen'),
                      ),
                    ),
                  ],
                ],
              ),
            ),
            10.boxW,
            Transform.scale(
              scale: 0.7,
              child: CupertinoSwitch(
                value: accepted,
                activeTrackColor: const Color(0xFF3A8BCF),
                onChanged: (value) => onChanged.call(!accepted),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
