import 'dart:developer';
import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mobisell/utils/app_colors/app_colors.dart';

void printf(dynamic value) {
  if (!kReleaseMode) log(value.toString());
}

class CommonMethods {
  CommonMethods._();

  static hideKeyboard() {
    SystemChannels.textInput.invokeMethod('TextInput.hide');
  }

  static bool isValidEmail(String email) {
    final bool emailValid = RegExp(
            r"""^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+""")
        .hasMatch(email);
    return emailValid;
  }

  static bool equalsIgnoreCase(String? string1, String? string2) {
    return string1?.toLowerCase() == string2?.toLowerCase();
  }

  static void showBottomShit(
    BuildContext context,
    Widget? content,
  ) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: AppColors.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) {
        return Padding(
          padding: EdgeInsets.only(
                left: 20,
                right: 20,
                bottom: MediaQuery.of(context).viewInsets.bottom,
                top: 20,
              ) +
              const EdgeInsets.only(bottom: 50),
          child: SingleChildScrollView(
            child: content ?? const SizedBox.shrink(),
          ),
        );
      },
    );
  }

  static void showCustomSnackBar({
    required BuildContext context,
    String? text,
    bool isError = false,
  }) {
    Flushbar(
      titleColor: Colors.red,
      message: text ?? "Flush bar",
      flushbarPosition: FlushbarPosition.TOP,
      forwardAnimationCurve: Curves.easeOutCubic,
      reverseAnimationCurve: Curves.fastLinearToSlowEaseIn,
      boxShadows: [
        BoxShadow(
            color: Colors.blue.shade400,
            offset: const Offset(0.0, 2.0),
            blurRadius: 3.0)
      ],
      backgroundGradient:
          const LinearGradient(colors: [Colors.blueGrey, Colors.black]),
      duration: const Duration(seconds: 4),
      icon: Icon(
        isError ? Icons.report_rounded : Icons.done,
        color: isError ? AppColors.redCoral : Colors.green,
      ),
    )..show(context);
  }
}
