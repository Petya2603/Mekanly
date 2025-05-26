import 'package:flutter/material.dart';
import 'package:gen/gen.dart';
import 'package:pinput/pinput.dart';

import '../../../../product/helpers/input_validators.dart';
import '../../../../utils/extensions.dart';

class PinPutWidget extends StatelessWidget {
  const PinPutWidget({
    super.key,
    this.onCompleted,
    this.onSubmitted,
    this.controller,
  });

  final TextEditingController? controller;

  final void Function(String)? onCompleted;
  final void Function(String)? onSubmitted;

  @override
  Widget build(BuildContext context) {
    final defaultPinTheme = PinTheme(
      width: 42,
      height: 35,
      textStyle: context.textTheme.bodyMedium,
      decoration: BoxDecoration(
        color: ColorName.white,
        border: Border.all(
          color: const Color(0xff717171),
        ),
        borderRadius: BorderRadius.circular(4),
      ),
    );

    final focusedPinTheme = defaultPinTheme.copyDecorationWith(
      border: Border.all(color: ColorName.black),
    );

    final submittedPinTheme = defaultPinTheme.copyWith(
      decoration: defaultPinTheme.decoration,
    );

    final errorPinTheme = defaultPinTheme.copyDecorationWith(
      border: Border.all(color: Colors.red),
    );
    final errorTextStyle = context.textTheme.bodySmall?.copyWith(
      color: Colors.red,
    );

    return Pinput(
      separatorBuilder: (index) => 10.boxW,
      length: 5,
      controller: controller,
      
      defaultPinTheme: defaultPinTheme,
      focusedPinTheme: focusedPinTheme,
      submittedPinTheme: submittedPinTheme,
      errorTextStyle: errorTextStyle,
      validator: validateRequiredInput,
      errorPinTheme: errorPinTheme,
      onCompleted: onCompleted,
      onSubmitted: onSubmitted,
    );
  }
}
