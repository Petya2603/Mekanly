import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class GradientBgContainer extends StatelessWidget {
  const GradientBgContainer({super.key, required this.child});
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(12, 13, 12, 18).w,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Color(0xffE4F1FA),
            Color(0xffE4F1FA),
            Color(0xffF0F7FC),
            Color(0xffF6FBFD),
            Color(0xffFFFFFF),
          ],
        ),
      ),
      child: child,
    );
  }
}
