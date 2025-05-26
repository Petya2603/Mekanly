import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gen/gen.dart';

import '../../../core/components/app_text.dart';
import '../../../product/constants/constants.dart';
import '../../../utils/extensions.dart';

class AreaSliderWidget extends StatelessWidget {
  AreaSliderWidget({
    super.key,
    required this.onChanged,
    required this.rangeValues,
    required this.initValues,
  });

  final ValueChanged<RangeValues> onChanged;
  final RangeValues rangeValues;
  final RangeValues initValues;

  final MyCircleThumbShape<int> indicatorRangeSliderThumbShape =
      MyCircleThumbShape();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16).w,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AppText.s14w400BdM(
            'Umumy meýdany',
            fontFamily: StringConstants.roboto,
            fontSize: 15.sp,
          ),
          12.boxH,
          SliderTheme(
            data: SliderTheme.of(context).copyWith(
              overlayShape: SliderComponentShape.noOverlay,
              valueIndicatorColor: const Color(0xff1C80E3),
              rangeThumbShape: indicatorRangeSliderThumbShape,
              rangeTrackShape: const CustomRangeSliderTrackShape(),
              trackHeight: 2.w,
              activeTrackColor: const Color(0xff1C80E3),
              inactiveTrackColor: ColorName.houseChip,
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 6),
              child: RangeSlider(
                min: initValues.start,
                max: initValues.end,
                values: rangeValues,
                onChanged: onChanged,
              ),
            ),
          ),
          12.boxH,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  AppText.s10w400LbS(
                    'Mininum',
                    fontFamily: StringConstants.roboto,
                    color: const Color(0xff6A6A6A),
                    fontWeight: FontWeight.w500,
                  ),
                  6.boxH,
                  AreaChipWidget(
                    title: '${rangeValues.start.toInt()}',
                  ),
                ],
              ),
              Column(
                children: [
                  AppText.s10w400LbS(
                    'Maksimum',
                    fontFamily: StringConstants.roboto,
                    color: const Color(0xff6A6A6A),
                    fontWeight: FontWeight.w500,
                  ),
                  6.boxH,
                  AreaChipWidget(
                    title: '${rangeValues.end.toInt()}',
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class AreaChipWidget extends StatelessWidget {
  const AreaChipWidget({
    super.key,
    required this.title,
  });
  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 14).w,
      decoration: BoxDecoration(
        border: Border.all(
          color: const Color(0xffDDDDDD),
          width: 1.w,
        ),
        borderRadius: BorderRadius.circular(38).r,
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          AppText.s14w400BdM(
            '$title m²',
            fontSize: 13.sp,
            fontFamily: StringConstants.roboto,
          ),
        ],
      ),
    );
  }
}

class MyCircleThumbShape<T> extends RangeSliderThumbShape {
  MyCircleThumbShape({
    this.thumbRadius = 10.0,
    this.enabledThumbColor = const Color(0xffffffff),
    this.disabledThumbColor = const Color(0xffd3d3d3),
    this.borderColor = const Color(0xff3A8BCF),
    this.borderWidth = 3,
    this.elevation = 2,
    this.showInnerDot = true,
    this.innerDotColor = const Color(
      0xffD2F1FF,
    ),
    this.innerDotRadius = 9,
  });

  final double thumbRadius;
  final Color enabledThumbColor;
  final Color disabledThumbColor;
  final Color borderColor;
  final double borderWidth;
  final double elevation;
  final bool showInnerDot;
  final Color innerDotColor;
  final double innerDotRadius;

  @override
  Size getPreferredSize(bool isEnabled, bool isDiscrete) {
    return Size.fromRadius(thumbRadius);
  }

  @override
  void paint(
    PaintingContext context,
    Offset center, {
    required Animation<double> activationAnimation,
    required Animation<double> enableAnimation,
    required SliderThemeData sliderTheme,
    bool? isDiscrete,
    bool? isEnabled,
    bool? isOnTop,
    TextDirection? textDirection,
    Thumb? thumb,
    bool? isPressed,
  }) {
    final canvas = context.canvas;

    final thumbColor =
        (isEnabled ?? true) ? enabledThumbColor : disabledThumbColor;

    if (elevation > 0) {
      final shadowPath = Path()
        ..addOval(Rect.fromCircle(center: center, radius: thumbRadius));

      canvas.drawShadow(
        shadowPath,
        Colors.black,
        elevation,
        true,
      );
    }

    final fillPaint = Paint()
      ..color = thumbColor
      ..style = PaintingStyle.fill;

    // Draw the border
    final borderPaint = Paint()
      ..color = borderColor
      ..strokeWidth = borderWidth
      ..style = PaintingStyle.stroke;

    canvas
      ..drawCircle(center, thumbRadius, fillPaint)
      ..drawCircle(center, thumbRadius, borderPaint);

    if (showInnerDot) {
      final dotPaint = Paint()
        ..color = innerDotColor
        ..style = PaintingStyle.fill;

      canvas.drawCircle(center, innerDotRadius, dotPaint);
    }
  }
}

class CustomRangeSliderTrackShape extends RangeSliderTrackShape {
  const CustomRangeSliderTrackShape();

  @override
  Rect getPreferredRect({
    required RenderBox parentBox,
    Offset offset = Offset.zero,
    required SliderThemeData sliderTheme,
    bool isEnabled = false,
    bool isDiscrete = false,
  }) {
    final trackHeight = sliderTheme.trackHeight ?? 1.5;
    final trackLeft = offset.dx;
    final trackTop = offset.dy + (parentBox.size.height - trackHeight) / 2;
    final trackWidth = parentBox.size.width;
    return Rect.fromLTWH(trackLeft, trackTop, trackWidth, trackHeight);
  }

  @override
  void paint(
    PaintingContext context,
    Offset offset, {
    required RenderBox parentBox,
    required SliderThemeData sliderTheme,
    required Animation<double> enableAnimation,
    required Offset startThumbCenter,
    required Offset endThumbCenter,
    bool isEnabled = false,
    bool isDiscrete = false,
    required TextDirection textDirection,
  }) {
    if (sliderTheme.trackHeight == 0) {
      return;
    }

    final trackRect = getPreferredRect(
      parentBox: parentBox,
      offset: offset,
      sliderTheme: sliderTheme,
      isEnabled: isEnabled,
      isDiscrete: isDiscrete,
    );

    final activeTrackColorTween = ColorTween(
      begin: sliderTheme.disabledActiveTrackColor,
      end: sliderTheme.activeTrackColor,
    );
    final inactiveTrackColorTween = ColorTween(
      begin: sliderTheme.disabledInactiveTrackColor,
      end: sliderTheme.inactiveTrackColor,
    );
    final activeTrackColor = activeTrackColorTween.evaluate(enableAnimation)!;
    final inactiveTrackColor =
        inactiveTrackColorTween.evaluate(enableAnimation)!;

    final activePaint = Paint()..color = activeTrackColor;
    final inactivePaint = Paint()..color = inactiveTrackColor;

    final Offset leftThumbOffset;
    final Offset rightThumbOffset;
    switch (textDirection) {
      case TextDirection.rtl:
        leftThumbOffset = endThumbCenter;
        rightThumbOffset = startThumbCenter;
      case TextDirection.ltr:
        leftThumbOffset = startThumbCenter;
        rightThumbOffset = endThumbCenter;
    }

    sliderTheme.rangeThumbShape!.getPreferredSize(true, isDiscrete);

    context.canvas.drawRect(
      Rect.fromLTRB(
        trackRect.left,
        trackRect.top,
        leftThumbOffset.dx,
        trackRect.bottom,
      ),
      inactivePaint,
    );
    context.canvas.drawRect(
      Rect.fromLTRB(
        leftThumbOffset.dx,
        trackRect.top,
        rightThumbOffset.dx,
        trackRect.bottom,
      ),
      activePaint,
    );
    context.canvas.drawRect(
      Rect.fromLTRB(
        rightThumbOffset.dx,
        trackRect.top,
        trackRect.right,
        trackRect.bottom,
      ),
      inactivePaint,
    );
  }
}
