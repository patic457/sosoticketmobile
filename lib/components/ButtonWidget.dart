import 'package:flutter/material.dart';

class ButtonWidget extends StatelessWidget {
  final String? text;
  final bool isActive;
  final Color? bgColor;
  final Color? splashColor;
  final Color? borderColor;
  final double? borderRadius;
  final TextStyle? textStyle;
  final Color? textColor;
  final double? fontSize;
  final double? width;
  final double? minWidth;
  final double? height;
  final double? padding;
  final EdgeInsets? customPadding;
  final EdgeInsets? customPaddingEdge;
  final VoidCallback onPressed;
  final Widget? btnWidget;

  const ButtonWidget({
    Key? key,
    this.text,
    this.isActive = true,
    this.bgColor,
    this.splashColor,
    this.borderColor,
    this.borderRadius,
    this.textStyle,
    this.textColor,
    this.fontSize,
    this.minWidth,
    this.width,
    this.height,
    this.padding,
    required this.onPressed,
    this.customPadding,
    this.customPaddingEdge,
    this.btnWidget,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: bgColor,
        shape: const StadiumBorder(),
        padding: EdgeInsets.all(padding ?? 4.0),
        minimumSize: const Size.fromHeight(50),
      ).copyWith(elevation: ButtonStyleButton.allOrNull(0.9)),
      onPressed: onPressed,
      child: Text(
        text ?? '',
        style: TextStyle(fontSize: fontSize ?? 18.0),
      ),
    );
  }
}
