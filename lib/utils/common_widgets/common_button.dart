import 'package:flutter/material.dart';
import 'package:mobisell/utils/text_style/text_style.dart';

class CommonButton extends StatelessWidget {
  final String? text;
  final VoidCallback? onPressed;
  final Color? backgroundColor;
  final Color? textColor;
  final Color? borderColor;
  final double? width;
  final double? height;
  final double? borderRadius;
  final Widget? child;
  final bool? isOutlined;
  final EdgeInsets? padding;
  final TextStyle? textStyle;
  final double? fontSize;
  final FontWeight? fontWeight;

  const CommonButton({
    super.key,
    this.text,
    this.onPressed,
    this.backgroundColor,
    this.textColor,
    this.borderColor,
    this.width,
    this.height,
    this.borderRadius,
    this.child,
    this.isOutlined,
    this.padding,
    this.textStyle,
    this.fontSize,
    this.fontWeight,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width ?? double.infinity,
      height: height ?? 50,
      child: ElevatedButton(
        onPressed: onPressed ?? () {},
        style: ElevatedButton.styleFrom(
          backgroundColor: isOutlined == true ? Colors.transparent : (backgroundColor ?? Theme.of(context).primaryColor),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius ?? 8),
            side: isOutlined == true 
                ? BorderSide(
                    color: borderColor ?? backgroundColor ?? Theme.of(context).primaryColor,
                    width: 2
                  )
                : BorderSide.none,
          ),
          padding: padding ?? const EdgeInsets.symmetric(horizontal: 16),
        ),
        child: child ?? Text(
          text ?? '',
          style: textStyle ?? CommonStyle.getInterFont(
            fontSize: fontSize ?? 16,
            fontWeight: fontWeight ?? FontWeight.w600,
            color: isOutlined == true 
                ? (borderColor ?? backgroundColor ?? Theme.of(context).primaryColor)
                : (textColor ?? Colors.white),
          ),
        ),
      ),
    );
  }
} 